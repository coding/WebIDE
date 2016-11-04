# Coding WebIDE

README: [English](https://github.com/Coding/WebIDE/blob/master/README.md) | [中文](https://github.com/Coding/WebIDE/blob/master/README-zh.md)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/import.png)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/workspace.png)

Coding WebIDE(https://ide.coding.net) 是 Coding 自主研发的在线集成开发环境 (IDE)。用户可以通过 WebIDE 创建项目的工作空间, 进行在线开发, 调试等操作。同时 WebIDE 集成了 Git 代码版本控制, 用户可以选择 Coding、GitHub、BitBucket、GitLab 等任意的代码仓库。 WebIDE 还提供了分享开发环境的功能, 用户可以保存当前的开发环境, 分享给团队的其他成员。

[立即试用](https://ide.coding.net/ws/?ownerName=duwan&projectName=WordPress&isTry=true)

请诸位把 issues 提到对应的项目下，这样可以得到更及时的处理。前端请到 [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend/issues)，后端请到 [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend/issues).


## 功能特色

1. *全功能 Web Terminal*
2. *语法加亮*
3. *代码补全*
4. *主题切换*
5. *分割视图*
6. *VIM／Emacs 模式*
7. *实时预览*

本项目是为了能够一键启动 `WebIDE` 开源版而创建的，以 git 子模块的形式引用了另外的三个项目，分别是 WebIDE-Frontend、WebIDE-Frontend-Webjars、WebIDE-Backend。


## 模块说明

* [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend) WebIDE 前端项目
* [WebIDE-Frontend-Webjars](https://github.com/Coding/WebIDE-Frontend-Webjars) webjar 项目，用于将 WebIDE 前端打包成 webjar
* [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend) WebIDE 后端项目


## 运行环境

WebIDE Frontend 需要 **node v6.x** 作为编译运行环境（可以避免很多奇怪的错误），推荐使用 **yarn** 做包管理工具，做构建工具使用 **webpack** 和 **babel**

WebIDE-Frontend-Webjars & WebIDE-Backend 项目依赖 **maven3** 和 **java8**

运行该项目需要至少 512MB 的内存空间。在编译、运行项目前，请保证环境依赖已被正确配置。

## Server 版

从 Coding 克隆项目：
```
git clone git@git.coding.net:coding/WebIDE.git
```

从 Github 克隆项目：
```
git clone git@github.com:Coding/WebIDE.git
```

拉取子项目：
```
git submodule init
git submodule update
```
这样就会通过 git 的 submodule 机制 clone 另外 3 个 repo。

```
./ide.sh build   # 编译并打包前端项目  
./ide.sh run     # 启动项目
```

### 修改默认配置

`backend/src/main/resources/application.properties` 包括用户、项目、数据库等配置，可以通过修改配置定制服务：

* **SPACE_HOME:** 存放 workspace 的目录，默认为 ${"user.home"}/.workspace  
* **server.port:** 应用启动的端口  
* **USERNAME:** 用户名，git 提交时会使用该值作为 user.name，默认为 coding。
* **EMAIL:** 用户邮箱，git 提交时会使用该值作为 user.email，默认为 coding@coding.net  
* **AVATAR:** 用户头像
* **CODING_IDE_HOME:** 应用数据存放目录

修改配置后，需要重启应用。另外如果修改了 `USERNAME`、`EMAIL` 的值，会在创建新的 Workspace 时生效。

## docker 版

```
docker run -p 8080:8080 --name webide webide/webide
```

更多 docker 命令，参照 wiki [English](https://github.com/Coding/WebIDE/wiki/Docker-Server.en) [中文](https://github.com/Coding/WebIDE/wiki/Docker-Server.zh)
