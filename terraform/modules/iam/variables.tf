variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "assume_role_policy" {
  description = "IAM trust policy"
  type        = string
}

variable "policy_arns" {
  description = "Policies attached to role"
  type        = list(string)

  default = []
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)

  default = {}
}
