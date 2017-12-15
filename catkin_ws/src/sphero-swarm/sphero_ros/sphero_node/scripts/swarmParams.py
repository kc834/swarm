import numpy as np
import scipy as sp
import math


class sysParams(object):

	def __init__(self,n):
		# n spheros
		self.n = n
		#velocity
		self.inputLim = np.ones(n)
		# velocity based on distance (e.g. if 10 m away, go 10 m/s)
		self.kp = 30.0
		#Safe Distance from other spheros
		self.Ds = 0.35
		# Safe Distance from walls
		self.DsWall = 0.3
		# Defines how cautious the sphero will be when avoiding collisions.
		# Higher gamma means more cautious.
		self.gamma = 1
		self.closeEnoughPose = 0.1

		# deadlock. Usually doesn't happen.
		self.deadlockThreInput = 0.08
		self.kDelta = 2.0
		self.controlTurnAng = 3.0*math.pi/4




	# get initial poses
	def initPose(self):
		self.theta0 = 0
		self.radius = 1.5
		self.initPose = np.zeros([2,self.n])

		# self.initPose = pose

	# get goal poses
	def goalPose(self):
		self.goalPose = np.zeros([2,self.n])

		# self.goalPose = pose

	# sets the radius at which we have to start worrying about collisions
	def neighborRadius(self):
		self.Dneighbor = np.zeros(self.n)
		for i in xrange(self.n):
			betaMax = max(self.inputLim)
			self.Dneighbor[i] = self.Ds+((self.inputLim[i]+betaMax)/self.gamma)**(1.0/3)

		#return self

	# set current positions
	def getCurrentPose(self,pose):
		self.currentPose = pose
		#return self
