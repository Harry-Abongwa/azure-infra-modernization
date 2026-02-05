# =========================================
# Project: Azure Infrastructure Modernization
# Step 6: Create Resource Group
# =========================================

$Location = "eastus"
$ResourceGroupName = "rg-core-infra"

Write-Host "Creating resource group '$ResourceGroupName' in '$Location'..."

New-AzResourceGroup `
    -Name $ResourceGroupName `
    -Location $Location `
    -Tag @{
        Project     = "AzureInfraModernization"
        Environment = "Lab"
        Owner       = "Harry"
    }

Write-Host "Resource group created successfully."
