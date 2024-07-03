# 使用基础镜像
FROM ubuntu:20.04

# 设置环境变量，防止交互式安装时卡住
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的软件包和证书
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libicu-dev \
    ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
COPY appsettings.json .
COPY Lagrange.OneBot .
COPY lagrange-0.db .

# 暴露主动式ws端口
EXPOSE 8080

# 给予可执行权限
RUN chmod +x ./Lagrange.OneBot

# 容器启动时运行的命令
CMD ["./Lagrange.OneBot"]
