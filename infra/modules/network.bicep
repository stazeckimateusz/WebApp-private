@description('Virtual Network Name')
@minLength(3)
param vnetName string 
@description('Network address')
param vnetAddressSpace string
@description('Subnet for App Service Regional Vnet Integration')
param snetAppSvcAddressPrefix string
@description('Subnet for App Private Endpoint')
param snetPrivateLinkAddressPrefix string
@description('Location')
param location string = resourceGroup().location // MAŁA ZMIANA 

resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressSpace
      ]
    }
  }
}

resource snetappsvc 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = {
  name:  'appsvcsubnet'
  parent: vnet
  properties: {
    addressPrefix: snetAppSvcAddressPrefix
  }
}

resource snetprivatelink 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = {
  name:  'privatelinksubnet'
  parent: vnet
  properties: {
    addressPrefix: snetPrivateLinkAddressPrefix
  }
}
