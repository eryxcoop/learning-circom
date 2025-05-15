pragma circom 2.1.6;

include "node_modules/circomlib/circuits/poseidon.circom";

template HashProof() {
    signal input preimage;
    signal output hashOutput;

    component hasher = Poseidon(1);
    hasher.inputs[0] <== preimage;
    hashOutput <== hasher.out;
}

component main = HashProof();