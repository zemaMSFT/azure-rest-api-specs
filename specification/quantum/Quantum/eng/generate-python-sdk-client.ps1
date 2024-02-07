# --------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
# --------------------------------------------------------------------------------------------

# Regenerate the Python SDK client from the private swagger

$VerbosePreference = 'Continue'

if (-not $env:QDK_PYTHON_REPO)
{
    Write-Host "Set the env var QDK_PYTHON_REPO with the QDK-Python repo folder."
    return
}

try
{
    Push-Location (Join-Path $env:QDK_PYTHON_REPO "/azure-quantum/")

    # $SwaggerRepoUrl = "https://github.com/Azure/azure-rest-api-specs-pr"
    # $SwaggerRepoBranch = "vxfield-quantum-Microsoft.Quantum-2023-09-01-preview"
    $SwaggerTagVersion = "package-2023-09-01-preview"
    $SwaggerRepoUrl = (Join-Path $PSScriptRoot "../../../../")

    ./eng/Generate-DataPlane-Client.ps1 `
        -SwaggerRepoUrl $SwaggerRepoUrl `
        -SwaggerRepoBranch $SwaggerRepoBranch `
        -SwaggerTagVersion $SwaggerTagVersion `
        -Verbose | Write-Verbose
}
finally
{
    Pop-Location
}

