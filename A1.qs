namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using ((a,s)=(Qubit(),Qubit())) {
            X(a);
            unitary([a,s]);
            let res=M(s);
            Reset(a);
            Reset(s);
            if (res==One) {
                return 0;                    
            }
            else {
                return 1;
            }

        }
    }
}