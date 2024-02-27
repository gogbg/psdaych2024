#should complain about missing FirstName placeholder value.
cls
Update-PSPlaceholder -String 'My name is {{FirstName}} {{LastName}}' -Values @{
  LastName  ='Dow'
}

#should skip missing FirstName placeholder value.
cls
Update-PSPlaceholder -String 'My name is {{FirstName}} {{LastName}}' -Values @{
  LastName  ='Dow'
} -AllowEmptyPlaceholders

#should warn for unused placeholder values
cls
Update-PSPlaceholder -String 'My name is {{FirstName}} {{LastName}}' -Values @{
  FirstName ='John'
  LastName  ='Dow'
  yearInSchool = 'second'
  today = get-date
}

#It behaves the same way when you work with Files and Folders
cls
Update-PSPlaceholder -Path 'C:\events\psdaych2024\demos\03-replacing-placeholders\files' -Values @{
  LastName  ='Dow'
  someStrangeValue = 'someStrangeValue'
}