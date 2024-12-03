# https://adventofcode.com/2024/day/3
# This script did not produce the correct answer.

function Get-Sum {
    param (
        [string]$memory
    )
    # Regular expressions to match valid instructions
    $mulRegex = [regex] 'mul\((\d+),(\d+)\)'
    $doRegex = [regex] 'do\(\)'
    $dontRegex = [regex] 'don''t\(\)'
    # Initialize sum and state
    $sum = 0
    $mulEnabled = $true
    # Process the memory one character at a time
    $index = 0
    while ($index -lt $memory.Length) {
        $substring = $memory.Substring($index)
        if ($substring -match $mulRegex) {
            if ($mulEnabled) {
                # Extract numbers
                $x = [int]$matches[1]
                $y = [int]$matches[2]
                # Add to the sum
                $sum += $x * $y
            }
            # Move index past this match
            $index += $matches[0].Length
        } elseif ($substring -match $doRegex) {
            # Enable future mul instructions
            $mulEnabled = $true
            $index += $matches[0].Length
        } elseif ($substring -match $dontRegex) {
            # Disable future mul instructions
            $mulEnabled = $false
            $index += $matches[0].Length
        } else {
            # Skip any invalid characters
            $index++
        }
    }
    return $sum
}
# Example usage
$corruptedMemory = Get-Content ./corruptedMemory.txt -Raw
$result = Get-Sum -memory $corruptedMemory
Write-Output $result