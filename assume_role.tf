locals {
  assume_role_arns = [for k, v in var.assume_role_configuration : "arn:${data.aws_partition.current.partition}:iam::${v.account_id}:role${format("/%s", join("/", compact(split("/", v.role_path))))}"]
}

data "aws_iam_policy_document" "assume_role" {
  count = length(local.assume_role_arns) > 0 ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    effect = "Allow"

    resources = local.assume_role_arns
  }
}

data "aws_iam_policy_document" "assume_role_merged" {
  source_policy_documents = [for k, v in data.aws_iam_policy_document.assume_role : v.json]
}

resource "aws_iam_policy" "assume_role" {
  count = length(data.aws_iam_policy_document.assume_role) > 0 ? 1 : 0

  name = "${var.principal_name}-assumerole"
  # enabling below gives errors like: Error: error reading IAM User Managed Policy Attachment (****fred****:arn:aws:iam::617813585939:policy/fred/fred-read_five): couldn't find resource
  #path   = "/${var.user_name}/"
  description = "Assume role policy for user ${var.principal_name}."

  policy = data.aws_iam_policy_document.assume_role_merged.json
}

resource "aws_iam_user_policy_attachment" "assume_role" {
  count = length(aws_iam_policy.assume_role)

  user       = var.principal_name
  policy_arn = aws_iam_policy.assume_role[0].arn
}
