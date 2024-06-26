terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.28.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.52.0"
    }
  }
  required_version = "~> 1.3"
}
