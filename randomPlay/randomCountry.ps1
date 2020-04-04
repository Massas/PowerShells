#ファイルパスの定義
$targetdir = "C:\work\PowerShell\randomPlay"
#ファイル名の定義
$writefile = $targetdir + '\result.txt'
#データファイル 
$datafile = "C:\work\PowerShell\randomPlay\ListOfCountries\countries.csv"
#結果ファイル
$resultfile = "C:\work\PowerShell\randomPlay\result.txt"
#国と地域の数
$countries = 241

# ファイルがなければ作る
if(Test-Path $writefile){
    Write-Host "${writefile} is found!"
}else{
    New-Item -Path $writefile -ItemType File
}

#random number
$num = Get-Random

#国はcountries.csvに書いてある241ヵ国で計算
$countryNum =$num % $countries

$str = Get-Content $datafile
$separateStr = $str.Split(",")
$selectedCountry = $separateStr[$countryNum]
Write-Host "selectedCountry : ${selectedCountry}"

$resultStr = (Get-Content $resultfile) -as [string[]]

#重複となる結果はやり直し
if($null -eq $resultStr){
    #書き出す
    Write-Host "Add : ${selectedCountry}"
    Write-Output ${selectedCountry} | Add-Content $writefile -Encoding Default
}else{
    #結果が重複するか判定
    $loopcnt=1
    foreach ($cmpstr in $resultStr) {
        if($selectedCountry -eq $cmpstr){
            #重複結果が見つかったら処理を中断する
            exit
        }
        $loopcnt++
    }

    #書き出す
    Write-Host "Add : ${selectedCountry}"
    Write-Output ${selectedCountry} | Add-Content $writefile -Encoding Default
}