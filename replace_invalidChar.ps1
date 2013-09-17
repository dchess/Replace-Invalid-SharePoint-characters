#Set root variable to archive folder path before running!
$root = Read-Host "Enter the root folder path:
Example: C:\users\dhess\desktop\"

[string[]] $invalid = "\&", "\~", "\#", "\{", "\}", "\%"
[string[]] $replacement = "and", "-", "no.", "", "", "per."

FOR($i =0; $i -le $invalid.Count-1; $i++){
    gci $root -Recurse | Where-Object {$_.FullName -match $invalid[$i]} | % { ren $_.FullName ($_.Name -replace $invalid[$i], $replacement[$i])}
}

Write-Host "All files in $root have been renamed."
