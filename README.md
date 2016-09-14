# Coding WebIDE Workspace

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
