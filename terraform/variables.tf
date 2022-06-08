# variables.tf

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "nosaugowe/epltablesummary:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 1030
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "s3_bucket" {
  description = "s3 bucket name for storing file state"
  default     = "epltablestatus_tfstate_bucket"
}

variable "s3_bucket_codebuild" {
  description = "s3 bucket name for storing codebuild files"
  default     = "codebuildbucket"
}

variable "codebuild_project_terraform_plan_name" {
  description = "s3 bucket name for storing codebuild files"
  default     = "PresentationDemo"
}
