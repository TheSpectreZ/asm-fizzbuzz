# asm-fizzbuzz

A FizzBuzz implementation in x86-64 NASM assembly for Linux. 

## What's This?

This is FizzBuzz, but written entirely in assembly. It prints numbers in a range, substituting:
- `Fizz` for multiples of 3
- `Buzz` for multiples of 5
- `FizzBuzz` for multiples of both 3 and 5

No high-level languages, no standard libraries—just raw assembly and Linux syscalls.

## Install NASM and build tools

Open your terminal (in WSL or Linux) and run:

```bash
sudo apt update
sudo apt install nasm build-essential
```

## How to Run

Clone the repo and execute the build script:

```bash
git clone https://github.com/TheSpectreZ/asm-fizzbuzz.git
cd asm-fizzbuzz
./run.sh fizzbuzz.asm
```

### Note
Tested and working in **Windows WSL (Ubuntu)**. Should also work on regular Linux if you have the same tools.

## Sample Output

```text
Enter Start Number: 8
Enter End Number: 16
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
```
