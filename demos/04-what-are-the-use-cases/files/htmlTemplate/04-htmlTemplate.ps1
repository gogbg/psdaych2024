$filePath = 'C:\events\psdaych2024\demos\04-what-are-the-use-cases\files\htmlTemplate\unattached disksReport .html'
Update-PSPlaceholder -Path $filePath -Values @{
    date  = Get-Date
    disks = @(
        @{
            name         = 'disk1'
            isAttached   = $true
            subscription = 'Subscription 1'
        },
        @{
            name         = 'disk2'
            isAttached   = $false
            subscription = 'Subscription 2'
        },
        @{
            name         = 'disk3'
            isAttached   = $true
            subscription = 'Subscription 3'
        },
        @{
            name         = 'disk4'
            isAttached   = $true
            subscription = 'Subscription 1'
        },
        @{
            name         = 'disk5'
            isAttached   = $false
            subscription = 'Subscription 1'
        },
        @{
            name         = 'disk6'
            isAttached   = $true
            subscription = 'Subscription 1'
        }
    )
} -AdaptTo html
```