# Contains information required to decode disparity to depth
#
# When using align to RGB, the original baseline and focal length is lost,
# so this message provides the necessary info
#
# Practically, this is a workaround to poor python->ros interop.  If other nodes
# are written in C++ and we can use intraprocess communication, then we can just
# pass decompressed messages from here instead.
#
# Structure borrowed from: stereo_msgs/DisparityImage
std_msgs/Header header

# Stereo geometry. For disparity d, the depth from the camera is Z = fT/d.
float32 f # Focal length, pixels
float32 t # Baseline, world units

# Subwindow of (potentially) valid disparity values.
sensor_msgs/RegionOfInterest valid_window

# The range of disparities searched.
# In the disparity image, any disparity less than min_disparity is invalid.
# The disparity search range defines the horopter, or 3D volume that the
# stereo algorithm can "see". Points with Z outside of:
#     Z_min = fT / max_disparity
#     Z_max = fT / min_disparity
# could not be found.
float32 min_disparity
float32 max_disparity

# Smallest allowed disparity increment. The smallest achievable depth range
# resolution is delta_Z = (Z^2/fT)*delta_d.
float32 delta_d