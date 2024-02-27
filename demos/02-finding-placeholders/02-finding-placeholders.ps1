#should return used placeholders in string
cls
Get-PSPlaceholder -String 'My name is {{FirstName}} {{LastName}}' | ft

#should return used placeholders in specific file
cls
Get-PSPlaceholder -Path 'C:\events\psdaych2024\demos\02-finding-placeholders\files\sampleFile.txt' | ft

#should return used placeholders in all files underneath the specified folder
cls
Get-PSPlaceholder -Path 'C:\events\psdaych2024\demos\02-finding-placeholders\files' | ft

#should feed the file statistics ref variable with the used placeholders in all files underneath the specified folder
cls
[ref]$fs = $Null
Get-PSPlaceholder -Path 'C:\events\psdaych2024\demos\02-finding-placeholders\files' -FileStatistics $fs
$fs.Value | ft name,PlaceholderInName,PlaceholderInContent