namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q=Qubit()) {
            unitary(q);
            Z(q);
            unitary(q);
            let r =M(q);
            Reset(q);
            if (r==One) {
                return 0;
            }
            else {
                return 1;
            }
        }
    }
}