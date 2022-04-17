resource "aws_iam_policy" "policy_s3_ro" {
  name = "policy-s3ro"

  policy = jsonencode({
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:ListAllMyBuckets" ],
      "Resource": "arn:aws:s3:::*"
    },
   {
      "Effect": "Deny",
      "Action": ["s3:ListBucket"],
      "NotResource":["arn:aws:s3:::kj-s3b", "arn:aws:s3:::kj-s3b/*"]
    },
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket","s3:GetObject"],
      "Resource": ["arn:aws:s3:::kj-s3b", "arn:aws:s3:::kj-s3b/*"],
      "Condition": {}
    }
  ]
})
}

resource "aws_iam_policy" "policy_s3cf_ro" {
  name = "policy-s3cfro"

  policy = jsonencode({
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "acm:ListCertificates", 
            "cloudfront:GetDistribution",
            "cloudfront:GetDistributionConfig",
            "cloudfront:ListDistributions",
            "cloudfront:ListCloudFrontOriginAccessIdentities",
            "elasticloadbalancing:DescribeLoadBalancers",
            "iam:ListServerCertificates",
            "sns:ListSubscriptionsByTopic",
            "sns:ListTopics",
            "waf:GetWebACL",
            "waf:ListWebACLs"
         ],
         "Resource":"*"
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:ListAllMyBuckets"
         ],
         "Resource":"arn:aws:s3:::*"
      }
   ]
})
}

resource "aws_iam_policy" "policy_lambda_ro" {
  name = "policy-lro"

  policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
        {
            "Sid": "ReadOnlyPermissions",
            "Effect": "Allow", 
            "Action": [
                "lambda:GetAccountSettings",
                "lambda:GetEventSourceMapping",
                "lambda:GetFunction",
                "lambda:GetFunctionConfiguration",           
                "lambda:GetFunctionCodeSigningConfig",
                "lambda:GetFunctionConcurrency",                
                "lambda:ListEventSourceMappings",
                "lambda:ListFunctions",      
                "lambda:ListTags",
                "iam:ListRoles"
            ],
            "Resource": "*"
        }
   ]
})
}