namespace Solution {
    open Microsoft.Quantum.MachineLearning;

    operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        // your code here
        return ((4, [0.0,0.75]), [ControlledRotation((0, [1]), PauliX, 0),
            ControlledRotation((1, [0]), PauliX, 0),ControlledRotation((0, [1]), PauliX, 0)], ([3.14159], 0.0));
    }
}