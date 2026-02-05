# =========================================
# Project: Azure Infrastructure Modernization
# Step 8: Windows Server 2022 VM
# =========================================

$ResourceGroup = "rg-core-infra"
$Location      = "eastus"

$VmName        = "vm-win2022-core"
$VmSize        = "Standard_D2s_v3"
$VnetName      = "vnet-core"
$SubnetName    = "snet-servers"

$NicName       = "$VmName-nic"
$AdminUser     = "azureadmin"

# -------------------------------------------------
# Generate Azure-compliant password (PowerShell 7 safe)
# -------------------------------------------------
Write-Host "Generating secure local admin credentials..."

function New-SecurePassword {
    param ([int]$Length = 16)

    $Upper   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $Lower   = 'abcdefghijklmnopqrstuvwxyz'
    $Digits  = '0123456789'
    $Special = '!@#$%^&*()-_=+[]{}<>?'

    # Ensure complexity requirements
    $PasswordChars = @(
        $Upper   | Get-Random -Count 2
        $Lower   | Get-Random -Count 2
        $Digits  | Get-Random -Count 2
        $Special | Get-Random -Count 2
    )

    $AllChars = ($Upper + $Lower + $Digits + $Special).ToCharArray()

    while ($PasswordChars.Count -lt $Length) {
        $PasswordChars += $AllChars | Get-Random
    }

    -join ($PasswordChars | Get-Random -Count $PasswordChars.Count)
}

$PlainPassword  = New-SecurePassword -Length 16
$SecurePassword = ConvertTo-SecureString $PlainPassword -AsPlainText -Force

$Cred = New-Object System.Management.Automation.PSCredential `
    ($AdminUser, $SecurePassword)

# -------------------------------------------------
# Retrieve network resources
# -------------------------------------------------
Write-Host "Retrieving virtual network and subnet..."

$Vnet = Get-AzVirtualNetwork `
    -Name $VnetName `
    -ResourceGroupName $ResourceGroup

$Subnet = Get-AzVirtualNetworkSubnetConfig `
    -Name $SubnetName `
    -VirtualNetwork $Vnet

# -------------------------------------------------
# Create or reuse network interface
# -------------------------------------------------
Write-Host "Checking for existing network interface..."

$Nic = Get-AzNetworkInterface `
    -Name $NicName `
    -ResourceGroupName $ResourceGroup `
    -ErrorAction SilentlyContinue

if (-not $Nic) {
    Write-Host "Creating network interface (no public IP)..."

    $Nic = New-AzNetworkInterface `
        -Name $NicName `
        -ResourceGroupName $ResourceGroup `
        -Location $Location `
        -SubnetId $Subnet.Id
}
else {
    Write-Host "Network interface already exists. Reusing it."
}

# -------------------------------------------------
# Build VM configuration (Trusted Launch, Gen2)
# -------------------------------------------------
Write-Host "Building virtual machine configuration..."

$VmConfig = New-AzVMConfig `
    -VMName $VmName `
    -VMSize $VmSize `
    -SecurityType TrustedLaunch |
    Set-AzVMOperatingSystem `
        -Windows `
        -ComputerName $VmName `
        -Credential $Cred `
        -ProvisionVMAgent `
        -EnableAutoUpdate |
    Set-AzVMSourceImage `
        -PublisherName "MicrosoftWindowsServer" `
        -Offer "WindowsServer" `
        -Skus "2022-datacenter-g2" `
        -Version "latest" |
    Add-AzVMNetworkInterface -Id $Nic.Id

# -------------------------------------------------
# Deploy VM
# -------------------------------------------------
Write-Host "Deploying virtual machine. This may take several minutes..."

New-AzVM `
    -ResourceGroupName $ResourceGroup `
    -Location $Location `
    -VM $VmConfig

Write-Host "VM deployment completed successfully."