<h1>Overview</h1>

This project includes two pipelines that use the GitOps approach.<br />
The first pipeline automates the building of an AWS AKS cluster using Terraform.<br />
The second pipeline automates the deployment of the application on the AKS cluster using Helm.
This is a simple web app that returns counter on how many times page has been seen. The application is using redis to store the count.
