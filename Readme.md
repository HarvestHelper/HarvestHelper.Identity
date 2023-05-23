# HarvestHelper.Identity

Identity service used in HarvestHelper


## Build the docker image
```powershell
$version="1.0.12"
$env:GH_OWNER="HarvestHelper"
$env:GH_PAT="[PAT]"
$appname="harvesthelper"
docker build --secret id=GH_OWNER --secret id=GH_PAT -t "$appname.azurecr.io/harvesthelper.identity:$version" .
```

## Run the docker image

### local
```powershell
$version="1.0.12"
$adminPass="[Password]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__Host=mongo -e RabbitMQSettings__Host=rabbitmq -e IdentitySettings__AdminUserPassword=$adminPass --network=harvesthelperinfra_default harvesthelper.identity:$version
```

### cloud
```powershell
$version="1.0.12"
$adminPass="[Password]"
$cosmosDbConnString="[Connection string]"
$serviceBusConnString="[Connection string]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__ConnectionString=$cosmosDbConnString -e ServiceBusSettings__ConnectionString=$serviceBusConnString -e ServiceSettings__MessageBroker="SERVICEBUS" -e IdentitySettings__AdminUserPassword=$adminPass harvesthelper.identity:$version
```

## Publishing the docker image
```powershell
$version="1.0.12"
$appname="harvesthelper"
az acr login --name $appname
docker push "$appname.azurecr.io/harvesthelper.identity:$version"
```

## Create the kubernetes namespace
```powershell
$namespace="identity"
kubectl create namespace $namespace
```

## Create the kubernetes pods
```powershell
$namespace="identity"

kubectl apply -f .\kubernetes\identity.yaml -n $namespace
```

## Creating the Azure Managed Identity and granting it access to Key Vault secrets
```powershell
$namespace="identity"
$appname="harvesthelper"

az identity create --resource-group $appname --name $namespace

$IDENTITY_CLIENT_ID=az identity show -g $appname -n $namespace --query clientId -otsv

az keyvault set-policy -n $appname --secret-permissions get list --spn $IDENTITY_CLIENT_ID
```

## Establish the federated identity credential
```powershell
$namespace="identity"
$appname="harvesthelper"
$AKS_OIDC_ISSUER=az aks show -n $appname -g $appname --query "oidcIssuerProfile.issuerUrl" -otsv

az identity federated-credential create --name $namespace --identity-name $namespace --resource-group $appname --issuer $AKS_OIDC_ISSUER --subject "system:serviceaccount:${namespace}:${namespace}-serviceaccount"
```

### Create the singing certficiate
```powershell
$namespace="identity"

kubectl apply -f .\kubernetes\signing-cert.yaml -n $namespace
```

### install the helm chart
```powershell
$namespace="identity"
$appname="harvesthelper"
$helmUser=[guid]::Empty.Guid
$helmPassword=az acr login --name $appname --expose-token --output tsv --query accessToken 

helm registry login "$appname.azurecr.io" --username $helmUser --password $helmPassword

$chartVersion="0.1.0"
helm upgrade identity-service oci://$appname.azurecr.io/helm/microservice --version $chartVersion -f .\helm\values.yaml -n $namespace --install
```

### Run SonarQube
```powershell
$sonartoken="[SONAR_TOKEN]"
dotnet sonarscanner begin /k:"HarvestHelper.Identity" /d:sonar.host.url="http://localhost:9000"  /d:sonar.token=$sonartoken
dotnet build
dotnet sonarscanner end /d:sonar.token=$sonartoken
```