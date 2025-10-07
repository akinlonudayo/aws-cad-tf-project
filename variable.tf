variable "region" {
  type        = string
  description = "Region Where VPC will be created"
  default     = "ca-central-1"
}

variable "customCIDR" {
  type        = string
  description = "Enter the CIDR for CustomVPC"
  default     = "10.40.0.0/16"
}

variable "subnet1_cidr" {
  type        = string
  description = "Enter the CIDR for Subnet1"
  default     = "10.40.1.0/24"
}

variable "subnet2_cidr" {
  type        = string
  description = "Enter the CIDR for Subnet2"
  default     = "10.40.2.0/24"
}

variable "subnet3_cidr" {
  type        = string
  description = "Enter the CIDR for Subnet3"
  default     = "10.40.3.0/24"
}

variable "subnet4_cidr" {
  type        = string
  description = "Enter the CIDR for subnet4"
  default     = "10.40.4.0/24"
}

variable "AZ1" {
  type        = string
  description = "Enter Your Availability Zone"
  default     = "ca-central-1a"
}

variable "AZ2" {
  type        = string
  description = "Enter Your Availability Zone"
  default     = "ca-central-1b"
}

variable "AMI_ID" {
  type        = string
  description = "Enter Your Instance AMI ID"
  default     = "ami-029c5475368ac7adc"
}

variable "InstanceType" {
  type        = string
  description = "Enter Your Instance Type"
  default     = "t3.micro"
}

variable "applicationLB" {
  type        = string
  description = "Enter Your ALB Name"

}

variable "applicationTG" {
  type        = string
  description = "Enter Your ALB Target Group Name"

}

variable "db_name" {
  type        = string
  description = "Enter Your Database Name"
}

variable "allocated_storage" {
  type        = number
  description = "Enter Your Allocated Storage size in GB"
  default     = 10
}

variable "engine_version" {
  type        = string
  description = "Enter Your Database Engine Version"
  default     = "8.0.42"
}

variable "engine_type" {
  type        = string
  description = "Enter Your Database Engine Type"
  default     = "mysql"
}

variable "RDS_Instanceclass" {
  type        = string
  description = "Enter Your RDS Instance Class"
  default     = "db.t4g.micro"
}

variable "DBUsername" {
  type        = string
  description = "Enter Your Database Username"
  default     = "admin"
}

variable "DBPassword" {
  type        = string
  description = "Enter Your Database Password"
  default     = "Root#12345"
}

variable "ParameterGroupName" {
  type        = string
  description = "Enter Your RDS Parameter Group Name"
  default     = "default.mysql8.0"
}
