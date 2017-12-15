# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from slugs_ros/SlugsInitExecutionArrayRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class SlugsInitExecutionArrayRequest(genpy.Message):
  _md5sum = "9c6fecc1d2549f0668d693132538a5c2"
  _type = "slugs_ros/SlugsInitExecutionArrayRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string[] init_inputs_outputs_key_array
bool[]   init_inputs_outputs_value_array

"""
  __slots__ = ['init_inputs_outputs_key_array','init_inputs_outputs_value_array']
  _slot_types = ['string[]','bool[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       init_inputs_outputs_key_array,init_inputs_outputs_value_array

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SlugsInitExecutionArrayRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.init_inputs_outputs_key_array is None:
        self.init_inputs_outputs_key_array = []
      if self.init_inputs_outputs_value_array is None:
        self.init_inputs_outputs_value_array = []
    else:
      self.init_inputs_outputs_key_array = []
      self.init_inputs_outputs_value_array = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.init_inputs_outputs_key_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.init_inputs_outputs_key_array:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *val1))
        else:
          buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.init_inputs_outputs_value_array)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.pack(pattern, *self.init_inputs_outputs_value_array))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.init_inputs_outputs_key_array = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.init_inputs_outputs_key_array.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.init_inputs_outputs_value_array = struct.unpack(pattern, str[start:end])
      self.init_inputs_outputs_value_array = map(bool, self.init_inputs_outputs_value_array)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.init_inputs_outputs_key_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.init_inputs_outputs_key_array:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *val1))
        else:
          buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.init_inputs_outputs_value_array)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.init_inputs_outputs_value_array.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.init_inputs_outputs_key_array = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.init_inputs_outputs_key_array.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.init_inputs_outputs_value_array = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.init_inputs_outputs_value_array = map(bool, self.init_inputs_outputs_value_array)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from slugs_ros/SlugsInitExecutionArrayResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class SlugsInitExecutionArrayResponse(genpy.Message):
  _md5sum = "5e14cda430bc8fea061fcf89f06601c1"
  _type = "slugs_ros/SlugsInitExecutionArrayResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string[] current_inputs_outputs_key_array
bool[]   current_inputs_outputs_value_array


"""
  __slots__ = ['current_inputs_outputs_key_array','current_inputs_outputs_value_array']
  _slot_types = ['string[]','bool[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       current_inputs_outputs_key_array,current_inputs_outputs_value_array

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SlugsInitExecutionArrayResponse, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.current_inputs_outputs_key_array is None:
        self.current_inputs_outputs_key_array = []
      if self.current_inputs_outputs_value_array is None:
        self.current_inputs_outputs_value_array = []
    else:
      self.current_inputs_outputs_key_array = []
      self.current_inputs_outputs_value_array = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.current_inputs_outputs_key_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.current_inputs_outputs_key_array:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *val1))
        else:
          buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.current_inputs_outputs_value_array)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.pack(pattern, *self.current_inputs_outputs_value_array))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.current_inputs_outputs_key_array = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.current_inputs_outputs_key_array.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.current_inputs_outputs_value_array = struct.unpack(pattern, str[start:end])
      self.current_inputs_outputs_value_array = map(bool, self.current_inputs_outputs_value_array)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.current_inputs_outputs_key_array)
      buff.write(_struct_I.pack(length))
      for val1 in self.current_inputs_outputs_key_array:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        if python3:
          buff.write(struct.pack('<I%sB'%length, length, *val1))
        else:
          buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.current_inputs_outputs_value_array)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.current_inputs_outputs_value_array.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.current_inputs_outputs_key_array = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.current_inputs_outputs_key_array.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.current_inputs_outputs_value_array = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.current_inputs_outputs_value_array = map(bool, self.current_inputs_outputs_value_array)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
class SlugsInitExecutionArray(object):
  _type          = 'slugs_ros/SlugsInitExecutionArray'
  _md5sum = '25d40750652088a9108edad12a666cca'
  _request_class  = SlugsInitExecutionArrayRequest
  _response_class = SlugsInitExecutionArrayResponse
