#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=24
#SBATCH --output=./output/sh3d-%j.out
#SBATCH --error=./output/sh3d-%j.err
#SBATCH --time=23:00:00
#SBATCH --partition=dc-gpu
#SBATCH --gres=gpu:4

#SBATCH --account=delia-mp
source /p/home/jusers/cherepashkin1/jureca/cherepashkin1/virt_enves/venv1/activate.sh
HOROVOD_MPI_THREADS_DISABLE=1
# # make sure all GPUs on a node are visible
export CUDA_VISIBLE_DEVICES="0,1,2,3"
ME=`basename "$0"`
HOMEPATH="/p/project/delia-mp"
EXPNUM="e067"
CONTRAIN="011l"
python -u "${HOMEPATH}/cherepashkin1/circles/finetune_test/main.py" -epoch 3 -bs 15 -num_input_images 1 -framelim 200 -rescale 500 -cencrop 700 -criterion 'L1' -localexp "" -lr 1e-4 -expnum "$EXPNUM" -hidden_dim 3 -inputt "img" -outputt "eul" -lb "eul" -minmax_fn "min,max" -zero_angle -gttype "single_f_n" -csvname "598csv9" -parallel "hvd" -machine "jureca" -wandb "" -merging_order 'color_channel' -updateFraction 0.25 -steplr 1000 1 -batch_output 2 -cmscrop 0 -weight_decay 0 -print_minibatch 1
