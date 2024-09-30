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
    operation lemme (inputs :Qubit[],cnt : Qubit[]) :Unit is Adj+Ctl{
        for (h in 0..Length(inputs)-1) {
                (Controlled Increment) ([inputs[h]],cnt);
            }
    }
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let r=Length(inputs);
        let t=r/2;
        using (w=Qubit[3]) {
            lemme(inputs,w);
            for (u in 1..7-t) {
                Increment(w);
            }
            Controlled X (w,output);
            for (h in 0..t) {
                Increment(w);
            }
            Adjoint lemme(inputs,w);
        }        
    }
}