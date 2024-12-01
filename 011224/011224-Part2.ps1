# https://adventofcode.com/2024/day/1

# Import Location ID Data
$locations1 = Import-Csv -Path "locations1.csv" -Header "ID" | ForEach-Object { [int]$_.ID }
$locations2 = Import-Csv -Path "locations2.csv" -Header "ID" | ForEach-Object { [int]$_.ID }

# Create Hash Table to Create 
$appearances = @{}
foreach ($number in $locations2) {
    if ($appearances.ContainsKey($number)) {
        $appearances[$number]++
    } else {
        $appearances[$number] = 1
    }
}

# Calculate the total similarity score
$totalSimilarityScore = 0
foreach ($number in $locations1) {
    if ($appearances.ContainsKey($number)) {
        $totalSimilarityScore += $number * $appearances[$number]
    }
}

# Output the total similarity score
Write-Output "Total Similarity Score: $totalSimilarityScore"
