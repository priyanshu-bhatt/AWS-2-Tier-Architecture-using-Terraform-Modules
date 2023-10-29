module "vpc" {
    source = "../modules/vpc"
    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    pub_sub_1a_cidr =  var.pub_sub_1a_cidr
    pub_sub_2b_cidr =   var.pub_sub_2b_cidr
    pri_sub_3a_cidr =   var.pri_sub_3a_cidr
    pri_sub_4b_cidr =   var.pri_sub_4b_cidr
    pri_sub_5a_cidr =   var.pri_sub_5a_cidr
    pri_sub_6b_cidr =   var.pri_sub_6b_cidr
    region=var.region
}

module "nat" {
  source = "../modules/NatGateway"
  pub_sub_1a_id = module.vpc.pub_sub_1a_id
  igw_id        = module.vpc.igw_id
  pub_sub_2b_id = module.vpc.pub_sub_2b_id
  vpc_id        = module.vpc.vpc_id
  pri_sub_3a_id = module.vpc.pri_sub_3a_id
  pri_sub_4b_id = module.vpc.pri_sub_4b_id
  pri_sub_5a_id = module.vpc.pri_sub_5a_id
  pri_sub_6b_id = module.vpc.pri_sub_6b_id
}

module "securitygrp" {
    source = "../modules/securitygrp"
    vpc_id = module.vpc.vpc_id
  
}

# module "key" {
#     source = "../modules/key"
# }

module "alb"{
    source = "../modules/alb"
    project_name = module.vpc.project_name
    alb_sg_id = module.securitygrp.alb_sg_id
    pub_sub_1a_id = module.vpc.pub_sub_1a_id
    pub_sub_2b_id = module.vpc.pub_sub_2b_id
    vpc_id = module.vpc.vpc_id

}

module "asg"{
    source = "../modules/asg"
    project_name = module.vpc.project_name
    client_sg_id = module.securitygrp.client_sg_id
    pri_sub_3a_id = module.vpc.pri_sub_3a_id
    pri_sub_4b_id = module.vpc.pri_sub_4b_id
    tg_arn = module.alb.tg_arn
}

module "rds" {
    source = "../modules/rds"
    db_sg_id       = module.securitygrp.db_sg_id
    pri_sub_5a_id = module.vpc.pri_sub_5a_id
    pri_sub_6b_id = module.vpc.pri_sub_6b_id
    db_username    = var.db_username
    db_password    = var.db_password
  
}