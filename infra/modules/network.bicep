@description('Virtual Network Name')
@minLength(3)
param vnetName string 
param vnetAddressSpace string
param snetAppSvcAddressPrefix string
param snetPrivateLinkAddressPrefix string


resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: vnetName
  location: resourceGroup().location
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
