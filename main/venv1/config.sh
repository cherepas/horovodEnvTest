## Check if this script is sourced
[[ $0 != $BASH_SOURCE ]] && echo "Setting vars" || ( echo "Vars script must be sourced." && exit 1) ;
## Determine location of this file
RELATIVE_PATH=`dirname ${BASH_SOURCE}`
ABSOLUTE_PATH=`realpath ${RELATIVE_PATH}`
####################################

### User Configuration
export ENV_NAME=`basename $ABSOLUTE_PATH`             # Default Name of the venv is the directory that contains this file
export ENV_DIR=${ABSOLUTE_PATH}/venv         # Default location of this VENV is "./venv"

