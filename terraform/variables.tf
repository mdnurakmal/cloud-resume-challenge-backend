variable "region" {
  type    = string
  default = "asia-east1"
  description = "Select region to deploy cloud run"
}

variable "project" {
  type    = string
  default = ""
  description = "Enter project name:"
}

variable "imagesha" {
  type    = string
  default = ""
  description = "Enter latest docker image digest:"
}
