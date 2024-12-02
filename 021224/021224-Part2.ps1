# https://adventofcode.com/2024/day/2

$inputLines = Get-Content "./input.txt"
$safeCount = 0


function IsSafe($sequence) {
    if ($sequence.Count -lt 2) {
        return $true
    }
    $sign = $null
    for ($i = 0; $i -lt $sequence.Count - 1; $i++) {
        $diff = $sequence[$i+1] - $sequence[$i]
        if ([Math]::Abs($diff) -lt 1 -or [Math]::Abs($diff) -gt 3) {
            return $false
        }
        if ($diff -eq 0) {
            return $false
        }
        if ($sign -eq $null) {
            $sign = [Math]::Sign($diff)
        } elseif ([Math]::Sign($diff) -ne $sign) {
            return $false
        }
    }
    return $true
}

# Process each report in the input data using isSafe function
foreach ($line in $inputLines) {
    $levels = $line -split ' ' | ForEach-Object { [int]$_ }
    if (IsSafe $levels) {
        $safeCount++
    } else {
        $isSafeAfterRemoval = $false
        for ($i = 0; $i -lt $levels.Count; $i++) {
            # Remove the level at index $i
            $newLevels = @()
            if ($i -gt 0) {
                $newLevels += $levels[0..($i-1)]
            }
            if ($i -lt $levels.Count - 1) {
                $newLevels += $levels[($i+1)..($levels.Count - 1)]
            }
            if (IsSafe $newLevels) {
                $safeCount++
                $isSafeAfterRemoval = $true
                break
            }
        }
    }
}


Write-Host "Number of safe reports: $safeCount"