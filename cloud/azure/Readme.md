

Azure command line authentication creation

    create service principle

    az ad sp create-for-rbac --name demoazureroute

    Changing "demonio" to a valid URI of "http://demonio", which is the required format used for service principal names
    Creating a role assignment under the scope of "/subscriptions/xxxxx-xxx-xxxxxxx"
    {
      "appId": "a807906d-3cbc-xxxxx-ae2f-xxxxxxxxxx",
      "displayName": "demoazureroute",
      "name": "http://demoazureroute",
      "password": "C9~xxxxxxxx.4NH~6Aekfu_9-uzm4",
      "tenant": "xxxxx833fc-xxxx-49c9-9c53-xxxxxx"
    }


    Command Line login approaches (select 1 preferable ):

    1. az login --service-principal -u a807906d-3cbc-xxxxx-ae2f-xxxxxxxxxx -p C9~UhyOOnK5p8gJL.4NH~6Aekfu_9-uzm4 --tenant xxxxx833fc-xxxx-49c9-9c53-xxxxxx    
    2. az login --service-principal -u http://demoazureroute -p C9~xxxxxxxx.4NH~6Aekfu_9-uzm4 --tenant xxxxxxxxgmail.onmicrosoft.com
    3. az login --service-principal -u http://demoazureroute -p C9~xxxxxxxx.4NH~6Aekfu_9-uzm4 --tenant xxxxx833fc-xxxx-49c9-9c53-xxxxxx


   Docker image build 

    docker build -t azure-auth .


   Docker image and run

    docker run -dti --name demoazureroute azure-auth

   Docker exection and verify

    docker exec -ti demoazureroute bash
    
    az group create --name TestResourceGroup --location westus
