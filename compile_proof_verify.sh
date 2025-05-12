#!/bin/bash

CIRCUIT_NAME="test"

CIRCUIT_PATH="${CIRCUIT_NAME}.circom"

OUTPUT_PATH="${CIRCUIT_NAME}_build_2/"
mkdir -p ${OUTPUT_PATH}

# Compiles circuit to wasm
circom ${CIRCUIT_PATH} --r1cs --wasm --sym -p bls12381 -o ${OUTPUT_PATH}

snarkjs r1cs export json ${OUTPUT_PATH}${CIRCUIT_NAME}.r1cs ${OUTPUT_PATH}${CIRCUIT_NAME}.r1cs.json