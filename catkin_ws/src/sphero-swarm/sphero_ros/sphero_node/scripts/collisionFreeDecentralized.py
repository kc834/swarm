import numpy as np
import scipy as sp

import math

import cvxopt
from cvxopt import solvers


# Ensures that the two spheros are a safe distance apart from each other
def ZCBFfun(statei,statej,safeDis):

	# Get differences in states
	sTmp1 = statei[0,0]-statej[0,0]
	sTmp2 = statei[0,1]-statej[0,1]

	# Make a matrix
	deltaPij = np.matrix([[sTmp1],[sTmp2]])

	# Positive if this is a safe distance away
	h = np.linalg.norm(deltaPij)-safeDis

	return h

# Returns the velocity of the sphero from currentPose to goalPosition without
# accounting for collisions.
def singleNominalController(currentState,goalPosition,kp,uLim):

	# If there is only 1 row, transpose
	if len(currentState) < 2:
		currentState = currentState.transpose()

	if len(goalPosition) < 2:
		goalPosition = goalPosition.transpose()

	# Get positions
	px = currentState[0]
	py = currentState[1]

	pxGoal = goalPosition[0]
	pyGoal = goalPosition[1]

	# Get change in position, multiply by kp, which is a velocity scaling factor,
	# to get the non-collision x and y velocity. Want to keep the time to reach
	# the goal consistent.
	vx = kp*(pxGoal-px)
	vy = kp*(pyGoal-py)

	# math.fabs gives floating point absolute value. If either > uLim (a max vel)
	if math.fabs(vx) > uLim or math.fabs(vy) > uLim:

		# Change the larger v to 1 and the smaller v to a fraction of ULim
		uLarge = max(math.fabs(vx),math.fabs(vy))
		vx = uLim*vx/uLarge
		vy = uLim*vy/uLarge

	# tuple
	return (vx,vy)

# Finds the point on the wall that is closest to the sphero
def closeStaticPoint(singleState,wall):

	# Position of sphero
	x0 = singleState[0,0]
	y0 = singleState[1,0]

	#Coordinates of a single wall from (x1,y1) to (x2,y2)
	x1 = wall[0,0]
	y1 = wall[0,1]
	x2 = wall[0,2]
	y2 = wall[0,3]

	# Take the dot product of vectors. Kinda represents the slope of the line
	# (wall). The value of t is determined by the angle between the two vectors.
	t = ((x2-x1)*(x0-x1)+(y2-y1)*(y0-y1))/((x2-x1)**2+(y2-y1)**2)

	# If the dot product is negative, closest point is (x1, y1)
	if t < 0:
		xClose = x1
		yClose = y1
	# If the dot product is between zero and one, then the sphero is somewhere
	# between x1 and y1. Scale x and y accordingly.
	elif t <= 1:
		xClose = x1+t*(x2-x1)
		yClose = y1+t*(y2-y1)
	# If the dot product is greater than 1, then the closest point is (x2, y2)
	else:
		xClose = x2
		yClose = y2

	# Make a matrix
	point = np.matrix([[xClose],[yClose]])

	return point


# Initializes all of the constraints upon the system
def quadProgramConstraints(statei,i,statesNeighbor,indNeighbor,sphero,map):
	# 2x1 array of negative ones
	lb = -sphero.inputLim[i]*np.ones((2,1))
	# 2x1 array of ones
	ub = -lb

	if len(statesNeighbor) != 0:
		# get the number of neigboring spheros.
		nNeighbor = int(statesNeighbor.shape[1])

		# make arrays
		A1 = np.zeros((nNeighbor,2))
		b1 = np.zeros((nNeighbor,1))

		for jj in xrange(nNeighbor):
			# Columns of A1 are negative the distance between states
			A1[jj,0] = -(statei[0,0]-statesNeighbor[0,jj])
			A1[jj,1] = -(statei[1,0]-statesNeighbor[1,jj])

			# Get distance between states
			statej = statesNeighbor[:,jj].transpose()
			hij = ZCBFfun(statei.transpose(),statej,sphero.Ds)

			# Copy array as ints
			jjInd = indNeighbor[0,jj].astype(int)


			factor = sphero.inputLim[i]/(sphero.inputLim[i]+sphero.inputLim[jjInd-1])


			b1[[jj],:] = sphero.gamma*(hij**3)*np.linalg.norm(statei.transpose()-statej)*factor

			#print b1[jj,:]

	else:
		A1 = np.matrix([])
		b1 = np.matrix([])


	nWall = len(map[:,0])

	A2 = np.zeros((nWall,2))
	b2 = np.zeros((nWall,1))

	for jj in xrange(nWall):
		closePoint = closeStaticPoint(statei,map[jj,:])

		A2[jj,0] = -(statei[0]-closePoint[0])
		A2[jj,1] = -(statei[1]-closePoint[1])

		hij = ZCBFfun(statei.transpose(),closePoint.transpose(),sphero.DsWall)

		b2[jj,:] = sphero.gamma*(hij**3)*np.linalg.norm(statei-closePoint)


	A3 = np.identity(2)
	b3 = ub
	A4 = -np.identity(2)
	b4 = -lb

	A = np.vstack((A1,A2,A3,A4))
	b = np.vstack((b1,b2,b3,b4))

	'''for k in xrange(len(A[:,0])):
		ATmp = np.sum(abs(A[k,:]))
		A[k,0] = A[k,0]/ATmp
		A[k,1] = A[k,1]/ATmp

		b[k,0] = b[k,0]/ATmp'''


	return (A,b)

# Creates a new velocity for the spheros if collision is imminent
def actualController(statei,i,statesNeighbor,indNeighbor,sphero,map):

	# singleNominalController(currentState,goalPosition,kp,uLim)
	(uxTmp,uyTmp) = singleNominalController(statei.transpose(),sphero.goalPose[:,i].transpose(),sphero.kp,sphero.inputLim[i])

	# Turn array into scalar
	uxTmp = np.asscalar(uxTmp)
	uyTmp = np.asscalar(uyTmp)

	# Turn scalars into a 2D matrix
	uNominal = np.matrix([[uxTmp],[uyTmp]])

	# Get identity matrix
	H = np.identity(2)
	# Negate uNominal
	f = -uNominal

	# some optimization jazz that i don't understand
	(A,b) = quadProgramConstraints(statei,i,statesNeighbor,indNeighbor,sphero,map)
		# wut?
        solvers.options['show_progress'] = False
        cvxopt.solvers.options['show_progress'] = False
	uSol = cvxopt.solvers.qp(cvxopt.matrix(H),cvxopt.matrix(f),cvxopt.matrix(A),cvxopt.matrix(b))
	uActual = uSol['x']

	# for deadlock
	'''if np.linalg.norm(statei-sphero.goalPose[:,i]) > 2*sphero.closeEnoughPose and np.linalg.norm(uActual) < sphero.deadlockThreInput:
		matTmp = np.matrix([[math.cos(sphero.controlTurnAng),-math.sin(sphero.controlTurnAng)],[math.sin(sphero.controlTurnAng),math.cos(sphero.controlTurnAng)]])
		uActual = uActual+sphero.kDelta*np.dot(matTmp,uNominal)
		print "deadlock!!!" '''

	return uActual
