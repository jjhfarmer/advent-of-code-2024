# https://adventofcode.com/2024/day/3

function Get-Sum {
    param (
        [string]$memory
    )

    # Regular expression to match valid mul(X,Y) instructions
    $regex = [regex] 'mul\((\d{1,3}),(\d{1,3})\)'

    # Initialize sum
    $sum = 0

    # Find all matches
    $corruptions = $regex.Matches($memory)

    foreach ($corruption in $corruptions) {
        # Extract numbers
        $x = [int]$corruption.Groups[1].Value
        $y = [int]$corruption.Groups[2].Value

        # Perform multiplication and add to sum
        $sum += $x * $y
    }

    return $sum
}

# Example usage
$corruptedMemory = Get-Content ./corruptedMemory.txt
$result = Get-Sum -memory $corruptedMemory
Write-Output $result
