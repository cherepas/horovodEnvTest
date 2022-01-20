#!/bin/bash
# bash -x for detailed shell debugging

#SBATCH --nodes=3
#SBATCH --ntasks-per-node=4
#SBATCH --output=./output/pmh-%j.out
#SBATCH --error=./output/pmh-%j.err
#SBATCH --time=00:10:00
#SBATCH --partition=dc-gpu
#SBATCH --gres=gpu:4

#SBATCH --account=delia-mp
module load GCC/9.3.0 OpenMPI/4.1.0rc1 Python/3.8.5 Horovod/0.20.3-Python-3.8.5 PyTorch/1.7.0-Python-3.8.5 scikit/2020-Python-3.8.5 torchvision/0.8.2-Python-3.8.5
HOROVOD_MPI_THREADS_DISABLE=0
source /p/home/jusers/cherepashkin1/juwels/scalable_dl/sdl_venv/sdl_venv/activate.sh
# make sure all GPUs on a node are visible
export CUDA_VISIBLE_DEVICES="0,1,2,3"

# use srun to start Horovod code
srun --cpu-bind=none,v python3 pytorch-mnist-horovod.py --batch-size 1000
