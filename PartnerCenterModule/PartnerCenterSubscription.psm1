﻿Set-StrictMode -Version latest
<#
    © 2018 Microsoft Corporation. All rights reserved. This sample code is not supported under any Microsoft standard support program or service. 
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

<#
.SYNOPSIS
TODO
.DESCRIPTION
The Get-PCSubscription cmdlet returns a list of subscriptions for a specified customer tenant based on the specified partner.
.PARAMETER SaToken 
The authentication token you have created with your Partner Center Credentials.
.PARAMETER TenantId 
Specifies the tenant used for scoping this cmdlet. The tenant must be specified either using this parameter or by using the Select-PCCustomer cmdlet.

.PARAMETER SubscriptionId
Specifies a subscription id for which to return detailed information.
.PARAMETER AddOns 

.PARAMETER PartnerId 
Specifies the partner id for which to list the subscriptions.

.PARAMETER Limit
Specifies a limit to the number of records to return. The default limit is 200.
.PARAMETER OrderId
Specifies an order id to for which to return a list of subscriptions.
.EXAMPLE
Get-PCSubscription -PartnerId 14ed2a11-a3ed-4e63-baa0-30997e241f37
.NOTES
#>
function Get-PCSubscription {
    [CmdletBinding(DefaultParameterSetName = 'SubscriptionId')]
    Param(
        [Parameter(Mandatory = $false)][String]$TenantId = $GlobalCustomerId,
        [Parameter(Mandatory = $false)][string]$SaToken = $GlobalToken,
        [Parameter(ParameterSetName = 'SubscriptionId', Mandatory = $false)][String]$SubscriptionId,
        [Parameter(ParameterSetName = 'SubscriptionId', Mandatory = $false)][switch]$AddOns,           
        [Parameter(ParameterSetName = 'PartnerId', Mandatory = $true)][String]$PartnerId,
        [Parameter(ParameterSetName = 'PartnerId', Mandatory = $false)][int]$Limit = 200,
        [Parameter(ParameterSetName = 'OrderId', Mandatory = $false)][string]$OrderId    
    )
    _testTokenContext($SaToken)
    _testTenantContext ($TenantId)

    <#
    function Private:Get-SubscriptionsAllInner ($SaToken, $TenantId)
    {
        $obj = @()
        $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions" -f $TenantId

        $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
        $headers.Add("Authorization", "Bearer $SaToken")
        $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

        $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
        $obj += $response.Substring(1) | ConvertFrom-Json
        return (_formatResult -obj $obj -type "Subscription") 
    }
    #>

    function Private:Get-SubscriptionInner ($SaToken, $TenantId, $SubscriptionId, $AddOns) {
        $obj = @()
        if ($SubscriptionId) {
            if ($addons) {
                $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions/{1}/addons" -f $TenantId, $SubscriptionId

                $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
                $headers.Add("Authorization", "Bearer $SaToken")
                $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

                $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
                $obj += $response.Substring(1) | ConvertFrom-Json
                return (_formatResult -obj $obj -type "SubscriptionAddons")   
            }
            else {
                $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions/{1}" -f $TenantId, $SubscriptionId
             
                $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
                $headers.Add("Authorization", "Bearer $SaToken")
                $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

                $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
                $obj += $response.Substring(1) | ConvertFrom-Json
                return (_formatResult -obj $obj -type "Subscription") 
            }
        }
        else {
            $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions" -f $TenantId
    
            $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
            $headers.Add("Authorization", "Bearer $SaToken")
            $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

            $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
            $obj += $response.Substring(1) | ConvertFrom-Json
            return (_formatResult -obj $obj -type "Subscription") 
        }
    }

    function Private:Get-SubscriptionPartnerInner ($SaToken, $TenantId, $partnerId, $Limit) {
        $obj = @()
        $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions?mpn_id={1}&offset=0&size={2}" -f $TenantId, $partnerId, $Limit

        $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
        $headers.Add("Authorization", "Bearer $SaToken")
        $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

        $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
        $obj += $response.Substring(1) | ConvertFrom-Json
        return (_formatResult -obj $obj -type "Subscription") 
    }

    function Private:Get-SubscriptionByOrderInner ($SaToken, $TenantId, $OrderId) {
        $obj = @()
        if ($OrderId) {
            $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions?order_id={1}" -f $TenantId, $OrderId

            $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
            $headers.Add("Authorization", "Bearer $SaToken")
            $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

            $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
            $obj += $response.Substring(1) | ConvertFrom-Json
            return (_formatResult -obj $obj -type "Subscription") 
        }
        else {
            $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions" -f $TenantId

            $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
            $headers.Add("Authorization", "Bearer $SaToken")
            $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

            $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Method "GET" #-Debug -Verbose
            $obj += $response.Substring(1) | ConvertFrom-Json
            return (_formatResult -obj $obj -type "Subscription") 
        }
    }

    # Determine which type of search to run based on the parameter sets.
    If ($PsCmdlet.ParameterSetName -eq "SubscriptionId") {
        $res = Get-SubscriptionInner -SaToken $SaToken -TenantId $TenantId -SubscriptionId $SubscriptionId -addons $addons
        return $res
    }
    elseif ($PsCmdlet.ParameterSetName -eq "PartnerId") {
        $res = Get-SubscriptionPartnerInner -SaToken $SaToken -TenantId $TenantId -partnerId $partnerId -Limit $Limit
        return $res
    }
    elseif ($PsCmdlet.ParameterSetName -eq "OrderId") {
        $res = Get-SubscriptionByOrderInner -SaToken $SaToken -TenantId $TenantId -OrderId $OrderId
        return $res
    }
    else {
        # If no parameter sets were valid, then return all subsccriptions
        $res = Get-SubscriptionsInner -SaToken $SaToken -TenantId $TenantId
        return $res
    }

}

<#
.SYNOPSIS
TODO
.DESCRIPTION
The Set-PCSubscription cmdlet.
.PARAMETER SaToken 
The authentication token you have created with your Partner Center Credentials.
.PARAMETER TenantId 
Specifies the tenant used for scoping this cmdlet.
.PARAMETER Subscription 
Specifies the subscription object that identifies the subscription you will modified. This object can be retrieved using the Get-PCSubscription cmdlet.

.PARAMETER Status 
Specifies the status for the subscription. Valid values are: none, active, suspended, and deleted.
.PARAMETER FriendlyName 
Specifies a friendly name for the subscription. 
.PARAMETER AutoRenew
Specifies as to whether the subscription will autorenew. This is only valid on license-based subscriptions. Valid inpputs are: enabled, disabled. This parameter used to be -AutoRenewEnabled in earlier releases.
.PARAMETER Quantity 
Specifies the number of licences included in the subscription. This is valid only on license-based subscriptions. 
.EXAMPLE
Set-PCSubscription 
.NOTES
#>
function Set-PCSubscription {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)][String]$TenantId = $GlobalCustomerId,
        [Parameter(Mandatory = $true, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)][PSCustomObject]$Subscription,
        [Parameter(Mandatory = $false)][ValidateSet("none", "active", "suspended", "deleted")][String]$Status,
        [Parameter(Mandatory = $false)][String]$FriendlyName,
        [Parameter(Mandatory = $false)][ValidateSet("enabled", "disabled")][String]$AutoRenew,
        [Parameter(Mandatory = $false)][int]$Quantity,
        [Parameter(Mandatory = $false)][string]$SaToken = $GlobalToken
    )
    _testTokenContext($SaToken)
    _testTenantContext ($TenantId)  

    $obj = @()

    $actualSubscription = Get-PCSubscription -SaToken $SaToken -TenantId $TenantId -SubscriptionId $Subscription.Id

    if ($Status) {$actualSubscription.status = $status}
    if ($FriendlyName) {$actualSubscription.friendlyName = $FriendlyName}
    if ($AutoRenew -eq "enabled") {$actualSubscription.autoRenewEnabled = $true}
    if ($AutoRenew -eq "disabled") {$actualSubscription.autoRenewEnabled = $false}
    if (($Quantity) -and ($actualSubscription.billingType -eq "license")) {$actualSubscription.quantity = $Quantity}

    $url = "https://api.partnercenter.microsoft.com/v1/customers/{0}/subscriptions/{1}" -f $TenantId, $Subscription.Id

    $headers = New-Object 'System.Collections.Generic.Dictionary[[string],[string]]'
    $headers.Add("Authorization", "Bearer $SaToken")
    $headers.Add("MS-PartnerCenter-Application", $ApplicationName)

    $body = $actualSubscription | ConvertTo-Json -Depth 100
    $utf8body = [System.Text.Encoding]::UTF8.GetBytes($body)

    $response = Invoke-RestMethod -Uri $url -Headers $headers -ContentType "application/json" -Body $utf8body -Method "PATCH" -Debug -Verbose
    $obj += $response.Substring(1) | ConvertFrom-Json
    return (_formatResult -obj $obj -type "Subscription") 
}
