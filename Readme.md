# HarvestHelper.Identity

Identity service used in HarvestHelper


## Build the docker image
```powershell
$version="1.0.4"
$env:GH_OWNER="HarvestHelper"
$env:GH_PAT="[PAT]"
docker build --secret id=GH_OWNER --secret id=GH_PAT -t harvesthelper.identity:$version .
```

## Run the docker image

### local
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__Host=mongo -e RabbitMQSettings=rabbitmq -e IdentitySettings__AdminUserPassword=$adminPass --network=harvesthelperinfra_default harvesthelper.identity:$version
```powershell
$version="1.0.4"
$adminPass="[Password]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__Host=mongo -e IdentitySettings__AdminUserPassword=$adminPass --network=harvesthelperinfra_default harvesthelper.identity:$version
```

### cloud
```powershell
$version="1.0.4"
$adminPass="[Password]"
$cosmosDbConnString="[Connection string]"
docker run -it --rm -p 5002:5002 --name identity -e MongoDbSettings__ConnectionString=$cosmosDbConnString -e IdentitySettings__AdminUserPassword=$adminPass --network=harvesthelperinfra_default harvesthelper.identity:$version
```