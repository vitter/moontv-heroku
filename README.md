# Moontv Heroku 部署

这个项目演示如何通过 **Docker + Heroku 自动部署** 部署 [MoonTV](https://github.com/moontechlab/lunatv) 应用。

## ✅ 部署步骤

### 1. 推送到 GitHub 或者  [![Fork本项目](https://img.shields.io/github/forks/vitter/Fork.svg?style=social&label=Fork)](https://github.com/vitter/moontv-heroku/fork) 

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
Heroku 会自动从 `heroku.yml` 中读取 `setup.config`，（本yml配置采用Upstash 存储，需要提前在 [upstash](https://upstash.com/)  注册账号并新建个 Redis 实例。复制数据库的 HTTPS ENDPOINT 和 TOKEN到配置文件）并写入到 Config Vars。（测试的时候好像有点问题，如果log里提示环境变量找不到请手动修改。）

如果需要修改，可以到 **Heroku → Settings → Config Vars** 页面调整。

### 4. 启动应用
部署完成后，点击 **Open App** 打开应用。

### 5. 自动部署应用 
.github/workflows/heroku-deploy.yml 这个GitHub Actions 工作流 CI/CD 自动部署到 Heroku，这样每次 push 就会自动触发部署。

需要在 **GitHub 仓库 → Settings → Secrets and variables → Actions → New repository secret**，添加两个 secret：
HEROKU_API_KEY：在 **Heroku Dashboard → Account settings → API Key**，复制你的 API key。
HEROKU_APP_NAME：你的 Heroku 应用名

.github/workflows/version-sync.yml 这个GitHub Actions 定时任务（cron）+ curl + git 提交更新LunaTV的最新版本文件。
这样当每次 LunaTV 发布新版本，你的项目也会自动跟进，然后就会触发上面的Heroku自动部署。

**项目主页**: https://github.com/vitter/moontv-heroku  
**问题反馈**: https://github.com/vitter/moontv-heroku/issues