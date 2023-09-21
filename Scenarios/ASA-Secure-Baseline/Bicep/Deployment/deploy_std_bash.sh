#/bin/bash -x
tier = "Standard"
location = "eastus"
namePrefix = "qaEnv"

principalId=`az ad sp show --id e8de9221-a19c-4c81-b814-fd37c6caf9d2 --query id --output tsv`
echo "SpId: principalId"
az deployment sub create --name "test-Standard" --location $location --template-file "../main.bicep" --parameters "../main.parameters.json" location=$location namePrefix=$namePrefix principalId=$principalId tier=$tier
