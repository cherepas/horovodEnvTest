#!/bin/bash
RELATIVE_PATH=`dirname ${BASH_SOURCE}`
ABSOLUTE_PATH=`realpath ${RELATIVE_PATH}`

[[ $0 != $BASH_SOURCE ]] && echo "The activation script must be sourced, otherwise the virtual environment will not work." || ( echo "Vars script must be sourced." && exit 1) ;

source ${ABSOLUTE_PATH}/config.sh
source ${ABSOLUTE_PATH}/modules.sh

export PYTHONPATH=`echo ${ENV_DIR}/lib/python*/site-packages`:${PYTHONPATH}

source ${ENV_DIR}/bin/activate




