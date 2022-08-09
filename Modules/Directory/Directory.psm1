# Directory
$github = "Documents/github"
$user = $env:USERPROFILE
$main = "/Users/benjamin"
$workspace = ($main + "/Documents/Code/")


function projects {
    Set-Location $env:USERPROFILE
    Set-Location $github && Get-ChildItem
}
function home {
    Set-Location $HOME && Clear-Host
}

# Profile
function ref {
    . $PROFILE
}
function ep {
    vim $Profile
}

function em {
    $orig = Get-Location
    Set-Location $env:USERPROFILE
    Set-Location .local/share/powershell/Modules
    vim .
    Set-Location $orig
}


function ws {
    Set-Location $workspace
}
$documents = "$user" + "Documents"

function downloads { 
    Set-Location $user
    Set-Location $downloadlocation 
}
function practice { 
    Set-Location $user
    Set-Location $vscodeworkspace && code . 
}
function docs { 
    Set-Location $user
    Set-Location $documents 
}
function lsn { 
    Get-ChildItem | Where-Object { $_.PSIsContainer } | Sort-Object -Descending LastWriteTime 
}
function qcd {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$file
    )

    $result = Get-ChildItem "*$file*"
    if ($result.Length -eq 1) {
        Set-Location "$result/$name"
    }
    elseif ($result.Length -gt 1) {
        "Too Many Results 💔 Try Again With More Refined Search" | Write-Host -ForegroundColor Yellow
    }
    else {
        "No Results 💔 Maybe you are in the wrong directory?" | Write-Host -ForegroundColor Red
    }
    

}
function .. {
    Set-Location ..
}

function ... {
    Set-Location ../..
}


function new {
    Param(
        [Parameter(Position = 1, Mandatory = $True)]
        [string] $switch,
        [Parameter(Position = 2, Mandatory = $True)]
        [string] $module
    )
    ws
    $current = $workspace + $switch
    $copyFrom = $current + "/DEFAULTS"
    Set-Location $switch
    
    if ($switch -eq "go") {
        mkdir $module
        Set-Location $module
        go mod init "$module/main"
    }
    elseif ($switch -eq "cs") {
        mkdir $module
        Set-Location $module
        dotnet new console
    }
    elseif ($switch -eq "cpp") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "rs") {
        cargo new $module
        Set-Location $module
    }
    elseif ($switch -eq "js") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "ts") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "py") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "pl") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "rb") {
        mkdir $module
        Set-Location $module
    }
    elseif ($switch -eq "exs") {
        mkdir $module
        Set-Location $module
        Copy-Item $copyFrom ./ -Force
    }
    elseif ($switch -eq "lua") {
        mkdir $module
        Set-Location $module
    }

    # Copy Template
    Copy-Item $copyFrom/* ./ -Force

    # Unique Edge Cases

    if ($switch -eq "cs") {
        mkdir .vscode
        mv ./*.json .vscode
    }
    vim .
}

function tsw {
    Remove-Item dist
    npx tsc -w
}

function run {

    Param(
        [Parameter(Mandatory = $True, Position = 0)]
        [string]$switch
    )

    if ($switch -eq "cpp") {
        g++ *.cpp
        ./a.out
    }
    elseif ($switch -eq "rs") {
        cargo run main.rs
    }
    elseif ($switch -eq "cs") {
        dotnet run Program.cs
    }
    elseif ($switch -eq "py") {
        python3 main.py
    }

    elseif ($switch -eq "ts") {
        bun main.ts
    }
    elseif ($switch -eq "js") {
        bun main.js
    }
    elseif ($switch -eq "go") {
        go run . 
    }
    elseif ($switch -eq "pl") {
        perl main.pl
    }
    elseif ($switch -eq "rb") {
        ruby main.rb
    }
    elseif ($switch -eq "exs") {
        elixir main.exs
    }
    elseif ($switch -eq "lua") {
        lua main.lua
    }

}


function icloud {
    Set-Location $user
    ..
    ..
    Set-Location "~/Library/Mobile Documents/com~apple~CloudDocs"
}


function location { Get-Location | ForEach-Object { $_.Path } }