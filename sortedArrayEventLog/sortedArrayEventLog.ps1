# This is a sample for sorting array that has eventlog data.

$today = Get-Date -Format "yyyy�NMM��dd��"
$lognum = 10

Write-Host "���������z�����邽�߂̔z��A"
$Events_A = Get-EventLog -LogName System -After $today -Newest $lognum
Write-Host "display sorted Array Events_A"
# Sort Array by InstanceId in descending order �z����~���Ƀ\�[�g����
$Events_A | Sort-Object -Property InstanceId -Descending

Write-Host "���������z�����邽�߂̔z��B"
$Events_B = Get-EventLog -LogName System -After $today -Newest $lognum
Write-Host "display sorted Array Events_B"
# Sort Array by InstanceId in descending order �z����~���Ƀ\�[�g����
$Events_B | Sort-Object -Property InstanceId -Descending

Write-Host "�z�񓯎m���������ĐV�����z������"
$Events_Set = $Events_A + $Events_B

Write-Host "InstanceID�ō~���Ƀ\�[�g���āA�����[�v��������"
$Events_Set.GetEnumerator() | Sort-Object -Property InstanceId -Descending | ForEach-Object {
    Write-Host $_.InstanceId
}