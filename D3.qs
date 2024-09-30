namespace Solution {
    open Microsoft.Quantum.MachineLearning;

    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        return ((1, [0.8,0.0]), [ControlledRotation((0, [1]), PauliX, 0)], ([3.141592654], 0.0));
    }
}