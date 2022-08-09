function dnr {
    $location = location
    if ($location -clike "*UI") {
        dotnet run Program.cs
        Set-Location $location
    }
    else {
        Set-Location "$location/*UI"
        dotnet run Program.cs
        Set-Location $location
    }
}
function stocks {
    ticker -i 1 -w "SPY,BLNK,U" --show-summary --show-tags --show-fundamentals --show-holdings --show-separator
}
function help($command) {
    Get-Help $command -ShowWindow
}
function Get-Weather {
    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory = $false
        )]
        [string]
        $City,

        [Parameter(Position = 1)]
        [ValidateSet('Metric', 'USCS')]
        [string]
        $Units = 'USCS',

        [Parameter(Position = 2)]
        [ValidateSet('ar', 'af', 'be', 'ca', 'da', 'de', 'el', 'en', 'et', 'fr', 'fa', 'hu', 'ia', 'id', 'it', 'nb', 'nl', 'pl', 'pt-br', 'ro', 'ru', 'tr', 'th', 'uk', 'vi', 'zh-cn', 'zh-tw')]
        [string]
        $Language = 'en',

        [Parameter(Position = 3)]
        [switch]
        $Long
    )

    $uriString = 'https://wttr.in/'

    if ($City) {
        $uriString += "$City"
    }

    switch ($Units) {
        'Metric' {
            $uriString += "?m"
        }
        'USCS' {
            $uriString += "?u"
        }
    }

    if ($Long) {
        
    }
    else {
        $uriString += "&format=4"

    }

    $uriString += "&lang=$Language"
    Write-Verbose "URI: $uriString"

    $invokeSplat = @{
        Uri         = $uriString
        ErrorAction = 'Stop'
    }

    try {
        Invoke-RestMethod @invokeSplat
    }
    catch {
        Write-Error $_
    }
}#Get-Weather
function Get-PublicIP {
    [CmdletBinding()]
    param(

    )
    $uri = 'https://api.ipify.org'
    Write-Verbose -Message "Pulling public IP from $uri"
    try {
        $invokeRestMethodSSplat = @{
            Uri         = $uri
            ErrorAction = "Stop"
        }
        $publicIP = Invoke-RestMethod @invokeRestMethodSSplat
    }
    catch {
        Write-Error $_
    }

    return $publicIP
	
} #Get-PublicIP

function file { 
    $location = Get-Location;
    open . && Set-Location $location
}


function drives {  
    Get-PSDrive -PSProvider FileSystem 
}