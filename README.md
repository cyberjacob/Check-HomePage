# Check-HomePage
Powershell script for checking the IE homepage of multiple PCs

Some varients of Cryptolocker change the user's home page to the payment page (or similar)
This script using PSRemoting to search the registrys of the specified computer for users, then checks each user's homepage
Useful for finding which PC got infected, must be run as a domain administrator
