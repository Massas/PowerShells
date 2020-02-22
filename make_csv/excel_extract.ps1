 # �ϐ����`����
$excel = $null
$workbook = $null
$worksheet = $null
$writefile = $null
$targetdir = $null
$itemlist = $null

try
{
    # Excel��COM�I�u�W�F�N�g���擾����
    $excel = New-Object -ComObject Excel.Application
 
    # Excel�̓���̐ݒ������
    $excel.Visible = $true
    $excel.DisplayAlerts = $true

    # �Ǎ��t�@�C�����X�g���擾
    $targetdir = "C:\work\PowerShell\union\make_csv"
    Write-Host "targetdir = "$targetdir

    # $itemlist = Get-ChildItem $targetdir -Filter "*.xlsx" -Name
    $itemlist = Get-ChildItem $targetdir -Filter "*.xlsx"

    # ��t�@�C���̍쐬
    $writefile = $targetdir + '\test.txt'
    New-Item -Path $writefile -ItemType File

    foreach($item in $itemlist){

        Write-Host "��������t�@�C�����F" $item.Name 

        if($item.PSisContainer){
            # �t�H���_�͖���
        }
        else{

            $filename = $targetdir + "\" + $item.Name
            Write-Host "filename = " $filename

            # Excel�t�@�C���̎w�肵���V�[�g�̃Z���̒l���擾����
            $workbook = $excel.Workbooks.Open($filename)
            $worksheet = $workbook.Sheets(1)
            $value_age = $worksheet.Range("C3").Text
            $value_sex = $worksheet.Range("C4").Text
            $value_belonging = $worksheet.Range("C5").Text
            $value_len_year = $worksheet.Range("C6").Text
            $value_q1 = $worksheet.Range("B9").Text
            $value_q2 = $worksheet.Range("B15").Text
            $value_q3 = $worksheet.Range("B18").Text

            # ������A������
            $value_str_to_csv = $value_age + "," + $value_sex + "," + $value_belonging + "," + $value_len_year + "," + $value_q1 + "," + $value_q2 + "," + $value_q3

            # �擾�����Z���̒l���R���\�[���ɕ\������
            Write-Host "�t�@�C����:" $filename
            Write-Host "�V�[�g��:" $worksheet.Name
            Write-Host "�擾�����Z���̒l �N��:" $value_age
            Write-Host "�擾�����Z���̒l ����:" $value_sex
            Write-Host "�擾�����Z���̒l ����:" $value_belonging
            Write-Host "�擾�����Z���̒l �����N��:" $value_len_year
            Write-Host "�擾�����Z���̒l Q1:" $value_q1
            Write-Host "�擾�����Z���̒l Q2:" $value_q2
            Write-Host "�擾�����Z���̒l Q3:" $value_q3
            Write-Host "��csv�ɏ������ރf�[�^�F" $value_str_to_csv

            # �t�@�C���ւ̏�������
            Write-Output $value_str_to_csv | Add-Content $writefile -Encoding Default

        }
    }    
}
catch
{
    # �G���[���b�Z�[�W��\������
	Write-Error("Error"+$_.Exception)
}
finally
{
    # COM�I�u�W�F�N�g���J������
    # ��ReleaseComObject�͖߂�l0��Ԃ��Ă���񂾂���
    #   �R���\�[����0���\�������̂ŕϐ��Ŏ󂯎���ĕ\�����Ȃ��悤�ɂ���
    if($null -ne $worksheet)
    {
        # ���[�N�V�[�g��j������
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($worksheet)
    }
    if($null -ne $workbook)
    {
        # Excel�t�@�C�������
        $workbook.Close($false)
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($workbook)
    }
    if($null -ne $excel)
    {
        # Excel�����
        $excel.Quit()
        $result = [System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel)
    }
}
 
# ���s�͂����܂�
Write-Host "result: " $result
Write-Host "�����܂�"