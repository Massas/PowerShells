★GoogleMap APIを使えるようにGoogle Cloud Platformでユーザ登録する
　How to regist user on Google Cloud Platform to enable you to use GoogleMap API
　
　★日本語のみ
　https://qiita.com/Haruka-Ogawa/items/997401a2edcd20e61037

★GoogleMap APIをPowershellで使えるようにする手順 
How to be able to use "Google Map API" with Powershell

Install-Module -Name GoogleMap

Find-Module GoogleMap

Get-ExecutionPolicy

Get-ExecutionPolicy -Scope CurrentUser

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Get-ExecutionPolicy -List

Find-Module GoogleMap | Install-Module -Scope CurrentUser -Verbose -Force -AllowClobber

Import-Module GoogleMap

★これが出たらAPIキーを設定し忘れている
　If it occured, you may forget assign API Key

PS C:\windows\system32> "White House","Eiffel Tower" |Get-GeoCoding
You need to register and get an API key and save it as environment variable $env:GoogleGeocode_API_Key = "YOUR API KEY"

Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key

発生場所 C:\Root\Documents\WindowsPowerShell\Modules\GoogleMap\1.0.0.3\GoogleMap.psm1:80 文字:13
+             Throw "You need to register and get an API key and save i ...
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ CategoryInfo          : OperationStopped: (You need to reg...get-api-key
:String) [], RuntimeException
+ FullyQualifiedErrorId : You need to register and get an API key and save it as environment variable $env:GoogleG
eocode_API_Key = "YOUR API KEY"
Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key

★このようにAPIキーを設定すればOK
　How to solve error above

$env:GoogleGeocode_API_Key ="hogehoge"


