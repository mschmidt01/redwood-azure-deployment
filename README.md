# README


In order to deploy the application, you need to execute the following commands after you have created the resource group and the web app:

```
az webapp config set --resource-group <resource-group> --name <name> --linux-fx-version "NODE|18-lts"
az webapp config set --resource-group <resource-group> --name <name>  --startup-file "./startup.sh"
```
