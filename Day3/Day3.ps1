﻿
#Powershell Script to 
#1)connect to Vm, 
#2)Get the Storage accounts and its location
#3) Create a new resource group, 
#4)Create a Storage Group
#5)upload and down load blobs and 
#6)delete the Resorece group

Function StorageOperations
{
#* Connect to AzureRMAccount
   Connect-AzureRmAccount 

#*Get Storage Account names and Location
    $resourceGroup = "myexistingresourcegroup"
    $storageAccountName = "myexistingstorageaccount"
    Get-AzureRMStorageAccount | Select StorageAccountName, Location
    $storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup `
      -Name $storageAccountName 

# Get list of locations and select one.
    Get-AzureRmLocation | select Location 
    $location = "eastus"

# Create a new resource group.
    $resourceGroup = "ResourceGroupTest"
    New-AzureRmResourceGroup -Name $resourceGroup -Location $location 

# Set the name of the storage account and the SKU name. 
    $storageAccountName = "storageaccountaparna"
    $skuName = "Standard_LRS"

# Create the storage account.
    $storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroup `
      -Name $storageAccountName `
      -Location $location `
      -SkuName $skuName

# Retrieve the context. 
    $ctx = $storageAccount.Context

#Uploading Blob files into Storage Account
    $containerName = "blobs"
    New-AzureStorageContainer -Name $containerName -Context $ctx -Permission blob
    Set-AzureStorageBlobContent -File "E:\Bugs\Avendracalc.png" `
      -Container $containerName `
      -Blob "Avendracalc.png" `
      -Context $ctx 

# download  blob files
    Get-AzureStorageBlobContent -Blob "Avendracalc.png" `
      -Container $containerName `
      -Destination "E:\Bugs\Blobs" `
      -Context $ctx 

#Delete Resource Group
    Remove-AzureRmResourceGroup -Name $resourceGroup
 
}


  try
  {
  StorageOperations;
  }
  Catch
  {
  Write-Host $_.Exception.ToString()
  }