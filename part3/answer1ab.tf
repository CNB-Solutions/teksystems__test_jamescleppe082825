provider "azurerm" {
  features {}
}

# 1. Resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-iis-demo"
  location = "EastUS"
}

# 2. Virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-iis-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# 3. Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-iis"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# 4. Public IP
resource "azurerm_public_ip" "pip" {
  name                = "pip-iis"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

# 5. Network interface
resource "azurerm_network_interface" "nic" {
  name                = "nic-iis"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

# 6. Windows VM
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "iis-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2ms"
  admin_username      = "azureuser"
  admin_password      = "P@ssword12345!"

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}

# 7. IIS installation with Custom Script Extension
resource "azurerm_virtual_machine_extension" "iis" {
  name                 = "iis-install"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell Add-WindowsFeature Web-Server; powershell Set-Content -Path 'C:\\inetpub\\wwwroot\\index.html' -Value 'Hello from Terraform IIS Server!'"
    }
  SETTINGS
}
