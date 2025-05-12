#!/bin/bash

CIRCUIT_NAME=test

CIRCUIT_PATH="./$CIRCUIT_NAME.circom"

OUTPUT_PATH="./"

echo "[Setup](14/22): Setup"
snarkjs groth16 setup ${OUTPUT_PATH}${CIRCUIT_NAME}.r1cs ${OUTPUT_PATH}pot15_final.ptau ${OUTPUT_PATH}${CIRCUIT_NAME}_0000.zkey

echo "[Setup](15/22): Contribute to the phase 2 ceremony"
snarkjs zkey contribute ${OUTPUT_PATH}${CIRCUIT_NAME}_0000.zkey ${OUTPUT_PATH}${CIRCUIT_NAME}_0001.zkey --name="1st Contributor Name" -v

echo "[Setup](16/22): Provide a second contribution"
snarkjs zkey contribute ${OUTPUT_PATH}${CIRCUIT_NAME}_0001.zkey ${OUTPUT_PATH}${CIRCUIT_NAME}_0002.zkey --name="Second contribution Name" -v 

echo "[Setup](17/22): Verify the latest zkey"
snarkjs zkey verify ${OUTPUT_PATH}${CIRCUIT_NAME}.r1cs ${OUTPUT_PATH}pot15_final.ptau ${OUTPUT_PATH}${CIRCUIT_NAME}_0002.zkey

echo "[Setup](18/22): Apply a random beacon"
snarkjs zkey beacon ${OUTPUT_PATH}${CIRCUIT_NAME}_0002.zkey ${OUTPUT_PATH}${CIRCUIT_NAME}_final.zkey 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon phase2"

echo "[Setup](19/22): Verify the final zkey"
snarkjs zkey verify ${OUTPUT_PATH}${CIRCUIT_NAME}.r1cs ${OUTPUT_PATH}pot15_final.ptau ${OUTPUT_PATH}${CIRCUIT_NAME}_final.zkey