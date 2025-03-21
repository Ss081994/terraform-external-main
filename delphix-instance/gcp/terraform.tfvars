project_id  = "presalesdemo"
region      = "us-central1"
zone        = "us-central1-a"


instance_name = "terraform-test"
image_id      = "dlpx-engine-v-13"
instance_size = "n2-standard-2"

service_account_email = "terraform-test@presalesdemo.iam.gserviceaccount.com"
creator = "Sumeet"
owner   = "proserv"

tags = {
  "Environment" = "Development"
  "Project"     = "Terraform-Test"
}
