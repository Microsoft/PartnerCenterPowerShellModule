# Get-PCSpendingBudget

Returns the spending budget set for the specified tenant.

## SYNTAX

```powershell
Get-PCSpendingBudget [[-TenantId] <String>] [[-SaToken] <String>] [<CommonParameters>]
```

## DESCRIPTION

The Get-PCSpendingBudget cmdlet returns the spending budget set for the specified tenant.

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

### -SaToken &lt;String&gt;

Specifies an authentication token with your Partner Center credentials.

```
Required?                    false
Position?                    2
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
PS C:\>Get-PCSpendingBudget -TenantId 97037612-799c-4fa6-8c40-68be72c6b83c
```
