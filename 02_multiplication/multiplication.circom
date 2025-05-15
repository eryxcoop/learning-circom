pragma circom 2.1.6;

template MultiplicationProof() {
    signal input a;
    signal input b;
    signal input c;
    signal output multiplication;

    signal a_mult_b;

    a_mult_b <== a * b;

    multiplication <== a_mult_b * c;
}

component main = MultiplicationProof();