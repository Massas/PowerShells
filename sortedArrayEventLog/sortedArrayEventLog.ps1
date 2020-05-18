# This is a sample for sorting array that has eventlog data.

$today = Get-Date -Format "yyyy年MM月dd日"
$lognum = 10

Write-Host "結合した配列を作るための配列A"
$Events_A = Get-EventLog -LogName System -After $today -Newest $lognum
Write-Host "display sorted Array Events_A"
# Sort Array by InstanceId in descending order 配列を降順にソートする
$Events_A | Sort-Object -Property InstanceId -Descending

Write-Host "結合した配列を作るための配列B"
$Events_B = Get-EventLog -LogName System -After $today -Newest $lognum
Write-Host "display sorted Array Events_B"
# Sort Array by InstanceId in descending order 配列を降順にソートする
$Events_B | Sort-Object -Property InstanceId -Descending

Write-Host "配列同士を結合して新しい配列を作る"
$Events_Set = $Events_A + $Events_B

Write-Host "InstanceIDで降順にソートして、一つ一つループ処理する"
$Events_Set.GetEnumerator() | Sort-Object -Property InstanceId -Descending | ForEach-Object {
    Write-Host $_.InstanceId
}