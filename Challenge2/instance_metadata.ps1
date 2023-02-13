
# Below powershell script will run in both Windows & Linux machine
# For Linux: Install powershell first: 
# Command: "sudo snap install powershell --classic" && sudo snap install jq
# pwsh


$metadata=@()

$metadataUrl = "http://169.254.169.254/metadata/instance?api-version=2021-01-01"
$metadata = Invoke-WebRequest -Uri $metadataUrl -Method GET -Headers @{"Metadata"="true"}
$metadata.Content | ConvertFrom-Json | ConvertTo-Json -Depth 6

# Write-Output $metadata.Content | jq
$metadata.Content | ConvertFrom-Json | ConvertTo-Json -Depth 6 |  Out-File "/home/web_user/$((Get-Date).ToString("yyyyMMdd_HHmmss"))_VmMetaData.txt"
