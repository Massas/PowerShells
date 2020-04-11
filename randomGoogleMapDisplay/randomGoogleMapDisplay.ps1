#FUNCTION:引数として受け取った緯度・経度をURL文字列に組み込んでブラウザ起動する関数
function mapBrowserDisplay ($latitude_int,$longitude_int) {
    # IEオブジェクト
    $ie = New-Object -ComObject InternetExplorer.Application;

    # URL指定してIEを開く
    $URL = "https://www.google.com/maps?q=${latitude_int},${longitude_int}"
    $ie.Navigate($URL)
    $ie.Visible = $true

    # ロード完了まで待機
    While($ie.busy){Start-Sleep -Milliseconds 100}
}

#緯度・経度に付随する符号をランダムに決定する関数
function minusSignDecide($signseed,$signstr){
    $signseed_calced = $signseed % 2
    if($signseed_calced -eq 1){
        $signstr = '-'
    } else{
        $signstr = ''
    }
    #戻り値を返す
    Write-Output($signstr)
}

#緯度をランダム生成する処理
function createLatitude {
    $latitudeint=Get-Random -Maximum 90 -Minimum 0
    $minussign_lat = ''
    $signseed_lat=Get-Random
    #緯度・経度の符号を決定する
    minusSignDecide $signseed_lat $minussign_lat
    $latradix = Get-Random -Maximum 999999 -Minimum 0
    #緯度の値を文字列連結で実現する
    $latitude = $minussign_lat + [string]$latitudeint + '.' + [string]$latradix

    Write-Output($latitude)

}

#経度をランダム生成する処理
function createLongitude{
    $longitudeint=Get-Random -Maximum 180 -Minimum 0
    $minussign_lon = ''
    $signseed_lon=Get-Random
    #緯度・経度の符号を決定する
    minusSignDecide $signseed_lon $minussign_lon
    $lonradix = Get-Random -Maximum 999999 -Minimum 0
    #緯度の値を文字列連結で実現する
    $longitude = $minussign_lon + [string]$longitudeint + '.' + [string]$lonradix

    Write-Output($longitude)
}

### main ###

#緯度のランダム生成処理
$latitude = createLatitude
#経度のランダム生成処理
$longitude = createLongitude

Write-Host ""
Write-Host "latitude = ${latitude}"
Write-Host "longitude = ${longitude}"

#ランダムに取得した緯度経度を用いてGoogleMapをブラウザ起動する
mapBrowserDisplay $latitude $longitude
