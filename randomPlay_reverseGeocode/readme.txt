��GoogleMap API���g����悤��Google Cloud Platform�Ń��[�U�o�^����
�@How to regist user on Google Cloud Platform to enable you to use GoogleMap API
�@
�@�����{��̂�
�@https://qiita.com/Haruka-Ogawa/items/997401a2edcd20e61037

��GoogleMap API��Powershell�Ŏg����悤�ɂ���菇 
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

�����ꂪ�o����API�L�[��ݒ肵�Y��Ă���
�@If it occured, you may forget assign API Key

PS C:\windows\system32> "White House","Eiffel Tower" |Get-GeoCoding
You need to register and get an API key and save it as environment variable $env:GoogleGeocode_API_Key = "YOUR API KEY"

Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key

�����ꏊ C:\Root\Documents\WindowsPowerShell\Modules\GoogleMap\1.0.0.3\GoogleMap.psm1:80 ����:13
+             Throw "You need to register and get an API key and save i ...
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ CategoryInfo          : OperationStopped: (You need to reg...get-api-key
:String) [], RuntimeException
+ FullyQualifiedErrorId : You need to register and get an API key and save it as environment variable $env:GoogleG
eocode_API_Key = "YOUR API KEY"
Follow this link and get the API Key - http://developers.google.com/maps/documentation/geocoding/get-api-key

�����̂悤��API�L�[��ݒ肷���OK
�@How to solve error above

$env:GoogleGeocode_API_Key ="hogehoge"


