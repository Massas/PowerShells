# 読み取るExcelの情報を変数に設定する
$filename = "C:\work\PowerShell\union\make_csv\powershell_testdata.xlsx"

 
# 変数を定義する
$excel = $null
$workbook = $null
$worksheet = $null
 
try
{
    # ExcelのCOMオブジェクトを取得する
    $excel = New-Object -ComObject Excel.Application
 
    # Excelの動作の設定をする
    $excel.Visible = $true
    $excel.DisplayAlerts = $true
 
    # Excelファイルの指定したシートのセルの値を取得する
    $workbook = $excel.Workbooks.Open($filename)
    $worksheet = $workbook.Sheets(1)
    $value_age = $worksheet.Range("C3").Text
    $value_sex = $worksheet.Range("C4").Text
    $value_belonging = $worksheet.Range("C5").Text
    $value_len_year = $worksheet.Range("C6").Text
    $value_q1 = $worksheet.Range("B9").Text
    $value_q2 = $worksheet.Range("B15").Text
    $value_q3 = $worksheet.Range("B18").Text
 
    # 取得したセルの値をコンソールに表示する
    Write-Host "ファイル名:" $filename
    Write-Host "シート名:" $worksheet.Name
    Write-Host "取得したセルの値 年齢:" $value_age
    Write-Host "取得したセルの値 性別:" $value_sex
    Write-Host "取得したセルの値 所属:" $value_belonging
    Write-Host "取得したセルの値 所属年数:" $value_len_year
    Write-Host "取得したセルの値 Q1:" $value_q1
    Write-Host "取得したセルの値 Q2:" $value_q2
    Write-Host "取得したセルの値 Q3:" $value_q3
}
catch
{
    # エラーメッセージを表示する
	Write-Error("Error"+$_.Exception)
}
finally
{
    # COMオブジェクトを開放する
    # ※ReleaseComObjectは戻り値0を返してくるんだけど
    #   コンソールに0が表示されるので変数で受け取って表示しないようにする
    if($null -ne $worksheet)
    {
        # ワークシートを破棄する
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($worksheet)
    }
    if($null -ne $workbook)
    {
        # Excelファイルを閉じる
        $workbook.Close($false)
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($workbook)
    }
    if($null -ne $excel)
    {
        # Excelを閉じる
        $excel.Quit()
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
    }
}
 
# 実行はおしまい
Write-Host "result: " $result
Write-Host "おしまい"