# Get-PCAzureResourceMonthlyUsageRecord

Returns monthly Azure usage for the specified tenant.

## SYNTAX

```powershell
Get-PCAzureResourceMonthlyUsageRecord [[-TenantId] <String>] [[-SubscriptionId] <String>] [[-SaToken] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Get-PCAzureResourceMonthlyUsageRecord cmdlet returns Azure usage for the specified tenant.

## PARAMETERS

### -TenantId &lt;String&gt;

Specifies the tenant used for scoping this cmdlet.

```
Required?                    false
Position?                    1
Default value                $GlobalCustomerId
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -SubscriptionId &lt;String&gt;

Specifies the subscription id for which to return usage.

```
Required?                    false
Position?                    2
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -SaToken &lt;String&gt;

Specifies an authentication token with your Partner Center credentials.

```
Required?                    false
Position?                    3
Default value                $GlobalToken
Accept pipeline input?       false
Accept wildcard characters?  false
```

## INPUTS



## OUTPUTS

## NOTES



## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\>Get-PCAzureResourceMonthlyUsageRecord
```


