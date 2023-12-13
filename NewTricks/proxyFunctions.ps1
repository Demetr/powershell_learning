$MetaData = New-Object System.Management.Automation.CommandMetaData (Get-Command  ConvertTo-Html)
[System.Management.Automation.ProxyCommand]::Create($MetaData)

[CmdletBinding(DefaultParameterSetName=’Items’, SupportsTransactions=$true)]
param(
    [Parameter(ParameterSetName=’Items’, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [System.String[]]
    ${Path},

    [Parameter(ParameterSetName=’LiteralItems’, Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias(‘PSPath’)]
    [System.String[]]
    ${LiteralPath},

    [Parameter(Position=1)]
    [System.String]
    ${Filter},

    [System.String[]]
    ${Include},

    [System.String[]]
    ${Exclude},

    [Switch]
    ${Recurse},

    [Switch]
    ${Force},

    [Switch]
    ${Name})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue(‘OutBuffer’, [ref]$outBuffer))
        {
            $PSBoundParameters[‘OutBuffer’] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(‘Get-ChildItem’, [System.Management.Automation.Command
Types]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Get-ChildItem
.ForwardHelpCategory Cmdlet

#>