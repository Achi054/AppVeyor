echo "In directory: $PSScriptRoot"

$solution = "AlpineSkiHouse.sln"
$test = "test\AlpineSkiHouseTests\AlpineSkiHouseTests.csproj"

function Invoke-Build() {
    Write-Output "Building"

    if (Test-Path .\artifacts) {
        echo "build: Cleaning .\artifacts"
        Remove-Item .\artifacts -Force -Recurse
    }

    & dotnet restore $solution
    if ($LASTEXITCODE -ne 0) {
        Write-Output "The restoration failed"
        exit 1 
    }

    & dotnet build $solution -c Release
    if ($LASTEXITCODE -ne 0) {
        Write-Output "The build failed"
        exit 1 
    }

    & dotnet test $test -c Release
    if ($LASTEXITCODE -ne 0) {
        Write-Output "The tests failed"
        exit 1 
    }
    Write-Output "Building done"
}

$ErrorActionPreference = "Stop"
Invoke-Build 
