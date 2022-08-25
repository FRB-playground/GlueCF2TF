resource "aws_iam_role" "AutomationAdministrationServiceRole" {
  name               = "AWS-SystemsManager-AutomationAdministrationRole"
  assume_role_policy = file("${path.cwd}/policies/iam_assume_policy.json")
  path               = "/"
}

resource "aws_iam_role_policy" "AssumeRole-AWSSystemsManagerAutomationExecutionRole" {
  policy = file("${path.cwd}/policies/iam_workload_policy.json")
  role   = aws_iam_role.AutomationAdministrationServiceRole.id
}