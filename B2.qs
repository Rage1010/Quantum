namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    operation Increment (qarray : Qubit[]) : Unit is Adj+Ctl {
        let k=Length(qarray);
        if (k>1) {
            for (t in k-2..-1..0) {
                Controlled X(qarray[0..t],qarray[t+1]);
            }
        }
        X(qarray[0]);
    }
    operation I3 (inputs :Qubit[]) :Unit is Adj+Ctl{
        ApplyToEachCA(X,inputs);
        CNOT(inputs[0],inputs[1]);
        CNOT(inputs[1],inputs[0]);
        ApplyToEachCA(X,inputs);
    }
    operation wow (inputs:Qubit[],count:Qubit[]): Unit is Adj+Ctl {
        for (j in 0..Length(inputs)-1) {
            Controlled I3 ([inputs[j]],count);
        }
    }
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let r=Length(inputs);
        using ((w,s)=(Qubit[2],Qubit[2])) {
            let f=inputs[0..2..r-1];
            let g=inputs[1..2..r-1];
            wow(f,w);
            wow(g,s);
            for (h in 1..3) {
                Increment(w);
                Increment(s);
                Controlled X(w+s,output);
            }
            Increment(w);
            Increment(s);
            Adjoint wow(f,w);
            Adjoint wow(g,s);
        }        
    }
}