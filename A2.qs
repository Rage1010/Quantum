namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using ((a,s)=(Qubit(),Qubit())) {
            X(s);
            unitary([a,s]);
            let d=M(a);
            let f=M(s);
            unitary([s,a]);
            let y=M(a);
            Reset(a);
            Reset(s);
            if (d==One) {
                if (f==Zero){
                    return 3;
                }
                else {
                    return 2;                    
                }
            }
            else {
                if (y==One) {
                    return 1;
                }
                else {
                    return 0;
                }
            }
        }        
    }
}
