# Partner Center PowerShell Module #

## Introduction ##

Partner Center Powershell Module is the PowerShell implementation of the Partner Center API available scenarios. You can manage your customers, offers, subscriptions, usage, etc. The objective is to keep this module close to the Partner Center SDK functionality.

## How to install ##

This module is published via [PowerShell Gallery](https://www.powershellgallery.com/) and can be installed using Install-Module.

```powershell
Install-Module -Name PartnerCenterModule
```

## Import Classes ##

To Import Classes so that you can use fuctions like New-PCOrder.

```powershell
using module PartnerCenterModule
```

## Getting Started ##

### Step 1 ###

   Make sure that [Partner Center App Management is configured](https://msdn.microsoft.com/library/partnercenter/mt709136.aspx) to enable access to the Partner Center API.

### Step 2 ###

Just like with AzureRM powershell module, the first step to start using it is to provide authentication. In Partner Center PowerShell Module you use [Add-PCAuthentication](./CmdletHelp/Add-PCAuthentication.md) cmdlet to set your CSP account authentication context.

** Some cmdlets require App+User authentication to function correctly.**

#### Set App+User authentication ####

```powershell
$cred = Get-Credential '<username@domain>'
Add-PCAuthentication -CspAppId '<native app id GUID>' -CspDomain '<csp partner domain>' -Credential $cred
```

or

#### Set app authentication ####

```powershell
$clientSecret = '<key code secret>'
$clientSecretSecure = $clientSecret | ConvertTo-SecureString -AsPlainText -Force

Add-PCAuthentication -CspAppId '<web app id GUID>' -CspDomain '<csp partner domain>' -CspClientSecret $clientSecretSecure
```

You can obtain the Web App ID and the Client Secret from either Partner Center UI or Azure Active Directory

### Ready ###

After completing these steps you are ready to start using the cmdlets for the scenarios listed below. (ex: create customers, create subscriptions, etc)

## Partner Center API scenario -> PowerShell module matrix ##

| Partner Center API Scenario | | Cmdlet |
|:-|:-|:-|
| | | |
| **Analytics** |Retrieve analytics | |
| | [Get partner licenses deployment information](https://msdn.microsoft.com/en-us/library/partnercenter/mt797761.aspx) | [Get-PCLicenseDeployment](./CmdletHelp/Get-PCLicenseDeployment.md) |
| | [Get partner licenses usage information](https://msdn.microsoft.com/en-us/library/partnercenter/mt797762.aspx) | [Get-PCLicenseUsage](./CmdletHelp/Get-PCLicenseUsage.md) |
| | [Get customer licenses deployment information](https://msdn.microsoft.com/en-us/library/partnercenter/mt797759.aspx) | [Get-PCCustomerLicenseDeployment](./CmdletHelp/Get-PCCustomerLicenseDeployment.md) |
| | [Get customer licenses usage information](https://msdn.microsoft.com/en-us/library/partnercenter/mt797760.aspx) | [Get-PCCustomerLicenseUsage](./CmdletHelp/Get-PCCustomerLicenseUsage.md) |
| | | |
| **Device Deployment** | Configuration policies | |
| Add, delete, update and retrieve device configuration policies | | |
| | [Create a new configuration policy for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842820.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Delete a configuration policy for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842821.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get a list of a customer's policies](https://msdn.microsoft.com/en-us/library/partnercenter/mt842825.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Retrieve a customer's configuration policy](https://msdn.microsoft.com/en-us/library/partnercenter/mt842829.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Update a configuration policy for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842830.aspx) | [NA](./CmdletHelp/NA.md) |
| Work with and upload device batches and device metadata | | |
| | [Get the status of a device batch upload](https://msdn.microsoft.com/en-us/library/partnercenter/mt842828.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get a list of device batches for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842827.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get a list of devices for the specified batch and customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842826.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Upload a list of devices to create a new batch for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842833.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Upload a list of devices to an existing batch for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842832.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Delete a device for the specified customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt842822.aspx) | [NA](./CmdletHelp/NA.md) |
| | | |
| **Manage customer accounts** | | |
| Create a customer | | |
| | [Create a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt634668.aspx) | [New-PCCustomer](./CmdletHelp/New-PCCustomer.md) |
| | [Create a customer for an indirect reseller](https://msdn.microsoft.com/en-us/library/partnercenter/mt784594.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Retrieve a relationship request URL](https://msdn.microsoft.com/en-us/library/partnercenter/mt712736.aspx) | [New-PCRelationshipRequest](./CmdletHelp/New-PCRelationshipRequest.md) |
| Look up a customer | | |
| | [Get a customer by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634680.aspx) | [Get-PCCustomer](./CmdletHelp/Get-PCCustomer.md) |
| | [Get a customer by company name or domain](https://msdn.microsoft.com/en-us/library/partnercenter/mt634681.aspx) | [Get-PCCustomer](./CmdletHelp/Get-PCCustomer.md) |
| | [Get a list of customers](https://msdn.microsoft.com/en-us/library/partnercenter/mt634685.aspx) | [Get-PCCustomer](./CmdletHelp/Get-PCCustomer.md) |
| Manage customer orders and subscriptions | | |
| | [Get all of a customer's orders](https://msdn.microsoft.com/en-us/library/partnercenter/mt634671.aspx) | [Get-PCOrder](./CmdletHelp/Get-PCOrder.md) |
| | [Get all of a customer's subscriptions](https://msdn.microsoft.com/en-us/library/partnercenter/mt634673.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Update the nickname for a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt634726.aspx) | [Set-PCSubscription](./CmdletHelp/Set-PCSubscription.md) |
| Manage customer account details | | |
| | [Get a customer's billing profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634670.aspx) | [Get-PCCustomerBillingProfile](./CmdletHelp/Get-PCCustomerBillingProfile.md) |
| | [Update a customer's billing profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634718.aspx) | [Set-PCCustomerBillingProfile](./CmdletHelp/Set-PCCustomerBillingProfile.md) |
| | [Get a customer's company profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634682.aspx) | [Get-PCCustomerCompanyProfile](./CmdletHelp/Get-PCCustomerCompanyProfile.md) |
| Manage user accounts and assign licenses | | |
| | [Get a user account by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt745139.aspx) | [Get-PCCustomerUser](./CmdletHelp/Get-PCCustomerUser.md) |
| | [Create user accounts for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725328.aspx) | [New-PCCustomerUser](./CmdletHelp/New-PCCustomerUser.md) |
| | [Delete a user account for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725329.aspx) | [Remove-PCCustomerUser](./CmdletHelp/Remove-PCCustomerUser.md) |
| | [Update user accounts for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725337.aspx) | [Set-PCCustomerUser](./CmdletHelp/Set-PCCustomerUser.md) |
| | [View deleted users for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt744323.aspx) | [Get-PCCustomerUser](./CmdletHelp/Get-PCCustomerUser.md) |
| | [Restore a deleted user for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt744322.aspx) | [Restore-PCCustomerUser](./CmdletHelp/Restore-PCCustomerUser.md) |
| | [Get a list of all user accounts for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725330.aspx) | [Get-PCCustomerUser](./CmdletHelp/Get-PCCustomerUser.md) |
| | [Reset user password for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725335.aspx) | [Set-PCCustomerUser](./CmdletHelp/Set-PCCustomerUser.md) |
| | [Get user roles for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725334.aspx) | [Get-PCCustomerUserRole](./CmdletHelp/Get-PCCustomerUserRole.md) |
| | | [Get-PCCustomerRole](./CmdletHelp/Get-PCCustomerRole.md) |
| | | [Get-PCCustomerRoleMember](./CmdletHelp/Get-PCCustomerRoleMember.md) |
| | [Set user roles for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt725336.aspx) | [Add-PCCustomerRoleMember](./CmdletHelp/Add-PCCustomerRoleMember.md) |
| | [Remove a customer user from a role](https://msdn.microsoft.com/en-us/library/partnercenter/mt745131.aspx) | [Remove-PCCustomerRoleMember](./CmdletHelp/Remove-PCCustomerRoleMember.md) |
| | [Get a list of available licenses](https://msdn.microsoft.com/en-us/library/partnercenter/mt725331.aspx) | [Get-PCSubscribedSKU](./CmdletHelp/Get-PCSubscribedSKU.md) |
| | [Assign licenses to a user](https://msdn.microsoft.com/en-us/library/partnercenter/mt725326.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Check which licenses are assigned to a user](https://msdn.microsoft.com/en-us/library/partnercenter/mt725327.aspx) | [Get-PCCustomerUser](./CmdletHelp/Get-PCCustomerUser.md) |
| | [Get licenses assigned to a user by license group](https://msdn.microsoft.com/en-us/library/partnercenter/mt784685.aspx) |  [NA](./CmdletHelp/NA.md) |
| | [Get a list of available licenses by license group](https://msdn.microsoft.com/en-us/library/partnercenter/mt784684.aspx) |  [NA](./CmdletHelp/NA.md) |
| | | |
| **Place orders** | | |
| Get offers from the catalog | | |
| | [Get a list of offer categories by Country and locale](https://msdn.microsoft.com/en-us/library/partnercenter/mt634689.aspx) | [Get-PCOfferCategoriesByMarket](./CmdletHelp/Get-PCOfferCategoriesByMarket.md) |
| | [Get a list of offers for a market](https://msdn.microsoft.com/en-us/library/partnercenter/mt683488.aspx) | [Get-PCOffer](./CmdletHelp/Get-PCOffer.md) |
| | [Get an offer by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634678.aspx) | [Get-PCOffer](./CmdletHelp/Get-PCOffer.md) |
| | [Get add-ons for an offer ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634669.aspx) | [Get-PCOffer](./CmdletHelp/Get-PCOffer.md) |
| | [Get a list of products](https://docs.microsoft.com/en-us/partner-center/develop/get-a-list-of-products) | [NA](.CmdletHelp/NA.md) |
| | [Create an order](https://msdn.microsoft.com/en-us/library/partnercenter/mt634667.aspx) | [New-PCOrder](./CmdletHelp/New-PCOrder.md) |
| | [Create an order for a customer of an indirect reseller](https://msdn.microsoft.com/en-us/library/partnercenter/mt808071.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get an order by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634679.aspx) | [Get-PCOffer](./CmdletHelp/Get-PCOffer.md) |
| | [Purchase an add-on to a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt778903.aspx) | [New-PCOrder](./CmdletHelp/New-PCOrder.md) |
| Trial conversions | | |
| | [Get a list of trial conversion offers](https://msdn.microsoft.com/en-us/library/partnercenter/mt803172.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Convert a trial subscription to paid](https://msdn.microsoft.com/en-us/library/partnercenter/mt803171.aspx) | [NA](./CmdletHelp/NA.md) |
| Get subscription details | | |
| | [Get a subscription by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634692.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Get a list of subscriptions by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt683489.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Get a list of subscriptions by order](https://msdn.microsoft.com/en-us/library/partnercenter/mt634690.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Get a list of add-ons for a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt634684.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Get subscription provisioning status](https://msdn.microsoft.com/en-us/library/partnercenter/mt800801.aspx) | [NA](./CmdletHelp/NA.md) |
| Change, suspend, or reactivate a subscription | | |
| | [Change the quantity of a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt614218.aspx) | [Set-PCSubscription](./CmdletHelp/Set-PCSubscription.md) |
| | [Suspend a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt634716.aspx) | [Set-PCSubscription](./CmdletHelp/Set-PCSubscription.md) |
| | [Reactivate a suspended subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt634714.aspx) | [Set-PCSubscription](./CmdletHelp/Set-PCSubscription.md) |
| | [Transition a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt644395.aspx) |[NA](./CmdletHelp/NA.md) |
| Manage carts | | |
| | [Create a cart](https://docs.microsoft.com/en-us/partner-center/develop/create-a-cart) | [NA](./CmdletHelp/NA.md) |
| | [Update a cart](https://docs.microsoft.com/en-us/partner-center/develop/update-a-cart) | [NA](./CmdletHelp/NA.md) |
| | [Checkout a cart](https://docs.microsoft.com/en-us/partner-center/develop/checkout-a-cart) | [NA](./CmdletHelp/NA.md) |
| | | |
| **Manage billing** | | |
| Get Azure rates and utilization records | | |
| | [Get prices for Microsoft Azure](https://msdn.microsoft.com/en-us/library/partnercenter/mt774619.aspx) | [Get-PCAzureRateCard](./CmdletHelp/Get-PCAzureRateCard.md) |
| | [Get a customer's utilization records for Azure](https://msdn.microsoft.com/en-us/library/partnercenter/mt791774.aspx) | [Get-PCUsage](./CmdletHelp/Get-PCUsage.md)   [Get-PCUsage2](./CmdletHelp/Get-PCUsage2.md) |
| Get invoices | | |
| | [Get the reseller's current account balance](https://msdn.microsoft.com/en-us/library/partnercenter/mt712732.aspx) | [Get-PCInvoice](./CmdletHelp/Get-PCInvoice.md) |
| | [Get invoice by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt712734.aspx) | [Get-PCInvoice](./CmdletHelp/Get-PCInvoice.md) |
| | [Get invoice line items](https://msdn.microsoft.com/en-us/library/partnercenter/mt634696.aspx) | [Get-PCInvoiceLineItem](./CmdletHelp/Get-PCInvoiceLineItem.md) |
| | [Get a collection of invoices](https://msdn.microsoft.com/en-us/library/partnercenter/mt712730.aspx) | [Get-PCInvoice](./CmdletHelp/Get-PCInvoice.md) |
| Check your Azure spending budget | | |
| | [Get usage data for a subscription](https://msdn.microsoft.com/en-us/library/partnercenter/mt651646.aspx) | [Get-PCAzureResourceMonthlyUsageRecord](./CmdletHelp/Get-PCAzureResourceMonthlyUsageRecord.md) |
| | [Get usage summary for all of a customer's subscriptions](https://msdn.microsoft.com/en-us/library/partnercenter/mt651643.aspx) | [Get-PCCustomerUsageSummary](./CmdletHelp/Get-PCCustomerUsageSummary.md) |
| Get service costs | | |
| | [Get a customer's service costs summary](https://msdn.microsoft.com/en-us/library/partnercenter/mt492473.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get a customer's service costs line items](https://msdn.microsoft.com/en-us/library/partnercenter/mt492472.aspx) | [NA](./CmdletHelp/NA.md) |
| | | |
| **Provide support** | | |
| Admin services for a customer | | |
| | [Get the managed services for a customer by ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt614220.aspx) | [Get-PCManagedService](./CmdletHelp/Get-PCManagedService.md) |
| Manage support contacts | | |
| | [Get a subscription's support contact](https://msdn.microsoft.com/en-us/library/partnercenter/mt803173.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Update a subscription's support contact](https://msdn.microsoft.com/en-us/library/partnercenter/mt803174.aspx) | [NA](./CmdletHelp/NA.md) |
| Manage service requests | | |
| | [Create a service request](https://msdn.microsoft.com/en-us/library/partnercenter/mt805812.aspx) | [New-PCSR](./CmdletHelp/New-PCSR.md) |
| | [Get service request support topics](https://msdn.microsoft.com/en-us/library/partnercenter/mt634701.aspx) | [Get-PCSRTopic](./CmdletHelp/Get-PCSRTopic.md) |
| | [Get all service requests for a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt634674.aspx) | [Get-PCSR](./CmdletHelp/Get-PCSR.md) |
| | [Update a service request](https://msdn.microsoft.com/en-us/library/partnercenter/mt634719.aspx) | [Set-PCSR](./CmdletHelp/Set-PCSR.md) |
| | | |
| **Manage partner accounts and profiles** | | |
| Work with profiles in Dashboard > Account settings | | |
| | [Get legal business profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634697.aspx) | [Get-PCLegalBusinessProfile](./CmdletHelp/Get-PCLegalBusinessProfile.md) |
| | [Get an organization profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt712729.aspx) | [NA](./CmdletHelp/NA.md) |
| | [Get partner billing profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt712731.aspx) | [Get-PCBillingProfile](./CmdletHelp/Get-PCBillingProfile.md) |
| | [Get Microsoft Partner Network profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634699.aspx) | [Get-PCMpnProfile](./CmdletHelp/Get-PCMpnProfile.md) |
| | [Get support profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634703.aspx) | [Get-PCSupportProfile](./CmdletHelp/Get-PCSupportProfile.md) |
| | [Update legal business profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634722.aspx) | [Set-PCLegalBusinessProfile](./CmdletHelp/Set-PCLegalBusinessProfile.md) |
| | [Update a partner's billing profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt712738.aspx) | [Set-PCBillingProfile](./CmdletHelp/Set-PCBillingProfile.md) |
| | [Update support profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt634725.aspx) | [Set-PCSupportProfile](./CmdletHelp/Set-PCSupportProfile.md) |
| | [Update an organization profile](https://msdn.microsoft.com/en-us/library/partnercenter/mt712737.aspx) | [Set-PCOrganizationProfile](./CmdletHelp/Set-PCOrganizationProfile.md) |
| | [Get partner by MPN ID](https://msdn.microsoft.com/en-us/library/partnercenter/mt634698.aspx) | [Get-PCMpnProfile](./CmdletHelp/Get-PCMpnProfile.md) |
| | [Get all subscriptions by partner](https://msdn.microsoft.com/en-us/library/partnercenter/mt634676.aspx) | [Get-PCSubscription](./CmdletHelp/Get-PCSubscription.md) |
| | [Get indirect resellers of a customer](https://msdn.microsoft.com/en-us/library/partnercenter/mt783002.aspx) | [Get-PCCustomerRelationship](./CmdletHelp/Get-PCCustomerRelationship.md) |
| | [Get customers of an indirect reseller](https://msdn.microsoft.com/en-us/library/partnercenter/mt808157.aspx) | [Get-PCResellerCustomer](./CmdletHelp/Get-PCResellerCustomer.md) |
| | [Retrieve a list of indirect resellers](https://msdn.microsoft.com/en-us/library/partnercenter/mt783004.aspx) | [Get-PCIndirectReseller](./CmdletHelp/Get-PCIndirectReseller.md) |
| | | |
| **Utilities** | | |
| | [Validate address format](https://msdn.microsoft.com/en-us/library/partnercenter/mt797658.aspx) | [Test-PCAddress](./CmdletHelp/Test-PCAddress.md) |
| | [Get address formatting rules by market](https://msdn.microsoft.com/en-us/library/partnercenter/mt683490.aspx) | [Get-PCAddressRulesByMarket](./CmdletHelp/Get-PCAddressRulesByMarket.md) |
| | [Verify domain availability](https://msdn.microsoft.com/en-us/library/partnercenter/mt644396.aspx) | [Get-PCDomainAvailability](./CmdletHelp/Get-PCDomainAvailability.md) |
| | [Delete a customer account from the integration sandbox](https://msdn.microsoft.com/en-us/library/partnercenter/mt712728.aspx) | [Remove-PCCustomer](./CmdletHelp/Remove-PCCustomer.md) |
| | [Get a record of Partner Center activity by user](https://msdn.microsoft.com/en-us/library/partnercenter/mt725332.aspx) | [Get-PCAuditRecords](./CmdletHelp/Get-PCAuditRecords.md) |
| | | |
| **Authentication** | | |
| | [Add Partner Center Authentication Token](https://msdn.microsoft.com/en-us/library/partnercenter/mt634709.aspx) | [Add-PCAuthentication](./CmdletHelp/Add-PCAuthentication.md) |
| | | [New-PCSAToken](./CmdletHelp/New-PCSAToken.md) |

## Telemetry collection ##

Telemetry has been removed starting in the 0.9.0.21 release.