﻿Set-StrictMode -Version latest
<#
    © 2017 Microsoft Corporation. All rights reserved. This sample code is not supported under any Microsoft standard support program or service. 
    This sample code is provided AS IS without warranty of any kind. Microsoft disclaims all implied warranties including, without limitation, 
    any implied warranties of merchantability or of fitness for a particular purpose. The entire risk arising out of the use or performance 
    of the sample code and documentation remains with you. In no event shall Microsoft, its authors, or anyone else involved in the creation, 
    production, or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages for loss of business 
    profits, business interruption, loss of business information, or other pecuniary loss) arising out of the use of or inability to use the 
    sample scripts or documentation, even if Microsoft has been advised of the possibility of such damages.
#>
# Load common code
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$here\commons.ps1"


function Get-PCLicensesDeployment
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)

    Write-Warning "  Get-PCLicensesDeployment is deprecated and will not be available in future releases, use Get-PCLicenseDeployment instead."


    $url = "https://api.partnercenter.microsoft.com/v1/analytics/licenses/deployment"
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "PartnerLicensesDeploymentInsights")      
}

<#
.SYNOPSIS
Retrieves a list of licenses assigned.

.DESCRIPTION
The Get-Inventory function uses Windows Management Instrumentation (WMI) toretrieve service pack version, operating system build number, and BIOS serial number from one or more remote computers. 
Computer names or IP addresses are expected as pipeline input, or may bepassed to the –computerName parameter. 
Each computer is contacted sequentially, not in parallel.

.PARAMETER saToken 
The authentication token you have created with your Partner Center credentials.

.EXAMPLE
Return a list of assigned licenses for the partner.

Get-PCLicenses

.NOTES
You need to have a authentication credential already established before running this cmdlet.

#>
function Get-PCLicenseDeployment
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)

    $url = "https://api.partnercenter.microsoft.com/v1/analytics/licenses/deployment"
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "PartnerLicensesDeploymentInsights")      
}

function Get-PCLicensesUsage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)

    Write-Warning "  Get-PCLicensesUsage is deprecated and will not be available in future releases, use Get-PCLicenseUsage instead."
 
    $url = "https://api.partnercenter.microsoft.com/v1/analytics/licenses/usage"
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "PartnerLicensesUsageInsights")      
}

<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER saToken 

.EXAMPLE

.NOTES
#>
function Get-PCLicenseUsage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)

    $url = "https://api.partnercenter.microsoft.com/v1/analytics/licenses/usage"
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "PartnerLicensesUsageInsights")      
}

function Get-PCCustomerLicensesDeployment
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][String]$tenantId = $GlobalCustomerID,
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)
    _testTenantContext ($tenantId)

    Write-Warning "  Get-PCCustomerLicensesDeployment is deprecated and will not be available in future releases, use Get-PCCustomerLicenseDeployment instead."

    $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/analytics/licenses/deployment" -f $tenantId
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "CustomerLicensesDeploymentInsights")      
}

<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER saToken 

.PARAMETER tenantId 

.EXAMPLE

.NOTES
#>
function Get-PCCustomerLicenseDeployment
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][String]$tenantId = $GlobalCustomerID,
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)
    _testTenantContext ($tenantId)

    $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/analytics/licenses/deployment" -f $tenantId
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "CustomerLicensesDeploymentInsights")      
}

function Get-PCCustomerLicensesUsage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][String]$tenantId = $GlobalCustomerID,
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)
    _testTenantContext ($tenantId)

    Write-Warning "  Get-PCCustomerLicensesUsage is deprecated and will not be available in future releases, use Get-PCCustomerLicenseUsage instead."
 
    $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/analytics/licenses/usage" -f $tenantId
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "CustomerLicensesUsageInsights")      
}

<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER saToken 

.PARAMETER tenantId 

.EXAMPLE

.NOTES
#>
function Get-PCCustomerLicenseUsage
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][String]$tenantId = $GlobalCustomerID,
        [Parameter(Mandatory = $false)][string]$saToken = $GlobalToken
    )
    _testTokenContext($saToken)
    _testTenantContext ($tenantId)

    $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/analytics/licenses/usage" -f $tenantId
    $headers = @{Authorization="Bearer $saToken"}

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
    $obj = @() + $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "CustomerLicensesUsageInsights")      
}