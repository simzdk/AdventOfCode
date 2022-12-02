# https://adventofcode.com/2022/day/2

#Rock = 1
$rock = "AX"

#Paper = 2
$paper = "BY"

#scissors = 3
$scissors = "CZ"

$point = 0

#$sample = Get-Content -Path "..\Day02_Sample.csv"
$sample = Get-Content -Path "..\Day02.csv"

foreach ($line in $sample) {
    $elf_point = 0
    $my_point = 0
    $hand = ($line -split (" "))
    # Calculate Hand
    if ($rock.Contains($hand[0])) {
        $elf_point = 1
        Write-Host "Elf has Rock: $elf_point"
    }
    if ($paper.Contains($hand[0])) {
        $elf_point = 2
        Write-Host "Elf has Paper: $elf_point"
    }
    if ($scissors.Contains($hand[0])) {
        $elf_point = 3
        Write-Host "Elf has Scissors: $elf_point"
    }    
    if ($rock.Contains($hand[1])) {
        $my_point = 1
        Write-Host "You has Rock: $my_point"
    }
    if ($paper.Contains($hand[1])) {
        $my_point = 2
        Write-Host "You has Paper: $my_point"
    }
    if ($scissors.Contains($hand[1])) {
        $my_point = 3
        Write-Host "You has Scissors: $my_point"
    }
    # Check Winner
    if ($my_point -eq 3) {
        if ($elf_point -eq 2) {
            $point = $point + $my_point + 6
            Write-Host "You Win: $my_point" -ForegroundColor Green
        }
        if ($elf_point -eq 1) {
            $point = $point + $my_point
            Write-Host "You Loose: $my_point" -ForegroundColor Red
        }
    }
    if ($my_point -eq 2) {
        if ($elf_point -eq 1) {
            $point = $point + $my_point + 6
            Write-Host "You Win: $my_point" -ForegroundColor Green
        }
        if ($elf_point -eq 3) {
            $point = $point + $my_point
            Write-Host "You Loose: $my_point" -ForegroundColor Red
        }
    }
    if ($my_point -eq 1) {
        if ($elf_point -eq 3) {
            $point = $point + $my_point + 6
            Write-Host "You Win: $my_point" -ForegroundColor Green
        }
        if ($elf_point -eq 2) {
            $point = $point + $my_point
            Write-Host "You Loose: $my_point" -ForegroundColor Red
        }
    }
    if ($my_point -eq $elf_point) {
        $point = $point + $my_point + 3
        Write-Host "Draw: $my_point" -ForegroundColor Yellow
    }
}
$point