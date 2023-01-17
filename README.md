<h1>Overview</h1>

This project includes two pipelines that use the GitOps approach.<br />
The first pipeline automates the building of an AWS AKS cluster using Terraform.<br />
The second pipeline automates the deployment on the AKS cluster using Helm of a simple web app that returns a counter on how many times the page has been seen. The application uses Redis to store the count.