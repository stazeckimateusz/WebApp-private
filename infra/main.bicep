@description('Virtual Network Name')
@minLength(3)
param vnetName string 
@description('Network address')
param vnetAddressSpace string
@description('Subnet for App Service Regional Vnet Integration')
param snetAppSvcAddressPrefix string
@description('Subnet for App Private Endpoint')
param snetPrivateLinkAddressPrefix string


module network 'modules/network.bicep' = {
  name: 'network'
  params: {
    vnetName: vnetName
    vnetAddressSpace: vnetAddressSpace
    snetAppSvcAddressPrefix: snetAppSvcAddressPrefix
    snetPrivateLinkAddressPrefix: snetPrivateLinkAddressPrefix
  }
}
