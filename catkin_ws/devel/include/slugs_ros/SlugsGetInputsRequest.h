// Generated by gencpp from file slugs_ros/SlugsGetInputsRequest.msg
// DO NOT EDIT!


#ifndef SLUGS_ROS_MESSAGE_SLUGSGETINPUTSREQUEST_H
#define SLUGS_ROS_MESSAGE_SLUGSGETINPUTSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace slugs_ros
{
template <class ContainerAllocator>
struct SlugsGetInputsRequest_
{
  typedef SlugsGetInputsRequest_<ContainerAllocator> Type;

  SlugsGetInputsRequest_()
    {
    }
  SlugsGetInputsRequest_(const ContainerAllocator& _alloc)
    {
    }






  typedef boost::shared_ptr< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SlugsGetInputsRequest_

typedef ::slugs_ros::SlugsGetInputsRequest_<std::allocator<void> > SlugsGetInputsRequest;

typedef boost::shared_ptr< ::slugs_ros::SlugsGetInputsRequest > SlugsGetInputsRequestPtr;
typedef boost::shared_ptr< ::slugs_ros::SlugsGetInputsRequest const> SlugsGetInputsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace slugs_ros

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'slugs_ros': ['/home/kchaudhari/catkin_ws/src/LTL_stack/slugs_ros/msg', '/home/kchaudhari/catkin_ws/devel/share/slugs_ros/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slugs_ros/SlugsGetInputsRequest";
  }

  static const char* value(const ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SlugsGetInputsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::slugs_ros::SlugsGetInputsRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // SLUGS_ROS_MESSAGE_SLUGSGETINPUTSREQUEST_H