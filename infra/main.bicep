param vnetName string 
param vnetAddressSpace string
param snetAppSvcAddressPrefix string
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
