class AbstractMulticellular {
    $Color = "Grey"
    $Size = "Small"
    # [string]$Color = [string]::Empty;
    # [string]$Size = [string]::Empty;    

    AbstractMulticellular() {
        $type = $this.GetType()
        if ($type -eq [Animal]) {
            throw "Class [$type] must be inherited"
        }
    }
}

# class Animal: AbstractMulticellular {
#         [string]$Type = "Animal";
#         [string]$Color = [string]::Empty;
#         [string]$Size = [string]::Empty;

#         Animal() : base() {
#                 $this.Color = "Grey"
#                 $this.Size = "Small"
#             }

class Animal {
        [string]$Type = "Animal";
        [string]$Color = [string]::Empty;
        [string]$Size = [string]::Empty;
        #TODO: [string]$Subspecies = [string]::Empty;

        Animal() {
            $this.Color = "Grey"
            $this.Size = "Small"
        }

        Animal([string]$Color, [string]$Size) {
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
    [string]$Size = [string]::Empty;
    
    # Tiger() {
    #     $this.Stripes = $true
    #     $this.Stripes_Color = "Black"
    # }

    Tiger() : base("Golden Orange", "Medium") {
        $this.Stripes = $true
        $this.Stripes_Color = "Brown"
        #$this.Subspecies = $Subspecies
    }

    Tiger([string]$Color="Orange", [string]$Size="Medium", [bool]$Stripes = $true, `
            [string]$Stripes_Color = "Black") : base($Color, $Size) {
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