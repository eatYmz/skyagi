# 使用官方的 Python 基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 安装 SkyAGI
RUN pip install --no-cache-dir --upgrade skyagi

# 暴露端口号（如果需要的话）
EXPOSE 3010

# 将 Coolify 中的环境变量设置为 OPENAI_API_KEY
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# 启动 SkyAGI 并运行配置
CMD ["sh", "-c", "skyagi config init && skyagi"]
