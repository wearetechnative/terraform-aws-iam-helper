resource "aws_iam_policy" "customer_managed" {
  for_each = var.customer_managed_policies

  name = join("-", [var.principal_name, each.key])
  # enabling below gives errors like: Error: error reading IAM User Managed Policy Attachment (****fred****:arn:aws:iam::617813585939:policy/fred/fred-read_five): couldn't find resource
  #path   = "/${join("-", [var.user_name, each.key])}/"
  policy = jsonencode(each.value)
}

data "aws_iam_policy" "aws_managed" {
  for_each = { for k in var.aws_managed_policies : k => k }

  name = each.key
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  for_each = { for k, v in merge(aws_iam_policy.customer_managed, data.aws_iam_policy.aws_managed) : k => v if var.principal_type == "user" }

  user       = var.principal_name
  policy_arn = each.value.arn
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each = { for k, v in merge(aws_iam_policy.customer_managed, data.aws_iam_policy.aws_managed) : k => v if var.principal_type == "role" }

  role       = var.principal_name
  policy_arn = each.value.arn
}
