// Generated by gencpp from file slugs_ros/SlugsInitExecutionArrayResponse.msg
// DO NOT EDIT!


#ifndef SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONARRAYRESPONSE_H
#define SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONARRAYRESPONSE_H


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
struct SlugsInitExecutionArrayResponse_
{
  typedef SlugsInitExecutionArrayResponse_<ContainerAllocator> Type;

  SlugsInitExecutionArrayResponse_()
    : current_inputs_outputs_key_array()
    , current_inputs_outputs_value_array()  {
    }
  SlugsInitExecutionArrayResponse_(const ContainerAllocator& _alloc)
    : current_inputs_outputs_key_array(_alloc)
    , current_inputs_outputs_value_array(_alloc)  {
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _current_inputs_outputs_key_array_type;
  _current_inputs_outputs_key_array_type current_inputs_outputs_key_array;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _current_inputs_outputs_value_array_type;
  _current_inputs_outputs_value_array_type current_inputs_outputs_value_array;




  typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SlugsInitExecutionArrayResponse_

typedef ::slugs_ros::SlugsInitExecutionArrayResponse_<std::allocator<void> > SlugsInitExecutionArrayResponse;

typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionArrayResponse > SlugsInitExecutionArrayResponsePtr;
typedef boost::shared_ptr< ::slugs_ros::SlugsInitExecutionArrayResponse const> SlugsInitExecutionArrayResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5e14cda430bc8fea061fcf89f06601c1";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5e14cda430bc8feaULL;
  static const uint64_t static_value2 = 0x061fcf89f06601c1ULL;
};

template<class ContainerAllocator>
struct DataType< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "slugs_ros/SlugsInitExecutionArrayResponse";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string[] current_inputs_outputs_key_array\n\
bool[]   current_inputs_outputs_value_array\n\
\n\
";
  }

  static const char* value(const ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.current_inputs_outputs_key_array);
      stream.next(m.current_inputs_outputs_value_array);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SlugsInitExecutionArrayResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::slugs_ros::SlugsInitExecutionArrayResponse_<ContainerAllocator>& v)
  {
    s << indent << "current_inputs_outputs_key_array[]" << std::endl;
    for (size_t i = 0; i < v.current_inputs_outputs_key_array.size(); ++i)
    {
      s << indent << "  current_inputs_outputs_key_array[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.current_inputs_outputs_key_array[i]);
    }
    s << indent << "current_inputs_outputs_value_array[]" << std::endl;
    for (size_t i = 0; i < v.current_inputs_outputs_value_array.size(); ++i)
    {
      s << indent << "  current_inputs_outputs_value_array[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.current_inputs_outputs_value_array[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SLUGS_ROS_MESSAGE_SLUGSINITEXECUTIONARRAYRESPONSE_H
