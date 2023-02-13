### Challenge #2
We need to write code that will query the meta data of an instance within Azure or AWS or GCP and provide a JSON formatted output. The choice of language and implementation is up to you.

### Solution:
The Azure Instance Metadata Service (IMDS) provides information about currently running virtual machine instances. You can use it to manage and configure your virtual machines. This information includes the SKU, storage, network configurations, and upcoming maintenance events.

I have created a powershell script to query the Instance Metadata (Windows/Linux VM)
1. Create a Azure VM using Azure Portal or with any IaC tool
2. Login to the VM using credentials provided during VM creation
3. if _WindowsVM_: copy the script provided above and run it on PowerShell
4. if _LinuxVM_: install powershell: 
                 "sudo snap install powershell --classic" && "sudo snap install jq"
                 "pwsh"
5. Output is stored in a text file in Json format inside the VM which we can be used later.

_Note: we can also use az cli or python script to query instance metadata_


### Some common Metadata Query:
1. curl -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2021-01-01&format=json"
2. curl -H Metadata:true "http://169.254.169.254/metadata/instance/compute?api-version=2021-01-01" | jq
3. curl -H Metadata:true "http://169.254.169.254/metadata/instance/compute/subscriptionId?api-version=2021-01-01&format=text"

4. curl -H Metadata:true "http://169.254.169.254/metadata/instance/network/interface/0?api-version=2017-03-01" | jq
5. curl -H Metadata:true "http://169.254.169.254/metadata/instance/network/interface/0/ipv4/subnet/0/address?api-version=2017-03-01&format=text"
