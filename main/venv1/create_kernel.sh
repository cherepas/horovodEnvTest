#!/bin/bash

RELATIVE_PATH=`dirname ${BASH_SOURCE}`
ABSOLUTE_PATH=`realpath ${RELATIVE_PATH}`
source ${ABSOLUTE_PATH}/config.sh

KERNELFILE=${ENV_DIR}/kernel.sh
PROJECT_FOLDER="/p/project/delia-mp/cherepashkin1/virt_enves/venv1/"

echo the name is $ENV_NAME

echo "Setting up the kernel script in the following dir: " ${KERNELFILE}

echo '#!/bin/bash

source '"${ABSOLUTE_PATH}"'/activate.sh
    
exec python -m ipykernel $@' > ${KERNELFILE}

chmod a+x ${KERNELFILE}

mkdir -p $PROJECT_FOLDER/.local/share/jupyter/kernels/${ENV_NAME}
echo '{
 "argv": [
  "'"${KERNELFILE}"'", 
  "-f",
  "{connection_file}"
 ],
 "display_name": "'${ENV_NAME}'",
 "language": "python"
}' > ${PROJECT_FOLDER}/.local/share/jupyter/kernels/${ENV_NAME}/kernel.json
