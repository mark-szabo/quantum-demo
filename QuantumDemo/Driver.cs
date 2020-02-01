using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;
using System;

namespace Quantum.QuantumDemo
{
    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                // Try initial values
                var res = BellTest.Run(qsim).Result;
                var (numZeros, numOnes, agree) = res;
                Console.WriteLine($"# of 0s={numZeros,-4}");
                Console.WriteLine($"# of 1s={numOnes,-4}");
                Console.WriteLine($"agree={agree,-4}");
                System.Console.WriteLine();
            }
        }
    }
}