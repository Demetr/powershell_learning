class Book {
    # Class properties
    [string]   $Title
    [string]   $Author
    [string]   $Synopsis
    [string]   $Publisher
    [datetime] $PublishDate
    [int]      $PageCount
    [string[]] $Tags
    # Default constructor
    Book() { $this.Init(@{}) }
    # Convenience constructor from hashtable
    Book([hashtable]$Properties) { $this.Init($Properties) }
    # Common constructor for title and author
    Book([string]$Title, [string]$Author) {
        $this.Init(@{Title = $Title; Author = $Author })
    }
    # Shared initializer method
    [void] Init([hashtable]$Properties) {
        foreach ($Property in $Properties.Keys) {
            $this.$Property = $Properties.$Property
        }
    }
    # Method to calculate reading time as 30 seconds per page
    [timespan] GetReadingTime() {
        if ($this.PageCount -le 0) {
            throw 'Unable to determine reading time from page count.'
        }
        $Minutes = $this.PageCount * 2
        return [timespan]::new(0, $Minutes, 0)
    }
    # Method to calculate how long ago a book was published
    [timespan] GetPublishedAge() {
        if (
            $null -eq $this.PublishDate -or
            $this.PublishDate -eq [datetime]::MinValue
        ) { throw 'PublishDate not defined' }

        return (Get-Date) - $this.PublishDate
    }
    # Method to return a string representation of the book
    [string] ToString() {
        return "$($this.Title) by $($this.Author) ($($this.PublishDate.Year))"
    }
}

class BookList {
    # Static property to hold the list of books
    static [System.Collections.Generic.List[Book]] $Books
    # Static method to initialize the list of books. Called in the other
    # static methods to avoid needing to explicit initialize the value.
    static [void] Initialize()             {
         [BookList]::Initialize($false)
        }
    static [bool] Initialize([bool]$force) {
        if ([BookList]::Books.Count -gt 0 -and -not $force) {
            return $false
        }
        return $true
    }
}

class DigitalBookList : BookList {
    DigitalBookList() : base() {
        [BookList]::Initialize()
    }

}