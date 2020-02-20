# �ǂݎ��Excel�̏���ϐ��ɐݒ肷��
$filename = "C:\work\PowerShell\union\make_csv\powershell_testdata.xlsx"

 
# �ϐ����`����
$excel = $null
$workbook = $null
$worksheet = $null
 
try
{
    # Excel��COM�I�u�W�F�N�g���擾����
    $excel = New-Object -ComObject Excel.Application
 
    # Excel�̓���̐ݒ������
    $excel.Visible = $true
    $excel.DisplayAlerts = $true
 
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