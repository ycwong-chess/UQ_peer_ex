#!/bin/bash

module purge
module load GCCcore/11.2.0 Python/3.9.6 CUDA/11.7.0

source /storage/nanosim/phrpjk/mace_venv_d301/bin/activate
unset PYTHONPATH
which python

export OMP_NUM_THREADS=4


# running mace script
python ~/software/mace/scripts/run_train.py \
    --name="sto_phonopy_rad_5_batch_5_16inv" \
    --train_file="/storage/nanosim/phrpjk/phonopy_model/all_phonopy_STO_up_to_555.xyz" \
    --valid_fraction=0.05 \
    --E0s="average" \
    --config_type_weights='{"Default":1.0}' \
    --compute_forces=True \
    --test_file="/storage/nanosim/phrpjk/phonopy_model/all_phonopy_STO_up_to_555.xyz" \
    --model="MACE" \
    --hidden_irreps='16x0e' \
    --r_max=5.0 \
    --batch_size=5 \
    --valid_batch_size=5 \
    --seed=555 \
    --max_num_epochs=500 \
    --swa \
    --start_swa=200 \
    --ema \
    --ema_decay=0.99 \
    --amsgrad \
    --restart_latest \
    --device=cuda \

