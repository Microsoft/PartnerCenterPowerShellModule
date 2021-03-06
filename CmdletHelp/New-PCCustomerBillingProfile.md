# New-PCCustomerBillingProfile

This cmdlet is used to create a PowerShell object that can be passed to other cmdlets, such as the the New-PCCustomer cmdlet when creating a new customer.

## SYNTAX

```powershell
New-PCCustomerBillingProfile -FirstName <String> -LastName <String> -Email <String> -Culture <String> -Language <String> -CompanyName <String> -Country <String> [-Region <String>] -City <String> -State <String> -AddressLine1 <String> -PostalCode <String> -PhoneNumber <String> [<CommonParameters>]

New-PCCustomerBillingProfile -FirstName <String> -LastName <String> -Email <String> -Culture <String> -Language <String> -CompanyName <String> -DefaultAddress <DefaultAddress> [<CommonParameters>]
```

## DESCRIPTION

The New-PCCustomerBillingProfile cmdlet creates a PowerShell object that includes properties for the customer billing profile.

## PARAMETERS

### -FirstName &lt;String&gt;

Specifies the first name of the customer company contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -LastName &lt;String&gt;

Specifies the last name of the customer company contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -Email &lt;String&gt;

Specifies the email address of the customer company contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -Culture &lt;String&gt;

Specifies the two letter ISO culture of the customer company contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -Language &lt;String&gt;

Specifies the two letter ISO culture of the customer company contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -CompanyName &lt;String&gt;

Specifies the name of the customer company.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -Country &lt;String&gt;

Specifies the country for the customer company.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -Region &lt;String&gt;

Specifies the three letter region for the customer company.

```
Required?                    false
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -City &lt;String&gt;

Specifies the city for the customer's company address.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -State &lt;String&gt;

Specifies the state for the customer's company address.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -AddressLine1 &lt;String&gt;

Specifies the first line of the street address for the customer company's address.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -PostalCode &lt;String&gt;

Specifies the postal code for the customer company's address.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -PhoneNumber &lt;String&gt;

Specifies the phone number for the customer company's contact.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

### -DefaultAddress &lt;DefaultAddress&gt;

Specifies a PowerShell object that contains the default address information for the company.

```
Required?                    true
Position?                    named
Default value
Accept pipeline input?       false
Accept wildcard characters?  false
```

## INPUTS

## OUTPUTS

## NOTES

## EXAMPLES

### EXAMPLE 1

Create an object that has the billing profile information for Joe Smith at Contoso.

```powershell
PS C:\>$cBP = New-PCCustomerBillingProfile -FirstName 'Joe' -LastName 'Smith' -Email 'joe@contoso.com' -Country 'US' -City 'Redmond' -State 'WA' -PostalCode 98502 - AddressLine1 '1 Microsoft Way'
```
