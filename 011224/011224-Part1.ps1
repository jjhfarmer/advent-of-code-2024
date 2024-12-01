# https://adventofcode.com/2024/day/1

# Import Location ID Data
$locations1 = Import-Csv -Path "locations1.csv" -Header "ID" | ForEach-Object { [int]$_.Number }
$locations2 = Import-Csv -Path "locations2.csv" -Header "ID" | ForEach-Object { [int]$_.Number }

# Sort both lists
$locations1 = $locations1 | Sort-Object
$locations2 = $locations2 | Sort-Object

$totalDifference = 0

# Calculate the difference between each pair and sum the differences
for ($location = 0; $location -lt $locations1.Count; $location++) {
    $difference = [math]::Abs($locations1[$location] - $locations2[$location])
    $totalDifference += $difference
    Write-Output "Pair: $($locations1[$location]) and $($locations2[$location]), Difference: $difference"
}

Write-Output "Total Difference: $totalDifference"
