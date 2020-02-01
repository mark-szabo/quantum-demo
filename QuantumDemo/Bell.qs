namespace Quantum.QuantumDemo
{
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    
    operation Set (desired: Result, q1: Qubit) : Unit {
        if (desired != M(q1)) {
            X(q1);
        }
    }

    operation BellTest () : (Int, Int, Int) {
        mutable numOnes = 0;
        mutable agree = 0;
        using ((q0, q1) = (Qubit(), Qubit())) {
            for (test in 1..1000)
            {
                Set(Zero, q0);
                Set(Zero, q1);

                // 🚫 NOT gate
                //X(q0);

                // ✨ Hadamard gate
                //H(q0);

                //let _ = M(q0);
                //H(q0);

                // 👫 Creating an entanglement
                //CNOT(q0,q1);

                // 🔍 Measurement
                let res = M(q0);

                if (M (q1) == res) {
                    set agree += 1;
                }

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
                
            }
            
            Set(Zero, q0);
            Set(Zero, q1);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (1000-numOnes, numOnes, agree);
    }
}
