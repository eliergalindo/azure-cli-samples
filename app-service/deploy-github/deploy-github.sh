#!/bin/bash

gitrepo=<Replace with your GitHub repo URL. e.g. https://github.com/Azure-Samples/app-service-web-dotnet-get-started.git>
webappname=mywebapp$RANDOM

# Create a resource group.
az group create --location westeurope --name $webappname

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $webappname --resource-group $webappname --sku FREE

# Create a web app.
az appservice web create --name $webappname --resource-group $webappname --plan $webappname

# Deploy code from a public GitHub repository. 
az appservice web source-control config --name $webappname --resource-group $webappname \
--repo-url $gitrepo --branch master

# Browse to the web app.
az appservice web browse --name $webappname --resource-group $webappname
