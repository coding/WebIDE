#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")"; pwd)
PROG_NAME=$(basename $0)

BACKEND_URL="http://localhost:8080"
FRONTEND_URL="http://localhost:8080"

BACKEND=$BASEDIR/backend
FRONTEND=$BASEDIR/frontend
FRONTEND_WEBJARS=$BASEDIR/frontend-webjars

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

sub_build() {

    build_usage() {
        echo "Usage: $PROG_NAME build frontend"
    }

    case $1 in
    "-h" | "--help")
        build_usage
        ;;
    "" | "frontend")
      cd $FRONTEND
      npm config set registry https://registry.npm.taobao.org
      npm install
      npm run build

      cd $FRONTEND_WEBJARS
      mvn clean install
      
      cd $BASEDIR
      ;;
    esac
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
        cd $BACKEND
        mvn clean spring-boot:run
        cd $BASEDIR
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
