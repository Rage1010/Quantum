namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // my code here lol
        using ((q,a)=(Qubit(),Qubit())){
            H(q);
            Controlled unitary([q],a);
            H(q);
            let r=M(q);
            Reset(q);
            Reset(a);
            if (r==Zero) {
                return 0;
            }
            else {
                return 1;
            }
        }
    }
}
