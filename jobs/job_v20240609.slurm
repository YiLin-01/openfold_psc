#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU-shared
#SBATCH -t 3:00:00
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

wandb login
echo "cp 1" >> test_03.txt
module load cuda/11
conda activate openfold_env
export CUTLASS_PATH=/ocean/projects/cis240057p/ylinf/cutlass
cd /ocean/projects/cis240057p/ylinf/openfold
nvidia-smi >> test_03.txt
echo "cp 6" >> test_03.txt
python3 train_openfold.py OpenProteinSet/pdb_data/pdb_data/mmcif_files OpenProteinSet/alignment_data/alignments OpenProteinSet/pdb_data/pdb_data/mmcif_files/ outputs 2021-10-10 --template_release_dates_cache_path OpenProteinSet/pdb_data/pdb_data/data_caches/mmcif_cache.json --precision 32 --seed 42 --deepspeed_config_path deepspeed_config.json --train_chain_data_cache_path OpenProteinSet/pdb_data/pdb_data/data_caches/chain_data_cache.json --obsolete_pdbs_file_path OpenProteinSet/pdb_data/pdb_data/obsolete.dat --num_nodes 1 --gpus 4 --wandb --experiment_name experiment_openfold_4gpus --wandb_project openfold_4gpus --wandb_entity ylin01
echo "cpfinish!" >> test_03.txt
