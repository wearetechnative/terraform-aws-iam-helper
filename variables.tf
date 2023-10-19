variable "principal_name" {
  description = "Principal name to partition policies and to attach policies to. Required value."
  type        = string
}

variable "principal_type" {
  description = "Either user or role. Required to properly attach custom and managed policies."
  type        = string
}

variable "customer_managed_policies" {
  description = "Optional map of customer managed policy names. Key is policyname and value is policy object in HCL."
  type        = any # activate below when optional is ready for GA
  # type = map(object({
  #   Version = string
  #   Sid = optional(string)
  #   Statement = list(object({
  #     Sid = optional(string)
  #     Effect = string
  #     Action = list(string)
  #     Resource = list(string)
  #     Condition = optional(any)
  #   }))
  # }))
  default = {}
}

variable "aws_managed_policies" {
  description = "Optional list of AWS managed policies. We assume that these policies already exist."
  type        = list(string)
  default     = []
}

variable "assume_role_configuration" {
  description = "Policies for assume role. Optional."
  type = map(object({
    account_id = string
    role_path  = string
  }))
  default = {}
}
