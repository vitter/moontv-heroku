# Moontv Heroku 部署

这个项目演示如何通过 **Docker + Heroku 自动部署** 部署 [MoonTV](https://github.com/moontechlab/lunatv) 应用。

## ✅ 部署步骤

### 1. 推送到 GitHub
将以下文件上传到 GitHub 仓库：
- `Dockerfile`
- `heroku.yml`
- `.gitignore`
- `README.md`

### 2. 创建 Heroku 应用并连接 GitHub
- 登录 [Heroku Dashboard](https://dashboard.heroku.com/)
- 创建应用
- **Deploy → Deployment method → 选择 GitHub**
- 搜索并连接你的 GitHub 仓库
- 启用 **Automatic Deploys** 或点击 **Deploy Branch**

### 3. 配置环境变量
Heroku 会自动从 `heroku.yml` 中读取 `setup.config`，并写入到 Config Vars。

如果需要修改，可以到 **Heroku → Settings → Config Vars** 页面调整。

### 4. 启动应用
部署完成后，点击 **Open App** 打开应用。
