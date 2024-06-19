#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU-shared
#SBATCH -t 30:00
#SBATCH --gpus=v100-32:4

#type 'man sbatch' for more information and options
#this job will ask for 4 V100 GPUs on a v100-32 node in GPU-shared for 5 hours
#this job would potentially charge 20 GPU SUs

#echo commands to stdout
set -x

# move to working directory
# this job assumes:
# - all input data is stored in this directory
# - all output should be stored in this directory
# - please note that groupname should be replaced by your groupname
# - username should be replaced by your username
# - path-to-directory should be replaced by the path to your directory where the executable is

echo "cp 0" >> test_01.txt
nvidia-smi >> test_01.txt
echo "cp 1" >> test_01.txt
module load cuda/11
echo "cp 2" >> test_01.txt
nvcc --version >> test_01.txt
echo "cp 3" >> test_01.txt
conda activate openfold_env
echo "cp 4" >> test_01.txt
export CUTLASS_PATH=/ocean/projects/cis240057p/ylinf/cutlass
echo "cp 5" >> test_01.txt
cd /ocean/projects/cis240057p/ylinf/openfold
echo "cp 6" >> test_01.txt