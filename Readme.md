# HarvestHelper.Identity

Identity service used in HarvestHelper


## Build the docker image
```powershell
$version="1.0.7"
$env:GH_OWNER="HarvestHelper"
$env:GH_PAT="[PAT]"
$appname="harvesthelper"
docker build --secret id=GH_OWNER --secret id=GH_PAT -t "$appname.azurecr.io/harvesthelper.identity:$version" .
```

## Run the docker image

### local
```powershell
$version="1.0.7"
$adminPass="[Password]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__Host=mongo -e RabbitMQSettings__Host=rabbitmq -e IdentitySettings__AdminUserPassword=$adminPass --network=harvesthelperinfra_default harvesthelper.identity:$version
```

### cloud
```powershell
$version="1.0.7"
$adminPass="[Password]"
$cosmosDbConnString="[Connection string]"
$serviceBusConnString="[Connection string]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__ConnectionString=$cosmosDbConnString -e ServiceBusSettings__ConnectionString=$serviceBusConnString -e ServiceSettings__MessageBroker="SERVICEBUS" -e IdentitySettings__AdminUserPassword=$adminPass harvesthelper.identity:$version
```

## Publishing the docker image
```powershell
$version="1.0.7"
$appname="harvesthelper"
az acr login --name $appname
docker push "$appname.azurecr.io/harvesthelper.identity:$version"
```

## Create the kubernetes namespace
```powershell
$namespace="identity"
kubectl create namespace $namespace
```

## Create the kubernetes secrets
```powershell

$adminPass="[Password]"
$cosmosDbConnString="[Connection string]"
$serviceBusConnString="[Connection string]"

kubectl create secret generic identity-secrets --from-literal=cosmosdb-connectionstring=$cosmosDbConnString --from-literal=servicebus-connectionstring=$serviceBusConnString --from-literal=admin-password=$adminPass -n $namespace
```

## Create the kubernetes pods
```powershell
$namespace="identity"

kubectl apply -f .\kubernetes\identity.yaml -n $namespace
```

## Create the azure managed identity and granting access to keyvault secrets
```powershell
$appname="harvesthelper"
$namespace="identity"

az identity create --resource-group $appname --name $namespace

$IDETITY_CLIENT_ID=az identity show -g $appname -n $namespace --query clientId -otsv
az keyvault set-policy -n $appname --secret-premissions get list --spn $IDETITY_CLIENT_ID
```

## Establish the federated identity credential 
```powershell
$appname="harvesthelper"

$AKS_OIDC_ISSUER=az aks show -n $appname -g $appname --query "oidcIssuerProfile.issuerUrl" -otsv

az identity federated-credential create --name $namespace --identity-name $namespace --resource-group $appname --issuer $AKS_OIDC_ISSUER --subject "system:serviceaccount:${namespace}:${namespace}-serviceaccount"
```