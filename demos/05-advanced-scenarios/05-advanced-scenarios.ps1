#what if some of the inputs are used in multiple places but the result should be slightly different.
#You can repeat them, as typical placeholder/token replacement tools do.
#Or you can use executable placeholders, to transform them in place.

#Join collections
cls
Update-PSPlaceholder -String 'Registered attendees: {{& $people -join ", "}}' -Values @{
    people = @('John', 'Alice', 'Bob')
}
cls
Update-PSPlaceholder -String 'Registered attendees: {{& $people -join ", "}}' -Values @{
    people = @('John')
}

#format the date
cls
Update-PSPlaceholder -String 'Registration closes on {{& $date.DayOfWeek}} at {{& $date.ToString("HH:mm")}}' -Values @{
    date = get-date
}

#Or all at the same time
cls
Update-PSPlaceholder -String 'At {{& $date.ToString("HH:mm")}} there {{& $people.count -gt 1 ? "are" : "is"}} {{& $people.count}} registered attendees: {{& $people -join ", "}}' -Values @{
    people = @('John', 'Alice', 'Bob')
    date   = get-date
}

#And to make the linters happy, you can use adaptation. Currently supported only for JSON
cls
Update-PSPlaceholder -String '{
  "FirstName":"John",
  "LastName":"Dow",
  "Colleagues":"{{people}}"
}' -Values @{people = @('John', 'Alice', 'Bob') } -AdaptTo json
cls
Update-PSPlaceholder -String '{
  "FirstName":"John",
  "LastName:"Dow",
  "Colleagues":"{{people}}"
}' -Values @{people = 'John' } -AdaptTo json

#update json files with adaptation
$someJsonFilePath = 'C:\events\psdaych2024\demos\05-advanced-scenarios\files\someJsonDocument.json'
Update-PSPlaceholder -Path $someJsonFilePath -Values @{
    people = @('John', 'Alice', 'Bob') 
} -AdaptTo json