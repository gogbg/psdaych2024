$uiStingsFilePath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\azureTemplateSpecUi\config\uiStrings.jsonc'
$templatesFolderPath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\azureTemplateSpecUi\templates'

#Load the uiStrings as placeholder values
$phValues = Get-Content -Path $uiStingsFilePath -Raw | ConvertFrom-Json -AsHashtable

#Get placeholders in all templates
cls
Get-PSPlaceholder -Path $templatesFolderPath | Format-Table name, type

#update placeholders
Update-PSPlaceholder -Path $templatesFolderPath -Values @{
    uiStrings                      = $phValues
    environmentType                = 'dev'
    allowedDeploymentSubscriptions = @('MSDN Platforms Subscription', 'Visual Studio Professional Subscription')
} -AdaptTo json

#publish templateSpec
$newAzTemplateSpecParams = @{
    ResourceGroupName    = 'psdaych2024'
    Name                 = 'sqlServer'
    Version              = '1.0.0'
    Description          = 'Test sql server'
    DisplayName          = 'Sql Server'
    TemplateFile         = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\azureTemplateSpecUi\templates\sqlServer\sqlServer.json'
    VersionDescription   = 'Initial version'
    Location             = 'westeurope'
    UIFormDefinitionFile = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\azureTemplateSpecUi\templates\sqlServer\sqlServer.ui.jsonc'
}
New-AzTemplateSpec @newAzTemplateSpecParams -ErrorAction Stop