Simple assembly programs to test the performance counter results reported by perf, [as described here](http://stackoverflow.com/q/39864416/149138).

Requires nasm.

## To compile:

make

## Binary Details

Making the project produces three binaries in the root folder: perf-test-nop, -mul and -div. In the inner loop they use no-ops, an imul and a idiv 
instruction respectively. The upshot is that each loop iteration takes 1 cycle, 3 cycles or ~40 cycles respectively,
at least on modern Intel hardware. 

## Usage

perf-test-nop N
perf-test-mul N
perf-test-div N

Each binary takes an argument N from 0-99 which specifies how many loop iterations to execute. The "nop" and "mul" 
binaries execute N * 1e9 (i.e., N billion) iterations, while the "div" binary executes N * 1e8 (i.e., N hundred 
million) iterations. This 10x discrepancy keeps the runtime manageable for the div variant (which would otherwise 
take 20 minutes or so for N=99).



