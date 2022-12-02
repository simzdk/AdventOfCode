## Source: https://adventofcode.com/2022/day/1
[int]$highscore = 0
[int]$temp_calories = 0
$list = @()

#$sample = Get-Content -Path "..\Day01_Sample.csv"
$sample = Get-Content -Path "..\Day01.csv"

for ($i = 0; $i -lt $sample.Count; $i++) {
    if ($sample[$i]) {
        [int]$temp_calories = $temp_calories + [int]$sample[$i]
    }
    else {
        if ($temp_calories -gt $highscore) {
            $highscore = $temp_calories
        }
        $list += $temp_calories 
        $temp_calories = 0
    }
    
}
$highscore

(($list | Sort-Object | Select-Object -Last 3) | Measure-Object -Sum).Sum