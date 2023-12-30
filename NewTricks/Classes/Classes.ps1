
using module .\AnimalHierarchy.psm1
using module .\BookHierarchy.psm1

Clear-Host
Remove-Variable * -ErrorAction SilentlyContinue

[Animal]::new().tp_repr()
$animal = [Animal]::new("Dark Grey", "Large")
$hetDier = $animal
$hetDier.ToString()
$hetDier.tp_repr()
Write-Output("---------------------")
$tigerWithOutParameters = [Tiger]::new()
$deTijgerZonderParameters = $tigerWithOutParameters
$deTijgerZonderParameters.tp_repr()
$tiger = [Tiger]::new("Orange", "Medium", $true, "Black") # "Bengal") subspecies in TODO
$deTijger = $tiger
$deTijger.ToString()
$deTijger.tp_repr()
Write-Output("---------------------")
$tiger0 = [Tiger]::new("Golden Orange", "Medium", $true, "Brown") # "Bengal") subspecies in TODO
$deTijger = $tiger0 
$tiger0.ToString()
$tiger0.tp_repr()
Write-Output("---------------------")
$elephant = [Elephant]::new("Grey", "Large", $true, "Pink") # "<Subspecies>") subspecies in TODO
$deOlifant = $elephant
$deOlifant.ToString()
$deOlifant.tp_repr()
Write-Output("---------------------")

#TODO Polymorphism
Write-Output "Polymorphism"
$mine = $animal
Function AnimalTestPolymorphism([Animal]$mine) {
    $mine.ToString()
    $mine.GetType().Name
}
   
AnimalTestPolymorphism($animal)
#"I'm a Large Dark Grey animal"
#"Animal"

AnimalTestPolymorphism($tiger)
"I'm a Large Orange Tiger"
"Tiger"



# $Book = [Book]::new(@{
#     Title       = 'The Hobbit'
#     Author      = 'J.R.R. Tolkien'
#     Publisher   = 'George Allen & Unwin'
#     PublishDate = '1937-09-21'
#     PageCount   = 310
#     Tags        = @('Fantasy', 'Adventure')
# })

$Book
$Time = $Book.GetReadingTime()
$Time = @($Time.Hours, 'hours and', $Time.Minutes, 'minutes') -join ' '
$Age  = [Math]::Floor($Book.GetPublishedAge().TotalDays / 365.25)

"It takes $Time to read $Book,`nwhich was published $Age years ago."

$null -eq [BookList]::Books

[BookList]::Add($Book)

[BookList]::Add([Book]::new(@{
    Title       = 'The Fellowship of the Ring'
    Author      = 'J.R.R. Tolkien'
    Publisher   = 'George Allen & Unwin'
    PublishDate = '1954-07-29'
    PageCount   = 423
    Tags        = @('Fantasy', 'Adventure')
}))
'grater than 1950-01-01'
[BookList]::Find({
    param ($b)

    $b.PublishDate -gt '1950-01-01'
}).Title

'Author is Tolkien'
[BookList]::FindAll({
    param($b)

    $b.Author -match 'Tolkien'
}).Title

[BookList]::Books
$null -eq [BookList]::Books