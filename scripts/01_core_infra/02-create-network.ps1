# =========================================
# Project: Azure Infrastructure Modernization
# Step 7: Core Networking
# =========================================

$ResourceGroup = "rg-core-infra"
$Location      = "eastus"

$VnetName      = "vnet-core"
$VnetCidr      = "10.10.0.0/16"

$SubnetName    = "snet-servers"
$SubnetCidr   = "10.10.1.0/24"

$NsgName       = "nsg-servers"

Write-Host "Creating Network Security Group..."
$nsg = New-AzNetworkSecurityGroup `
    -Name $NsgName `
    -ResourceGroupName $ResourceGroup `
    -Location $Location

Write-Host "Creating subnet configuration..."
$subnetConfig = New-AzVirtualNetworkSubnetConfig `
    -Name $SubnetName `
    -AddressPrefix $SubnetCidr `
    -NetworkSecurityGroup $nsg

Write-Host "Creating Virtual Network..."
New-AzVirtualNetwork `
    -Name $VnetName `
    -ResourceGroupName $ResourceGroup `
    -Location $Location `
    -AddressPrefix $VnetCidr `
    -Subnet $subnetConfig

Write-Host "Core networking created successfully."
