
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
   Login-AzureRmAccount 
   $SubscritionId ="a59a2ab0-69d4-49bb-ba55-b5c141c1c084"
   $TenantId= "a894a5b5-7ab1-4258-a351-34c48f609278"
   
# Set the Context
    Set-AzureRmContext -TenantId $TenantId -SubscriptionId $SubscritionId

#Create a resourcegroup
   New-AzureRmResourceGroup RG10 "East Us"
#Get Resource Group
    $resourceGroup = "RG10"
#Create a storagegroup
    New-AzureRmStorageAccount -ResourceGroup $resourceGroup -AccountName storageaccountrg10
#Get Storage Account
  $storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup
    $ctx = $storageAccount.Context   

#Create a new container and Uploading Blob files into Storage Account
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
