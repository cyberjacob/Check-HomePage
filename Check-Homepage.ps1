# Some varients of Cryptolocker change the user's home page to the payment page (or similar)
# This script using PSRemoting to search the registrys of the specified computer for users, then checks each user's homepage
# Useful for finding which PC got infected, must be run as a domain administrator


# List of PCs to search
$RemoteComputers = @(
    "PC01",
    "PC02",
    "PC03"
    )

# For each PC, run the block remotly
Invoke-Command -Computername $RemoteComputers -ScriptBlock {
    # Print the hostname of the remote PC
    hostname
    # Connect to the users registry hive
    $drive = New-PSDrive -Name HKU -PSProvider Registry -Root Registry::HKEY_USERS
    # For each user in the hive
    foreach ($User in Get-ChildItem "HKU:\") {
        # print the user's homepage
        Write-host $User.PSChildName" "(Get-ItemProperty -erroraction SilentlyContinue ("HKU:\"+$User.PSChildName+"\Software\Microsoft\Internet Explorer\Main")).Default_Page_URL
    }
}

