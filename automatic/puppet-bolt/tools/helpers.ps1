Function Remove-PathVariable {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [String]
        $VariableToRemove
    )

    process {
        $path = [Environment]::GetEnvironmentVariable("PATH", "User")
        if ($path -ne $null) {
            $newItems = $path.Split(';', [StringSplitOptions]::RemoveEmptyEntries) | Where-Object { "$($_)" -inotlike $VariableToRemove }
            [Environment]::SetEnvironmentVariable("PATH", [System.String]::Join(';', $newItems), "User")
        }

        $path = [Environment]::GetEnvironmentVariable("PATH", "Process")
        if ($path -ne $null) {
            $newItems = $path.Split(';', [StringSplitOptions]::RemoveEmptyEntries) | Where-Object { "$($_)" -inotlike $VariableToRemove }
            [Environment]::SetEnvironmentVariable("PATH", [System.String]::Join(';', $newItems), "Process")
        }
    }
}