namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
        let qarray=register!;
        let k=Length(qarray);
        ApplyToEachCA(X,qarray);
        if (k>1) {
            for (t in k-2..-1..0) {
                Controlled X(qarray[0..t],qarray[t+1]);
            }
        }
        X(qarray[0]);
        ApplyToEachCA(X,qarray);
    }
}
