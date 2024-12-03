# https://adventofcode.com/2024/day/3
# This script did not answer the challenge correctly.

paste -s corruptedMemory.txt | sed -E "s/don't/\ndon't/g" | sed -E "s/do\(\)/\ndo\(\)/g" | grep -v "^don" | sed -E 's/mul/\nmul/g' | sed -nE 's/.*mul\(([0-9]+),([0-9]+)\).*/\1\*\2/p' | paste -sd+ - | bc
