#!/bin/bash
#SBATCH --job-name=3detr_ptv3_180
#SBATCH --output=logs/3detr_ptv3_180_%j.log
#SBATCH --error=logs/3detr_ptv3_180_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --gres=gpu:4
#SBATCH --time=12:00:00
#SBATCH --mem=128G
#SBATCH --exclude=ailab-l4-07

set -eo pipefail

# Activate conda env
source /ceph/home/student.aau.dk/qu30hs/miniforge3/bin/activate pointcept

# WanDB
export WANDB_API_KEY="$(cat ~/.secrets/wandb_api_key)"
export WANDB_ENTITY=agco-student-job

# Run script
srun sh scripts/train.sh \
    -d scannet \
    -c det-3detr-v2m1-0-scannet-180ep \
    -n 3detr_ptv3_180ep \
    -g 4
