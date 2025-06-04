# 🌐 TinyHTTPd Multi-Language CGI Programs

## 🔧 系统工具安装与配置指南

```bash
apt-get update && \   # 更新包索引；安装基础C/C++编译工具链(build-essential)和跨平台构建工具(cmake)
apt-get install -y build-essential cmake
```


## 🌐 网络调试工具集 


```bash
# 第一组：基础系统和网络工具
sudo apt install -y \
 net-tools \        # ifconfig, netstat 等传统网络工具
 curl \             # 多协议数据传输工具，支持HTTP/HTTPS/FTP
 wget \             # 非交互式网络下载工具，支持断点续传
 netcat-openbsd \   # 网络调试工具，端口扫描和数据传输测试
 iproute2 \         # 现代网络工具集，ip命令替代ifconfig
 htop \             # 彩色交互式进程监视器，实时系统资源显示
 tree \             # 目录结构可视化工具，树状图显示文件夹
 vim \              # 高级文本编辑器，语法高亮和插件支持
 nano \             # 简单文本编辑器，直观操作适合快速编辑
 perl \             # Perl解释器，文本处理和正则表达式专家
 libcgi-pm-perl     # Perl CGI模块，Web表单和HTTP处理支持
```


## 💻 多语言运行环境
```bash
sudo apt-get install -y \
 python3 \          # Python解释器，数据处理和科学计算
 python3-pip \      # Python包管理器，安装第三方库和模块
 php-cli \          # PHP命令行接口，服务器端Web开发
 nodejs \           # JavaScript运行时，现代异步Web应用开发
 npm \              # Node.js包管理器，JavaScript模块依赖管理
 bc                 # 任意精度计算器，Shell脚本高精度数学运算
```

## ⚡项目构建和编译
```bash
mkdir -p build && cd build    # 创建构建目录并切换到该目录
cmake .. && make              # 使用cmake生成Makefile并编译项目

# CGI程序权限设置
chmod +x htdocs/cgi-bin/*.cgi    # 设置C++编译的CGI程序可执行权限
chmod +x htdocs/cgi-bin/*.py     # 设置Python脚本可执行权限
chmod +x htdocs/cgi-bin/*.php    # 设置PHP脚本可执行权限
chmod +x htdocs/cgi-bin/*.pl     # 设置Perl脚本可执行权限
chmod +x htdocs/cgi-bin/*.sh     # 设置Shell脚本可执行权限
chmod +x htdocs/cgi-bin/*.js     # 设置Node.js脚本可执行权限

./httpd                          # 运行编译生成的TinyHTTPd服务器
```

## ⚡ CGI执行原理
- 📤 HTTP头部输出 (最少包含: Content-type) 📝 空行分隔 头部与正文内容 🔄 环境变量输入 通过环境变量和 stdin 接收数据 🔍 查询参数通过 QUERY_STRING 环境变量获取
- 🏎️ C++ 的高性能系统编程 🐍 Python 的数据处理能力 🌟 PHP 的 Web 开发便利性 🥷 Perl 的文本处理强大功能 🛡️ Bash 的系统自动化能力 🚀 Node.js 的现代异步编程
- 🌈 多语言Web编程 🔌 CGI接口实现 🌐 HTTP/1.0协议处理 ⚡ 服务器端动态内容生成
