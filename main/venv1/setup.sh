#!/bin/bash
RELATIVE_PATH=`dirname ${BASH_SOURCE}`
ABSOLUTE_PATH=`realpath ${RELATIVE_PATH}`

source ${ABSOLUTE_PATH}/config.sh
source ${ABSOLUTE_PATH}/modules.sh

python -m venv --prompt $ENV_NAME --system-site-packages ${ENV_DIR}

source ${ABSOLUTE_PATH}/activate.sh

pip install -r ${ABSOLUTE_PATH}/requirements.txt



