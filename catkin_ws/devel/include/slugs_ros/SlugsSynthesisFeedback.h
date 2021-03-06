// Generated by gencpp from file slugs_ros/SlugsSynthesisFeedback.msg
// DO NOT EDIT!


#ifndef SLUGS_ROS_MESSAGE_SLUGSSYNTHESISFEEDBACK_H
#define SLUGS_ROS_MESSAGE_SLUGSSYNTHESISFEEDBACK_H


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
struct SlugsSynthesisFeedback_
{
  typedef SlugsSynthesisFeedback_<ContainerAllocator> Type;

  SlugsSynthesisFeedback_()
    : elapsed_time(0.0)  {
    }
  SlugsSynthesisFeedback_(const ContainerAllocator& _alloc)
    : elapsed_time(0.0)  {
    }



   typedef double _elapsed_time_type;
  _elapsed_time_type elapsed_time;




  typedef boost::shared_ptr< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct SlugsSynthesisFeedback_

typedef ::slugs_ros::SlugsSynthesisFeedback_<std::allocator<void> > SlugsSynthesisFeedback;

typedef boost::shared_ptr< ::slugs_ros::SlugsSynthesisFeedback > SlugsSynthesisFeedbackPtr;
typedef boost::shared_ptr< ::slugs_ros::SlugsSynthesisFeedback const> SlugsSynthesisFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "96ca6b8721a8bce34666176d169ab1f0";
  }

  static const char* value(const ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x96ca6b8721a8bce3ULL;
  static const uint64_t static_value2 = 0x4666176d169ab1f0ULL;
};

template<class ContainerAllocator>
struct DataType< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slugs_ros/SlugsSynthesisFeedback";
  }

  static const char* value(const ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# feedback\n\
float64 elapsed_time\n\
";
  }

  static const char* value(const ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.elapsed_time);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SlugsSynthesisFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::slugs_ros::SlugsSynthesisFeedback_<ContainerAllocator>& v)
  {
    s << indent << "elapsed_time: ";
    Printer<double>::stream(s, indent + "  ", v.elapsed_time);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SLUGS_ROS_MESSAGE_SLUGSSYNTHESISFEEDBACK_H
