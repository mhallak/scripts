#!/usr/bin/python3
# source ros2 environment first: source /opt/ros/eloquent/setup.bash

import rclpy
rclpy.init()
node = rclpy.create_node('list_all_topics_example')
print(node.get_topic_names_and_types(no_demangle=True))
