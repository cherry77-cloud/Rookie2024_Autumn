cmake_minimum_required(VERSION 3.10)
project(TinyHTTPd C)

# 设置C标准
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# 查找线程库
find_package(Threads REQUIRED)

# 编译服务器
add_executable(httpd httpd.c)
target_link_libraries(httpd Threads::Threads)

# 编译客户端
add_executable(client simpleclient.c)