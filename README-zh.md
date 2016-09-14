# Coding WebIDE

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/import.png)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/workspace.png)

Coding WebIDE(https://ide.coding.net) 是 Coding 自主研发的在线集成开发环境 (IDE)。用户可以通过 WebIDE 创建项目的工作空间, 进行在线开发, 调试等操作。同时 WebIDE 集成了 Git 代码版本控制, 用户可以选择 Coding、GitHub、BitBucket 等任意的代码仓库。 WebIDE 还提供了分享开发环境的功能, 用户可以保存当前的开发环境, 分享给团队的其他成员。

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

> **WebIDE-Frontend:** WebIDE 前端项目
> **WebIDE-Frontend-Webjars:** webjar 项目，用于将 WebIDE 前端打包成 webjar
> **WebIDE-Backend:** WebIDE 后端项目

## Clone 项目

首先 clone 本项目到本地，然后拉取子项目:

> git submodule init
> git submodule update

即可拉取子项目到本地。

## 运行环境

**WebIDE Frontend 依赖 npm 做包管理，wepack 和 babel 做构建工具**
**WebIDE-Frontend-Webjars & WebIDE-Backend 项目依赖 maven**

在编译、运行项目前，请保证环境依赖已被正确配置。

## 编译、打包、运行

本项目提供了一个脚本 `ide.sh`，用于编译、打包、运行项目：

> **./ide.sh build:** 编译并打包前端项目
> **./ide.sh run:** 启动项目

启动完成后，默认端口为 8080，访问 localhost:8080 即可。
