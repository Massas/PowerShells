echo "START:trim data"

# filename that you want to trim
$filename = (Read-Host Please enter filename that you want to trim)
$wsobj = new-object -comobject wscript.shell
$res = $wsobj.popup("filename: $filename")

# select the operating mode
$mode = (Read-Host select and enter mode TABLE-MODE:0 INDEX-MODE:1)

if($mode -eq 0){
    echo "operating mode is TABLE mode"
    $resultFileName = "trimTabResult.csv"
}else{
    echo "operating mode is INDEX mode"
    $resultFileName = "trimIndexResult.csv"
}

$startLine = (Read-Host please enter leading line number that want to trim)
$endLine = (Read-Host please enter rear line number that want to trim)

# cast string to number
$startNum = [int]$startLine
$endNum = [int]$endLine

# read file and store data in array, and write in result file
$array = Get-Content $filename
for ($i = $startNum; $i -lt $endNum; $i++){ Write-Output $array[$i] | Add-Content $resultFileName -Encoding Default }

echo "END:trim data"