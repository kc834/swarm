// Generated by gencpp from file slugs_ros/SlugsInitExecutionStringRequest.msg
// DO NOT EDIT!


#ifndef SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONSTRINGREQUEST_H
#define SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONSTRINGREQUEST_H


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
struct SlugsInitExecutionStringRequest_
{
  typedef SlugsInitExecutionStringRequest_<ContainerAllocator> Type;

  SlugsInitExecutionStringRequest_()
    : init_inputs_outputs()  {
    }
  SlugsInitExecutionStringRequest_(const ContainerAllocator& _alloc)
    : init_inputs_outputs(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _init_inputs_outputs_type;
  _init_inputs_outputs_type init_inputs_outputs;




  typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SlugsInitExecutionStringRequest_

typedef ::slugs_ros::SlugsInitExecutionStringRequest_<std::allocator<void> > SlugsInitExecutionStringRequest;

typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionStringRequest > SlugsInitExecutionStringRequestPtr;
typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionStringRequest const> SlugsInitExecutionStringRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace slugs_ros

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'slugs_ros': ['/home/kchaudhari/catkin_ws/src/LTL_stack/slugs_ros/msg', '/home/kchaudhari/catkin_ws/devel/share/slugs_ros/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a90267b3a8111b10f13c8738b625a849";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa90267b3a8111b10ULL;
  static const uint64_t static_value2 = 0xf13c8738b625a849ULL;
};

template<class ContainerAllocator>
struct DataType< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slugs_ros/SlugsInitExecutionStringRequest";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string init_inputs_outputs\n\
";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.init_inputs_outputs);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SlugsInitExecutionStringRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::slugs_ros::SlugsInitExecutionStringRequest_<ContainerAllocator>& v)
  {
    s << indent << "init_inputs_outputs: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.init_inputs_outputs);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONSTRINGREQUEST_H
