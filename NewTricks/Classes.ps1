class Animal {
        [string]$Type = "Animal";
        [string]$Color = [string]::Empty;
        [string]$Size = [string]::Empty;
        #TODO: [string]$Subspecies = [string]::Empty;

        Animal([string]$Color="Grey", [string]$Size="Small") {
            $this.Color = $Color
            $this.Size = $Size
        }

        [string]ToString() { 
            return "I'm a {0} {1} {2}" -f $this.size, $this.color, $this.type
        }

        [string]tp_repr() {
            return "The creature is $($this.Size) $($this.Type), it is $($this.Color)"
        }
}

class Tiger : Animal {
    [string]$Type = "Tiger"
    [string]$Stripes_Color = [string]::Empty;
    [bool]$Stripes = $false
           
    Tiger([string]$Color="Grey", [string]$Size="Small", [bool]$Stripes = $true, [string]$Stripes_Color = "Black") : base($Color, $Size) {
        $this.Stripes = $Stripes
        $this.Stripes_Color = $Stripes_Color
        #$this.Subspecies = $Subspecies
    }

    [string]tp_repr() {
        return "The creature is $($this.Size) $($this.Type), it is $($this.Color) and " + `
                $($this.Stripes ? "has $($this.Stripes_Color) stripes" : "has no stripes")
    }
}

class Elephant : Animal {
    [string]$Type = "Elephant"
    [bool]$Spots = $false
    [string]$Spot_Color = [string]::Empty

    Elephant([string]$Color="Greyish Black", [string]$Size="Large", [bool]$Spots = $true, [string]$Spot_Color = "Pink") : base($Color, $Size) {
        $this.Color = $Color
        $this.Size = $Size
        $this.Spots = $Spots
        $this.Spot_Color = $Spot_Color
        #$this.Subspecies = $Subspecies
    }

    [string]tp_repr() {
        return "The creature is $($this.Size) $($this.Type), it is $($this.Color) and " + `
                $($this.Spots ? "has $($this.Spot_Color) spotes" : "has no spotes")
    }
}




$animal = [Animal]::new("Dark Grey", "Large")
$animal.ToString()
$animal.tp_repr()
Write-Output("---------------------")
$tiger = [Tiger]::new("Orange", "Medium", $true, "Black") # "Bengal") subspecies in TODO
$tiger.ToString()
$tiger.tp_repr()
Write-Output("---------------------")
$tiger = [Tiger]::new("Golden Orange", "Medium", $true, "Brown") # "Bengal") subspecies in TODO
$tiger.ToString()
$tiger.tp_repr()
Write-Output("---------------------")
$tiger = [Elephant]::new("Grey", "Large", $true, "Pink") # "<Subspecies>") subspecies in TODO
$tiger.ToString()
$tiger.tp_repr()
Write-Output("---------------------")

#TODO Polymorphism

# Function AnimalTest([Animal]$mine) {
#     $mine.ToString()
#     $mine.GetType().Name
# }
   
#AnimalTest($animal)
#"I'm a Large Brown animal"
#"Animal"

#AnimalTest($tiger)
#"I'm a Large Orange Tiger"
#"Tiger"
