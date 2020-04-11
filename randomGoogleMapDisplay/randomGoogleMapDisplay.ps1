#FUNCTION:�����Ƃ��Ď󂯎�����ܓx�E�o�x��URL������ɑg�ݍ���Ńu���E�U�N������֐�
function mapBrowserDisplay ($latitude_int,$longitude_int) {
    # IE�I�u�W�F�N�g
    $ie = New-Object -ComObject InternetExplorer.Application;

    # URL�w�肵��IE���J��
    $URL = "https://www.google.com/maps?q=${latitude_int},${longitude_int}"
    $ie.Navigate($URL)
    $ie.Visible = $true

    # ���[�h�����܂őҋ@
    While($ie.busy){Start-Sleep -Milliseconds 100}
}

#�ܓx�E�o�x�ɕt�����镄���������_���Ɍ��肷��֐�
function minusSignDecide($signseed,$signstr){
    $signseed_calced = $signseed % 2
    if($signseed_calced -eq 1){
        $signstr = '-'
    } else{
        $signstr = ''
    }
    #�߂�l��Ԃ�
    Write-Output($signstr)
}

#�ܓx�������_���������鏈��
function createLatitude {
    $latitudeint=Get-Random -Maximum 90 -Minimum 0
    $minussign_lat = ''
    $signseed_lat=Get-Random
    #�ܓx�E�o�x�̕��������肷��
    minusSignDecide $signseed_lat $minussign_lat
    $latradix = Get-Random -Maximum 999999 -Minimum 0
    #�ܓx�̒l�𕶎���A���Ŏ�������
    $latitude = $minussign_lat + [string]$latitudeint + '.' + [string]$latradix

    Write-Output($latitude)

}

#�o�x�������_���������鏈��
function createLongitude{
    $longitudeint=Get-Random -Maximum 180 -Minimum 0
    $minussign_lon = ''
    $signseed_lon=Get-Random
    #�ܓx�E�o�x�̕��������肷��
    minusSignDecide $signseed_lon $minussign_lon
    $lonradix = Get-Random -Maximum 999999 -Minimum 0
    #�ܓx�̒l�𕶎���A���Ŏ�������
    $longitude = $minussign_lon + [string]$longitudeint + '.' + [string]$lonradix

    Write-Output($longitude)
}

### main ###

#�ܓx�̃����_����������
$latitude = createLatitude
#�o�x�̃����_����������
$longitude = createLongitude

Write-Host ""
Write-Host "latitude = ${latitude}"
Write-Host "longitude = ${longitude}"

#�����_���Ɏ擾�����ܓx�o�x��p����GoogleMap���u���E�U�N������
mapBrowserDisplay $latitude $longitude
