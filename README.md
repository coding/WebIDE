# Coding WebIDE

README: [English](https://github.com/Coding/WebIDE/blob/master/README.md) | [中文](https://github.com/Coding/WebIDE/blob/master/README-zh.md)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/import.png)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/workspace.png)

Coding WebIDE(https://ide.coding.net) is a cloud-based IDE developed by Coding Team.You can create your own workspace and develop projects here.WebIDE works fine with Git. You can use Coding、GitHub、BitBucket、GitLab as your Git repository. Workspaces are powered by Docker Ubuntu containers.The development environment can be saved and shared to your team member.

[Live Demo](https://ide.coding.net/ws/?ownerName=duwan&projectName=WordPress&isTry=true)

Please submit issues to corresponding projects, that'll help us make issues tracking easier so that we can provide timely help to you. Submit frontend issues at [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend/issues) and backend issues at [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend/issues).


## Features

1. *Built-In Terminal*
2. *Syntax Highlighting*
3. *Language Tools*
4. *Themes*
5. *Split View*
6. *VIM／Emacs Mode*
7. *Previews*

This is the entry point to setup and run the WebIDE Community Edition project. It includes other 3 repos as git submodules.


## Modules

* [WebIDE-Frontend](https://github.com/Coding/WebIDE-Frontend) contains frontend code.
* [WebIDE-Frontend-Webjars](https://github.com/Coding/WebIDE-Frontend-Webjars) packs frontend to webjar.
* [WebIDE-Backend](https://github.com/Coding/WebIDE-Backend) contains backend code.


## Environment

WebIDE Frontend uses **npm** for package management, **webpack** and **babel** for building.
Frontend Webjars & WebIDE Backend use **maven3** and **java8**.

Please ensure you have corresponding tools installed in your environment before build and run the project.


## Native Server

Clone from coding.net:
```
git clone git@git.coding.net:coding/WebIDE.git
```

Clone from github.com:
```
git clone git@github.com:Coding/WebIDE.git
```

Init and pull submodules:
```
git submodule init
git submodule update
```
This will also clone the other 3 repos via git submodule mechanism.

We provide a shell script `ide.sh` to ease the process for you.

```
./ide.sh build   # transpile and pack the frontend to webjars
./ide.sh run     # start the backend server
```
Server runs on port 8080 by default, visit localhost:8080 to check it out.


### Configurations

`backend/src/main/resources/application.properties` contains configurations of user, project, database, etc., you can change these parameters to meet your need:

* **SPACE_HOME:** path to your workspace directory, default to `${"user.home"}/.workspace`
* **server.port:** backend server port
* **USERNAME:** username, used by git as its `user.name` config when commit, defaults to "coding"
* **EMAIL:** email, used by git as its `user.email` config when commit, defaults to "coding@coding.net"
* **AVATAR:** user's avatar
* **CODING_IDE_HOME:** path to store WebIDE application's data

If changed, restart the application to let your configurations take effect. Note that changes on `USERNAME`, `EMAIL` *WILL NOT* apply to workspaces that are already created.


## Docker Server

```
docker run -p 8080:8080 -h webide --name webide webide/webide
```

To learn more about docker commands，please refer to wiki [English](https://github.com/Coding/WebIDE/wiki/Docker-Server.en) [中文](https://github.com/Coding/WebIDE/wiki/Docker-Server.zh)
