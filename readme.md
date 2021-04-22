## uav_simulator

## 安装

git clone xxx
cd uav_simulator
catkin_make
./all.sh

## 说明
map_generator

- 订阅无人机的里程计（用于推断局部点云）

- 发布全局点云 [sensor_msgs::PointCloud2] - "/map_generator/global_cloud"，发布频率可设定
- 发布局部点云 [sensor_msgs::PointCloud2] - "/map_generator/local_cloud"，发布频率取决于里程计更新频率

- 参数：初始位置、地图尺寸、障碍物数量、障碍物密度、障碍物大小
- 生成圆柱和圆圈两种障碍物


mockamap

 - 发布全局点云[sensor_msgs::PointCloud2]
 - 点云生成是随机的，没有固定形状，整体逻辑map_generator复杂一点
 - 要配合pcl_render_node使用


pcl_render_node

 - 订阅无人机的里程计（用于推断局部点云）
 - 订阅全局点云 [sensor_msgs::PointCloud2]
 - 订阅局部点云（似乎没用上）

 - 发布局部点云 [sensor_msgs::PointCloud2] "rendered_pcl" 
 - 发布深度图 <sensor_msgs::Image> - "depth"
 - 发布图像信息 <sensor_msgs::Image> "depth"
 - 发布相机位姿 <geometry_msgs::PoseStamped> "camera_pose"

fake_drone

 - 订阅控制指令
 - 发布里程计数据
 - 忽略了无人机的动力学，直接将控制指令转化为里程计信息

so3_control

- 订阅控制指令 position_cmd
- 订阅里程计数据
- 发布so3底层控制指令
- 参数：控制增益

so3_quadrotor_siulator

- 订阅so3底层控制指令
- 订阅控制干扰量
- 发布无人机里程计、IMU信息
- 无人机物理参数及 动力学模型，更新无人机状态