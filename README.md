# Coding WebIDE

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/import.png)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/workspace.png)

Coding WebIDE(https://ide.coding.net) is a cloud-based IDE developed by Coding Team.You can create your own workspace and develop projects here.WebIDE works fine with Git. You can use Coding、GitHub、BitBucket as your Git repository. Workspaces are powered by Docker Ubuntu containers.The development environment can be saved and shared to your team member.

## Features

1. *Built-In Terminal*
2. *Syntax Highlighting*
3. *Language Tools*
4. *Themes*
5. *Split View*
6. *VIM／Emacs Mode*
7. *Previews*

Please submit issues to corresponding projects, that'll help us make issues tracking easier so that we can provide timely help to you. Submit frontend issues at [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend/issues) and backend issues at [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend/issues).

[中文 README](https://github.com/Coding/WebIDE-Workspace/blob/master/README-zh.md)

This is the entry point to setup and run the WebIDE Community Edition project. It includes other 3 repos as git submodules.




## Modules

> [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend) contains frontend code.
> [WebIDE-Frontend-Webjars](https://github.com/Coding/WebIDE-Frontend-Webjars) packs frontend to webjar.
> [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend) contains backend code.


## How to clone

Clone this git repo to local. Then do:

```
git submodule init
git submodule update
```

This will also clone the other 3 repos via git submodule mechanism.


## Environment

WebIDE Frontend uses `npm` for package management, `webpack` and `babel` for building.
WebIDE Frontend Webjars & WebIDE Backend use `maven`.

Please ensure you have corresponding tools installed in your environment before build and run the project.


## Build and run

We provide a shell script `ide.sh` to ease the build and run process

> **./ide.sh build:** builds the frontend and packs to webjars
> **./ide.sh run:** start the backend and server

Server runs on port 8080 by default, visit localhost:8080 to check it out. Have fun!
