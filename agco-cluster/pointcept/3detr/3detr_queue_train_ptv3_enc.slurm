#!/bin/bash
#SBATCH --job-name=3detr_ptv3_enc
#SBATCH --output=logs/3detr_ptv3_enc_%j.log
#SBATCH --error=logs/3detr_ptv3_enc_%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:1
#SBATCH --time=7-00:00:00
#SBATCH --mem=64G

# Activate conda env
source "$(dirname "$CONDA_EXE")/activate" pointcept

# WanDB
# put key in ~/.secrets/wandb_api_key ; chmod 600 ~/.secrets/wandb_api_key
export WANDB_API_KEY="$(cat ~/.secrets/wandb_api_key)"
export WANDB_ENTITY=agco-student-job

# Run script
srun sh scripts/train.sh -d scannet -c det-3detr-v3m1-0-scannet -n 3detr_ptv3_enc_720ep -g 1
