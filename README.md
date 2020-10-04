#### Sample GCP DLP provisioning with Terraform 


##### Prerequisites
* [Terraform 0.12](https://releases.hashicorp.com/terraform/)
* GCP Project
* [Cloud storage bucket](https://www.terraform.io/docs/backends/types/gcs.html) to store terraform state
* [gcloud CLI](https://cloud.google.com/sdk/gcloud) & [Auth keys](https://cloud.google.com/docs/authentication/getting-started)
* Enabled APIS ([can be done with Google module](https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/9.1.0/submodules/project_services)): 
** [IAM](https://console.developers.google.com/apis/library/iam.googleapis.com) 
** [DLP](https://console.developers.google.com/apis/library/dlp.googleapis.com)


#### Steps
- 0) Modify `vars.tf`
- 1) `terraform init`
- 2) `terraform plan`
- 3) `GOOGLE_APPLICATION_CREDENTIALS="/Users/0landre/gh/keys/project-abcabcabcabc.json" terraform apply --auto-approve`
- 4) Add [input data](sample_input_data) and run the job before the schedule to verify