[Repository](https://gitlab.com/idooh/api-kubernetes.git)
[Cluster health](https://gitlab.com/idooh/api-kubernetes/clusters/74283?group=Cluster%20Health&title=Memory%20usage&y_label=Memory%20(GiB))

[![build status](https://gitlab.com/idooh/api-kubernetes/badges/master/build.svg)](https://gitlab.com/idooh/api-kubernetes/commits/master)
[![coverage report](https://gitlab.com/idooh/api-kubernetes/badges/master/coverage.svg)](https://gitlab.com/idooh/api-kubernetes/commits/master)

## SEE: 
[Tutorial Interativo](https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-interactive/)
* https://blog.kloia.com/deploy-auto-scalable-node-js-application-on-kubernetes-cluster-part-1-f40e622f2337
* https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-apiversion-definition-guide.html
* https://blog.kloia.com/deploy-auto-scalable-node-js-application-on-kubernetes-cluster-part-2-d41164d72dcb
* https://github.com/huseyinbabal/kubernetes-node-example
[exemplo templates 1](https://github.com/RisingStack/example-kubernetes-nodejs)
[exemplo templates 2](https://github.com/helm/charts/tree/master/stable/sealed-secrets/templates)
* https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
* https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/
* https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/
* https://docs.microsoft.com/pt-pt/azure/container-registry/
* https://docs.microsoft.com/pt-br/azure/container-instances/container-instances-multi-container-yaml

# Configurations

### Steps work in cluster
* Install [azure cli](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli?view=azure-cli-latest) on your machine

* Login to azure:
```
az login
```
* Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) on your machine

* Get the credentials for cluster running the following command 
`az aks get-credentials --resource-group [resource-group] --name [cluster]`
```
az aks get-credentials -g [resource-group] -n [cluster]
az aks get-credentials -g idooh-production-api -n api-production
```

* Para saber se voce conseguiu se conectar corretamente no cluster, execute este commando:
```
kubectl cluster-info
```
##

### Steps for install kubernetes dashboard in cluster (if don't installed)
* 1 - install [kubernetes-dashboard](https://docs.microsoft.com/en-us/azure/aks/kubernetes-dashboard) `if not exists`
```
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
```

* 2 - Open the Kubernetes dashboard by running the following command
`az aks browse --resource-group [resource-group] --name [cluster]`
```
az aks browse -g idooh-production-api -n api-cluster

az aks browse -g idooh-production-api -n api-production
```
##

# Commands azure
https://thorsten-hans.com/how-to-use-private-azure-container-registry-with-kubernetes
[commands azure aks ´az aks´](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest)
[commands azure container](https://docs.microsoft.com/pt-br/cli/azure/container?view=azure-cli-latest#az-container-exec)
```
## Azure AKS
# https://docs.microsoft.com/pt-br/cli/azure/aks?view=azure-cli-latest#az-aks-show
#
az aks show --name MyManagedCluster --resource-group MyResourceGroup
az aks show --resource-group myResourceGroup --name myAKSCluster --query nodeResourceGroup -o tsv

## Azure ACR
#
az acr show-usage -n apiproduction
az acr repository list -n apiproduction
az acr list -g idooh-production-api --query "[].{acrLoginServer:loginServer}" --output table
az acr repository show-manifests -n apiproduction

az vm identity assign -g idooh-production-api -n api-production
az container exec -g [resource-name] --name [container-name] --container-name [container-name] --exec-command "/bin/sh"
az container exec -g idooh-production-api --name api-k-teste --container-name api-k-teste --exec-command "/bin/sh"
```

### kubectl commands
[exec commands](https://kubectl.docs.kubernetes.io/pages/container_debugging/executing_a_command_in_a_container.html)
https://gist.github.com/DanielBerman/0724195d977f97d68fc2c7bc4a4e0419

```
kubectl explain configmap
kubectl explain replicaset --api-version apps/v1
kubectl api-versions
kubectl apply -f bb.yaml
kubectl delete -f bb.yaml
kubectl get
kubectl logs
kubectl delete
kubectl delete namespaces [namespace-name]
kubectl get namespaces api-kubernetes-14758996-development --output=yaml
kubectl -n api-kubernetes-14758996-production get secret idooh.api-secret-prod --output=yaml
kubectl get service --namespace=api-kubernetes-14758996-development
kubectl config set-context --current -n idooh-development  //To set current namespace context
kubectl config view --minify | grep namespace: // to get current namespace context

```

* Use context
```
kubectl config use-context [context-name]
```

* Obtenha o URL da API executando este comando
```
kubectl cluster-info
```

* Listar Serviços
```
kubectl get services
kubectl --namespace api-kubernetes-14758996-production get services
```

* Listar Pods
```
kubectl get pods
kubectl --namespace [namespace] get pods
kubectl --namespace api-kubernetes-14758996-production get pods
```
* desmontar o seu pod de teste:
```
kubectl delete -f pod.yaml
kubectl delete [pod-name]
```

* executar comands dentro do pod
```
kubectl exec -t -i [pod-name] /bin/sh
kubectl exec -t -i --namespace [namespace] [pod-name] /bin/sh

kubectl exec -it -i --namespace idooh-development api-idooh-development-7586f87f8c-58svm /bin/sh

kubectl exec -it -i --namespace api-3316211-production api-idooh-production-5b899b5f9c-sjgvs /bin/sh

kubectl top pod api-idooh-9bbc97cff-cq559 --namespace=api-kubernetes-14758996-production
```

* Listar Certificados CA
```
kubectl get secrets
```

# idooh Api
Api is our back-end system, that is responsible to manger user and platform authentication.

[Repository](https://gitlab.com/idooh/api) 

[![build status](https://gitlab.com/idooh/api/badges/master/build.svg)](https://gitlab.com/idooh/api/commits/master)
[![coverage report](https://gitlab.com/idooh/api/badges/master/coverage.svg)](https://gitlab.com/idooh/api/commits/master)

## Dependencies
* NodeJS v12.12.0

### Confioguration
[AWS development credentials](ttps://docs.aws.amazon.com/pt_br/sdk-for-java/v1/developer-guide/setup-credentials.html)

## Execution


# IBMCloud Integration
https://gitlab.com/help/user/project/clusters/add_remove_clusters.md#add-existing-cluster
https://medium.com/01001101/gitlab-ci-pipeline-with-ibm-cloud-kubernetes-service-iks-1fa288a1eb4f


### ICR Registry
Create docker-acr-config
```
kubectl create secret docker-registry docker-acr-config \
    --docker-server=us.icr.io --docker-username=<user> \
    --docker-password=<passs> \
    --docker-email=mail@idooh.media -n=<name-space>
```

# Configure Gitlab Integration

### Create this service account
```
kubectl apply -f k8s/gitlab-admin-service-account.yaml
```

### Get Infos
```
CLUSTER=$(kubectl config view --minify | grep name | cut -f 2- -d ":" | tr -d " " | head -n 1)
APISERVER=$(kubectl config view --minify | grep server | cut -f 2- -d ":" | tr -d " ")
CAPATH=$(echo "${KUBECONFIG%/*}");CAFILE=$(kubectl config view --minify | grep certificate-authority | cut -f 2- -d ":" | tr -d " ")
TOKEN=$(kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep gitlab | awk '{print $1}'))
kubectl get secret/monitor-apm-token -o go-template='{{index .data "secret-token" | base64decode}}'

echo "Cluster name: "
echo $CLUSTER
echo ""
echo "API URL: " 
echo $APISERVER
echo ""
echo "Token: "
echo $TOKEN
echo ""
echo "CA: "
cat $CAPATH/$CAFILE
echo ""
echo "Namespace:"
echo "gitlab-managed-apps"
```

# Certificate
[Install Certmanager](https://gitlab.com/idooh/infra/-/blob/master/kubernetes/cert-manager.md)


### Connect to IBM Mongo
Create a sslCA Certificate
Get it from [Credential Services](https://cloud.ibm.com/services/databases-for-mongodb/crn%3Av1%3Abluemix%3Apublic%3Adatabases-for-mongodb%3Aus-south%3Aa%2F5b34e6e746984886a15b08508b3c7576%3A8fec3bf9-5672-4c81-938c-b6da37ecdaa7%3A%3A?paneId=credentials)
```
kubectl create secret generic ibm-mongo-tls-ca \
  --from-file=./d96f976a-c636-4736-a595-d699a6efd0e4
  
kubectl -n api-3316211-staging create secret generic ibm-mongo-tls-ca \
  --from-file=./d96f976a-c636-4736-a595-d699a6efd0e4
```

