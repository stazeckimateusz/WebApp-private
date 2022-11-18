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

resource test 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' = {
  name:  'test'
  parent: vnet
  properties: {
    addressPrefix: '10.1.3.0/24'
  }
}//testtest
