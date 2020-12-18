# Written by Reece Mercer

<#
    .SYNOPSIS
    Takes a folder of images and converts them to WebP format
    
    .DESCRIPTION
    Downloads libwebp, if required, and compresses images in a given folder
    
    .PARAMETER downloadLibWebp
    Switch denoting whether libwebp is needed to be downloaded or not

    .PARAMETER compressionFactor
    The amount of compression to apply (default 80)

    .PARAMETER directory
    The path of the folder of images that is to be converted

    .INPUTS
    None.

    .OUTPUTS
    None

    .EXAMPLE
    ... you don't have libwebp installed
    PS> ConvertTo-Webp -downloadLibWebp -directory ./images

    .EXAMPLE
    ... you do have libwebp installed
    PS> ConvertTo-Webp -directory ./images
    
    .EXAMPLE
    ... override default compression factor
    PS> ConvertTo-Webp -directory ./images -compressionFactor 20
#>

param (
    [switch]$downloadLibWebp,
    [parameter(Mandatory = $false)]
    [ValidateRange(1, 100)]
    [int]$compressionFactor = 80,
    [parameter(Mandatory = $true)]
    [string]$directory
)

$download = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0-windows-x64.zip"

if ($downloadLibWebp) {
    Invoke-WebRequest $download -OutFile ./libwebp.zip; if ($?) { Expand-Archive ./libwebp.zip -DestinationPath ./libwebp -Force }
    Remove-Item ./libwebp.zip
    if (Test-Path $directory) {
        Get-ChildItem $directory | ForEach-Object {
            & ".\libwebp\libwebp-1.1.0-windows-x64\bin\cwebp.exe" -q $compressionFactor $_.FullName -o "$($_.Name).webp"
        }
    }
}
else {
    if (Test-Path $directory) {
        Get-ChildItem $directory | ForEach-Object {
            cwebp.exe -q $compressionFactor $_.FullName -o "$($_.Name).webp"
        }
    }
}