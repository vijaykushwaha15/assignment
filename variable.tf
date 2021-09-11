variable access_key {
    description ="Please provide your AWS access Keys"
    type = string
    default = "FHRJRTVDSBDFBBDF"
}
variable secret_key {
    description ="Please provide your AWS secret Keys"
    type = string
    default = "hbfhsdkjask/dsnsdhjsbd"
}

variable instance_type {
    description ="Please provide instance you want to create like t2.micro, t3.medium"
    default = "t2.micro"
    type = string
}
variable public_key {
     description ="Please provide instance public keys"
     type = string
 }
