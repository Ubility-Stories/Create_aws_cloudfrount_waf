variable "domain-name" {
    type = string
    default = "test.ubilityai.com"
  
}
variable "region" {
    type = string
    default = "us-east-1"
  
}
variable "origion-id" {
    type = string
    default = "lb-id"
  
}

variable "price-class" {
    type = string
    default = "PriceClass_All"
  
}


variable "waf-name" {
    type = string
    
  
}

variable "scope" {
    type = string
    default = "CLOUDFRONT"
  
}
variable "rule1" {
    type = string
    default = "rule1"
  
}
variable "rule2" {
    type = string
    default = "rule2"
  
}
variable "priority1" {
    type = number
    default = 0
  
}
variable "priority2" {
    type = number
    default = 1
  
}
variable "managed-group-rule1" {
    type = string
    default = "AWSManagedRulesAdminProtectionRuleSet"
}
variable "managed-group-rule2" {
    type = string
    default = "AWSManagedRulesCommonRuleSet"
}
variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}

variable "AWS_ACCESS_SECRET" {
  type      = string
  sensitive = true
}
