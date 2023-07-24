data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "rds_kms_policy" {

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
    }
    actions   = ["kms:*"]
    resources = [aws_kms_key.rds_cmk.arn]
  }

  statement {
    sid    = "Key Administrator"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.arn]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:DescribeKey"
    ]
    resources = [aws_kms_key.rds_cmk.arn]
  }

  statement {
    sid    = "Allow via service"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:DescribeKey",
    ]
    resources = [aws_kms_key.rds_cmk.arn]
    condition {
      test     = "StringEquals"
      variable = "kms:ViaService"
      values   = "rds.${var.aws_region}.amazonaws.com"
    }
  }
}