$files = Get-ChildItem -Path D:\socra\Documents\code -Filter karma.conf.js -Recurse | Where {$_.DirectoryName -notlike '*node_modules*'}

$current_dir = (Get-Item -Path ".\" -Verbose).FullName

foreach ($file in $files) {
   cd $file.DirectoryName
   $install = npm install | Out-String
   $test_result = [string](npm test | Out-String) 
   if($test_result -notlike '*ERROR*'){
       Write-Host 'SUCCESS !!!'
   } else {
       Write-Host $test_result
   }
   cd $current_dir
 }
