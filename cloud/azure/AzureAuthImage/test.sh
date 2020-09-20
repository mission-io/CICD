#!/usr/bin/env bash

# Authentication  Initialization Scripts

if [[ $ClientId != "" && $ClientSecret != "" && $tenantId != '' ]]; then
    az login --service-principal -u $ClientId -p $ClientSecret --tenant $tenantId
    sleep 100000

else
    echo "Azure login Authentication Failed"
fi