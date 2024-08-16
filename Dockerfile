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

# 设置环境变量，确保 OPENAI_API_KEY 被正确传递
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# 运行 SkyAGI 配置命令 (假设有一个 `skyagi config set` 或其他命令)
# 将此部分替换为实际的配置命令
# RUN skyagi config set --key $OPENAI_API_KEY

# 启动 SkyAGI
CMD ["sh", "-c", "skyagi"]
