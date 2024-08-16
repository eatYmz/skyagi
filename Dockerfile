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

# 下载示例代理配置文件（如有必要）
RUN apt-get install -y git && \
    git clone https://github.com/litanlitudan/skyagi.git /app/skyagi && \
    cp -r /app/skyagi/examples /app/examples

# 设置环境变量（Coolify 将自动设置 OPENAI_API_KEY）
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# 暴露端口（如有必要）
EXPOSE 3010

# 启动 SkyAGI
CMD ["sh", "-c", "skyagi"]
