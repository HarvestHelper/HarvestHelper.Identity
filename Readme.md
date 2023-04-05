# HarvestHelper.Identity

Identity service used in HarvestHelper


## Build the docker image
```powershell
$version="1.0.1"
$env:GH_OWNER="HarvestHelper"
$env:GH_PAT="[PAT]"
docker build --secret id=GH_OWNER --secret id=GH_PAT -t harvesthelper.identity
```