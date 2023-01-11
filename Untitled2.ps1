#tõnis kändmaa
# 15.12.22
#it-22

$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath


$inputFileName = Read-Host "Enter the name of the XML file: "

if ($inputFileName -notmatch "$_.xml")
{
    DO
    {
        write-host "vale fail"
        $inputFileName = read-host "vale fail"
    }
   Until ($inputFileName -match "$_.xml")
}

#laeb xml faili
$file = [xml](Get-Content $dir\$inputFileName)

#Loop 
foreach ($user in $file.customers.customer) {
    # uus kaust

    New-Item $dir\$($user.full_name) -ItemType Directory
    #Savekasutaja adnmed  tvt failis

    new-item $dir\$($user.full_name)\data.txt

    $user >> "$dir\$($user.full_name)\data.txt"

}