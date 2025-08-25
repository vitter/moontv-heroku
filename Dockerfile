# 继承官方镜像
FROM ghcr.io/moontechlab/lunatv:latest

# 设置 Heroku 使用的端口环境变量（Heroku 将自动注入 $PORT）
ENV PORT=${PORT:-3000}

EXPOSE 3000

# 使用镜像的默认启动机制：运行 node start.js
CMD ["node", "start.js"]
