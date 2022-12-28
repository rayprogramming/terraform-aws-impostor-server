resource "aws_iam_instance_profile" "instance_profile" {
  name = "amongus-profile"
  role = aws_iam_role.amongus.name
}

resource "aws_iam_role" "amongus" {
  name = "instance"
  path = "/amongus/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "amongus_ssm" {
  role = aws_iam_role.amongus.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}