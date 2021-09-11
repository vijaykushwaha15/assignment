variable instance_type {
    description ="Please provide instance you want to create like t2.micro, t3.medium"
    default = "t2.micro"
    type = string
}
variable public_key {
     description ="Please provide instance public keys"
     type = string
 }

variable lambda_role_arn {
    type = string
}
