#should install latest psplaceholders module from psgallery
Install-PSResource -RequiredResource @{
  'PsPlaceholders'         = @{
    Version    = '0.1.3'
    Repository = 'PSGallery'
  }
} -TrustRepository

#should return: 'My name is John'
cls
Update-PSPlaceholder -String 'My name is {{FirstName}}' -Values @{FirstName='John'}

#should return: 'My name is John Dow'
cls
Update-PSPlaceholder -String 'My name is {{FirstName}} {{LastName}}' -Values @{
  FirstName ='John'
  LastName  ='Dow'
}

#should update all placeholders in the file sampleFile.txt
cls
$filePath = 'C:\events\psdaych2024\demos\01-how-placeholders-look-like\files\sampleFile.txt'
Update-PSPlaceholder -Path $filePath -Values @{
  FirstName ='John'
  LastName  ='Dow'
  yearInSchool = 'second'
  today = get-date
}

#should update all placeholders in all files underneath the specified folder
cls
$folderPath = 'C:\events\psdaych2024\demos\01-how-placeholders-look-like\files\someFolder'
Update-PSPlaceholder -Path $folderPath -Values @{
  FirstName ='John'
  LastName  ='Dow'
  yearInSchool = 'second'
  today = get-date
}

#should update all placeholders in all files underneath the specified folder and its subfolders in both the content and the file names
cls
$folderPath = 'C:\events\psdaych2024\demos\01-how-placeholders-look-like\files\someOtherFolder'
Update-PSPlaceholder -Path $folderPath -Values @{
  FirstName ='John'
  LastName  ='Dow'
  yearInSchool = 'second'
  today = get-date
}
