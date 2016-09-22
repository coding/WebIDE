# Coding WebIDE

README: [English](https://github.com/Coding/WebIDE/blob/master/README.md) | [中文](https://github.com/Coding/WebIDE/blob/master/README-zh.md)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/import.png)

![](https://raw.githubusercontent.com/Coding/WebIDE/gh-pages/screenshots/workspace.png)

Coding WebIDE(https://ide.coding.net) is a cloud-based IDE developed by Coding Team.You can create your own workspace and develop projects here.WebIDE works fine with Git. You can use Coding、GitHub、BitBucket as your Git repository. Workspaces are powered by Docker Ubuntu containers.The development environment can be saved and shared to your team member.

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


## Build and run

### Clone the repo

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


### Run on a normal host

We provide a shell script `ide.sh` to ease the process for you.

```
./ide.sh build   # transpile and pack the frontend to webjars
./ide.sh run     # start the backend server
```
Server runs on port 8080 by default, visit localhost:8080 to check it out.


### Run in a docker container

We've provides a docker image on docker hub: [webide](https://hub.docker.com/r/webide/webide/). Pull it and create a container, then run with command:
```
./ide.sh docker run
```

#### Using `ide.sh`

If you make changes on source code, you can recompile and run with commands:
```
./ide.sh docker build
./ide.sh docker run
```

Listed below are all docker related command in `ide.sh`
```
./ide.sh docker build  # create docker image
./ide.sh docker run    # create and start a container
./ide.sh docker stop   # stop container
./ide.sh docker attach # attach container(use control-c to exit)
./ide.sh docker logs   # check container's logs
./ide.sh docker exec   # create a new Bash session in the container
./ide.sh docker remove # remove container
```

#### Using `docker` CLI

If you encounter any problem using `ide.sh`, try get around it using docker CLI directly.

##### Run

If app state persistency is not important to you (that is, app data will be gone when container get deleted), simply run this one-liner:
```
docker run -p 8080:8080 --name webide webide/webide
```

Howerver, if you want to persist app state, you need to make sure `$HOME/.coding-ide-home` directories exist. If not, you need to **manually create them**, then run:
```
docker create -p 8080:8080 -v $HOME/.coding-ide-home:/home/coding/.coding-ide-home --name webide webide/webide
```

Rebuild and run with:
```
docker build -t webide/webide
docker run -p 8080:8080 --name webide webide/webide
```

Listed below are other frequently used docker commands
```
# stop container
docker stop webide

# attach container
docker attach --sig-proxy=false webide

# check container's logs
docker logs webide

# create a new Bash session in the container
docker exec -it webide bash
```
