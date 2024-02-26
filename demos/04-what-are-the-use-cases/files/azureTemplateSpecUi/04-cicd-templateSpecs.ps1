$uiStingsFilePath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\files\azureTemplateSpecUi\config\uiStrings.jsonc'
$templatesFolderPath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\files\azureTemplateSpecUi\templates'

#Load the uiStrings as placeholder values
$phValues = Get-Content -Path $uiStingsFilePath -Raw | ConvertFrom-Json -AsHashtable

#Get placeholders in all templates
Get-PSPlaceholder -Path $templatesFolderPath | Format-Table name, type

#update placeholders
Update-PSPlaceholder -Path $templatesFolderPath -Values @{
    uiStrings = $phValues
    environmentType = 'dev'
    allowedDeploymentSubscriptions= @('sub1', 'sub2')
} -AdaptTo json
