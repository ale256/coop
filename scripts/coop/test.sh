#!/bin/bash

# custom config
DATA=/research/d1/rshr/ajle/DATA_coop/
TRAINER=CoOp

DATASET=caltech101
CFG=test # config file
CTP=end  # class token position (end or middle)
NCTX=8  # number of context tokens
SHOTS=1  # number of shots (1, 2, 4, 8, 16)
CSC=False  # class-specific context (False or True)

for SEED in 1
do
    DIR=output/test

    python train.py \
    --root ${DATA} \
    --seed ${SEED} \
    --trainer ${TRAINER} \
    --dataset-config-file configs/datasets/${DATASET}.yaml \
    --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
    --output-dir ${DIR} \
    TRAINER.COOP.N_CTX ${NCTX} \
    TRAINER.COOP.CSC ${CSC} \
    TRAINER.COOP.CLASS_TOKEN_POSITION ${CTP} \
    DATASET.NUM_SHOTS ${SHOTS}
    
done