# Get-PCProduct

Retrieves the products available for the specified country Id and target view.

## SYNTAX

```powershell
Get-PCProduct -CountryId <String> [-ProductId <String>] [-ShowSKUs] [-SaToken <String>] [<CommonParameters>]



Get-PCProduct -CountryId <String> -TargetView <String> [-TargetSegment <String>] [-SaToken <String>] [<CommonParameters>]
```

## DESCRIPTION

The Get-PCProduct returns a list of products available.

## PARAMETERS

### -CountryId &lt;String&gt;

Required. Specifies a two-character ISO 2 country code.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -ProductId &lt;String&gt;

Optional. Specifies a product id for which to retrieve details.

```
Required?                    false
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -ShowSKUs &lt;SwitchParameter&gt;

Optional when product Id is specified. This returns a list of SKUs for the specified product id.

```
Required?                    false
Position?                    named
Default value                False
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -TargetView &lt;String&gt;

Required if product Id is not specified. Specifies a target catalog to view. Valid options are Azure, OnlineServices, and Software

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -TargetSegment &lt;String&gt;

Optional. Specifies a target segment to view. Valid options are commercial, education, government, and nonprofit

```
Required?                    false
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```
 
### -SaToken &lt;String&gt;

Specifies an authentication token with your Partner Center credentials.

```
Required?                    false
Position?                    named
Default value                $GlobalToken
Accept pipeline input?       false
Accept wildcard characters?  false
```

## INPUTS



## OUTPUTS

## NOTES

You must have an authentication credential already established before running this cmdlet. The partner must be authorized for the specified country id.

## EXAMPLES

### EXAMPLE 1

```powershell
PS C:\>Get-PCProduct -CountryId US -TargetView Azure

Returns the products available in the country Id for the Azure catalog.
```


