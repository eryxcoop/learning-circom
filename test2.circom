pragma circom 2.1.6;

template EqualConstantTemplate(k) {
    // declaration of signals
    signal input a;

    // constraint
    a === k;
}

template Equals2 {
    signal input a;

    component comparator = EqualConstantTemplate(2);
    comparator.a <== a;
}

component main { public [ a ] } = Equals2();