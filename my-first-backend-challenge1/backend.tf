terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "niko-remote-backend-2026"
        region = "ap-southeast-6"
        access_key = "your_access_key"
        secret_key = "your_secret_key"
    }
}