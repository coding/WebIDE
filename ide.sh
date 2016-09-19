#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")"; pwd)

PROG_NAME=$(basename $0)

BACKEND=$BASEDIR/backend
FRONTEND=$BASEDIR/frontend
FRONTEND_WEBJARS=$BASEDIR/frontend-webjars
CONTAINER=webide

valid_last_cmd() {
  if [ $? -ne 0 ]; then
      exit 1
  fi
}

sub_help(){
  echo "Usage: $PROG_NAME [-e <subcommand>"
  echo ""
  echo "Subcommands:"
  echo "  build"
  echo "  run"
  echo ""
  echo "For help with each subcommand run:"
  echo "$PROG_NAME <subcommand> -h | --help"
  echo ""
}

sub_backend() {
  bakend_usage() {
      echo "Usage: $PROG_NAME backend [clean]"
  }

  case $1 in
    "-h" | "--help")
      backend_usage
      ;;
    "clean")
      cd $BACKEND
        mvn clean
      cd $BASEDIR
    ;;
  esac
}

do_build_frontend() {
  cd $FRONTEND
  npm install --registry=https://registry.npm.taobao.org
  npm run build

  valid_last_cmd

  cd $FRONTEND_WEBJARS
  mvn clean install
  valid_last_cmd
  cd $BASEDIR
}

sub_build() {

    build_usage() {
        echo "Usage: $PROG_NAME build frontend"
    }

    case $1 in
    "-h" | "--help")
      build_usage
      ;;
    "" | "frontend")
      do_build_frontend
      ;;
    "run") # build and run
      do_build_frontend
      do_run_backend
      ;;
    esac
}

error() {
  printf  "${RED}ERROR:${NC} %s\n" "${1}"
}

error_exit() {
#  echo  "---------------------------------------"
#  error "!!!"
  error "${1}"
#  error "!!!"
#  echo  "---------------------------------------"
  exit 1
}

valid_container_exist() {
  RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

  if [ $? -eq 1 ]; then
    echo "UNKNOWN - container $CONTAINER does not exist."
    exit 3
  fi
}

assert_container_is_running() {
  RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

  if [ $? -eq 1 ]; then
    echo "UNKNOWN - $CONTAINER does not exist."
    exit 3
  fi

  if [ "$RUNNING" == "false" ]; then
    echo "CRITICAL - $CONTAINER is not running."
    exit 2
  fi
}

container_exist() {
  RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

  if [ $? -eq 1 ]; then
    echo "UNKNOWN - $CONTAINER does not exist."
    exit 3
  fi
}

container_is_running() {
  RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

  if [ $? -eq 1 ]; then
    return 1
  fi

  if [ "$RUNNING" == "true" ]; then
    return 0
  else
    return 1
  fi
}

sub_docker() {

    check_docker() {
      if ! docker ps > /dev/null 2>&1; then
        output=$(docker ps)
        error_exit "Error - Docker not installed properly: \n${output}"
      fi
    }

    docker_usage() {
      echo "Usage: $PROG_NAME docker [build|run|attach|stop|logs]"
    }

    check_docker

    case $1 in
    "-h" | "--help")
      docker_usage
      ;;
    "build")
      docker build -t coding/webide .
      ;;
    "run")
      RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

      if ! container_exist ; then
        "creating container $CONTAINER"
        docker create -p 8080:8080 -v $HOME/.m2:/home/coding/.m2 -v $HOME/.coding-ide-home:/home/coding/.coding-ide-home --name webide coding/webide
        valid_last_cmd
      elif [ "$RUNNING" == "true" ]; then
        echo "CRITICAL - $CONTAINER is running."
        exit 2
      fi

      echo "starting container $CONTAINER"
      docker start webide
      ;;
    "stop")
      assert_container_is_running
      docker stop webide
      ;;
    "attach")
      assert_container_is_running
      docker attach webide
      ;;
    "logs")
      assert_container_is_running
      docker logs webide
      ;;
    "remove")
      if container_is_running ; then
        echo "stoping webide..."
        docker stop webide
      fi
      echo "removing webide..."
      docker rm webide
      echo "done..."
      ;;
    "exec")
      assert_container_is_running
      docker exec -it webide bash
      ;;
    esac
}

do_run_backend() {
  cd $BACKEND
  mvn clean spring-boot:run
  valid_last_cmd
  cd $BASEDIR
}

sub_run() {
    run_usage() {
        echo "Usage: $PROG_NAME run"
    }

    case $1 in
    "-h" | "--help")
        run_usage
        ;;
    "")
        do_run_backend
        ;;
    esac
}

# process subcommands

subcommand=$1

case $subcommand in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift

        sub_${subcommand} $@

        if [ $? = 127 ]; then
            echo "Error: '$subcommand' is not a known subcommand." >&2
            echo "       Run '$PROG_NAME --help' for a list of known subcommands." >&2
            exit 1
        fi
    ;;
esac
