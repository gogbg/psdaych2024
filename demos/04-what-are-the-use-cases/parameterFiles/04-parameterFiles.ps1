$paramFolderPath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\parameterFiles\sqlAndSW'

#get placeholders in all parameter files
cls
Get-PSPlaceholder -Path $paramFolderPath | ft name, type, InFileCount, InFileNameCount

#create temp folder for the updated parameter files
$tempFolder = Split-Path $paramFolderPath | Join-Path -ChildPath 'outputParamFiles'
if (Test-Path -Path $tempFolder) {
    Remove-Item -Path $tempFolder -Recurse -Force
}
$null = New-Item -Path $tempFolder -ItemType Directory
Copy-Item -Path $paramFolderPath -Destination $tempFolder -Recurse -Force

Update-PSPlaceholder -Path $tempFolder -Values @{
    #to fill param values
} -AdaptTo json