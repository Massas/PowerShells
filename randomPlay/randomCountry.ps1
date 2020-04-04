#�t�@�C���p�X�̒�`
$targetdir = "C:\work\PowerShell\randomPlay"
#�t�@�C�����̒�`
$writefile = $targetdir + '\result.txt'
#�f�[�^�t�@�C�� 
$datafile = "C:\work\PowerShell\randomPlay\ListOfCountries\countries.csv"
#���ʃt�@�C��
$resultfile = "C:\work\PowerShell\randomPlay\result.txt"
#���ƒn��̐�
$countries = 241

# �t�@�C�����Ȃ���΍��
if(Test-Path $writefile){
    Write-Host "${writefile} is found!"
}else{
    New-Item -Path $writefile -ItemType File
}

#random number
$num = Get-Random

#����countries.csv�ɏ����Ă���241�����Ōv�Z
$countryNum =$num % $countries

$str = Get-Content $datafile
$separateStr = $str.Split(",")
$selectedCountry = $separateStr[$countryNum]
Write-Host "selectedCountry : ${selectedCountry}"

$resultStr = (Get-Content $resultfile) -as [string[]]

#�d���ƂȂ錋�ʂ͂�蒼��
if($null -eq $resultStr){
    #�����o��
    Write-Host "Add : ${selectedCountry}"
    Write-Output ${selectedCountry} | Add-Content $writefile -Encoding Default
}else{
    #���ʂ��d�����邩����
    $loopcnt=1
    foreach ($cmpstr in $resultStr) {
        if($selectedCountry -eq $cmpstr){
            #�d�����ʂ����������珈���𒆒f����
            exit
        }
        $loopcnt++
    }

    #�����o��
    Write-Host "Add : ${selectedCountry}"
    Write-Output ${selectedCountry} | Add-Content $writefile -Encoding Default
}