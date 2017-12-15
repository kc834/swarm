// Generated by gencpp from file slugs_ros/SlugsGetInputs.msg
// DO NOT EDIT!


#ifndef SLUGS_ROS_MESSAGE_SLUGSGETINPUTS_H
#define SLUGS_ROS_MESSAGE_SLUGSGETINPUTS_H

#include <ros/service_traits.h>


#include <slugs_ros/SlugsGetInputsRequest.h>
#include <slugs_ros/SlugsGetInputsResponse.h>


namespace slugs_ros
{

struct SlugsGetInputs
{

typedef SlugsGetInputsRequest Request;
typedef SlugsGetInputsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SlugsGetInputs
} // namespace slugs_ros


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::slugs_ros::SlugsGetInputs > {
  static const char* value()
  {
    return "9a51f646ec2ead8a886f766b3088eba7";
  }

  static const char* value(const ::slugs_ros::SlugsGetInputs&) { return value(); }
};

template<>
struct DataType< ::slugs_ros::SlugsGetInputs > {
  static const char* value()
  {
    return "slugs_ros/SlugsGetInputs";
  }

  static const char* value(const ::slugs_ros::SlugsGetInputs&) { return value(); }
};


// service_traits::MD5Sum< ::slugs_ros::SlugsGetInputsRequest> should match 
// service_traits::MD5Sum< ::slugs_ros::SlugsGetInputs > 
template<>
struct MD5Sum< ::slugs_ros::SlugsGetInputsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::slugs_ros::SlugsGetInputs >::value();
  }
  static const char* value(const ::slugs_ros::SlugsGetInputsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::slugs_ros::SlugsGetInputsRequest> should match 
// service_traits::DataType< ::slugs_ros::SlugsGetInputs > 
template<>
struct DataType< ::slugs_ros::SlugsGetInputsRequest>
{
  static const char* value()
  {
    return DataType< ::slugs_ros::SlugsGetInputs >::value();
  }
  static const char* value(const ::slugs_ros::SlugsGetInputsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::slugs_ros::SlugsGetInputsResponse> should match 
// service_traits::MD5Sum< ::slugs_ros::SlugsGetInputs > 
template<>
struct MD5Sum< ::slugs_ros::SlugsGetInputsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::slugs_ros::SlugsGetInputs >::value();
  }
  static const char* value(const ::slugs_ros::SlugsGetInputsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::slugs_ros::SlugsGetInputsResponse> should match 
// service_traits::DataType< ::slugs_ros::SlugsGetInputs > 
template<>
struct DataType< ::slugs_ros::SlugsGetInputsResponse>
{
  static const char* value()
  {
    return DataType< ::slugs_ros::SlugsGetInputs >::value();
  }
  static const char* value(const ::slugs_ros::SlugsGetInputsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SLUGS_ROS_MESSAGE_SLUGSGETINPUTS_H