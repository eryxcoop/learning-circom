pragma circom 2.1.6;

template AdditionProof() {
    // declaration of signals
    signal input a;
    signal input b;
    signal output sum;

    // constraint
    sum <== a + b;
}

component main {public [ a, b]} = AdditionProof();

/* INPUT = {
    "a": 3,
    "b": 5
} */