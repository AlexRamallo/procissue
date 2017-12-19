# sys.io.Process bug test

Sometimes, the Process class hangs indefinitely depending on the output on certain programs. This repo is meant to reproduce the issue using g++

- `Runner.hx` is a program that will launch a new instance of Process with cmd and args from `Sys.args()`, and then read the Inputs stdout and stderr line-by-line using `Input.readLine`, and print it using Sys.println

- `Printer.hx` is a simple program that will print out a bunch of random characters of a given length from `Sys.args()`. The first argument is the number of lines to print, the second is the number of characters per line. It uses `String.fromCharacterCode` along with Math.random to print characters with codes between the range 33 and 126, along with random ANSI color codes.

- `printer.sh` is just a script that will run the Printer program via the Runner program (so it is launch as a sys.io.Process). On my machines, this works perfectly fine without hanging, regardless of the number of lines/characters printed.

- `cmd.sh` will use Runner to invoke g++ to compile the C++ file `test/main.cpp` using flags to enable all warnings (even those that don't apply to C++). On my machine, this hangs *every single time* right before the first call to `Input.readLine`

- `cmd_direct.sh` invokes g++ the same way as cmd.sh, but does it directly in your shall rather than through Runner so you can see the output. This of course works fine.
