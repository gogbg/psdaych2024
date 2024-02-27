#{} are not supported in executable placeholders for the time being. The "engine" simply don't recognize placeholders that contains them
cls
Update-PSPlaceholder -String 'Allowed users are {{& $users.where{$_.age -gt 18}.name -join "," }}' -Values @{
    users = @(
        @{
            name = 'John'
            age  = 20
        },
        @{
            name = 'Alice'
            age  = 17
        }
    )
}