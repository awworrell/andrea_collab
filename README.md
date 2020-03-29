# terraform_cg
terraform with Chris

terraform version: Terraform v0.11.14


This repo is to demonstrate the creation of an environment in AWS. It will only allow traffic in through a CDN and be protected with a WAF. 
All public resources will only be load balancers who only accept traffic from the CDN and push to web servers in private subnets.
these webservers will contain a single application that allows for a database query to pull data back from a database and loads the results on the page.

This database will be a single table of name, street number, street address, city, state, zip code, and phone number columns with a unique identifer. The end goal is to produce a secure infastructure in the cloud that is scaleable.

To DO:

1. create a vpc that contains the following:
    1. Two public subnets in two avialablity zones to meet the definiton of a relabile solution in the well architected framework - done
    2. Two private subnets in two avialablity zones to meet the definiton of a relabile solution in the well architected framework - done
    3. Load balancers that exist in the public subnet to direct traffic into the private subnets. They should only accept traffic from the WAF
    4. EC2 instances and the database should exist in the private subnets and only accept traffic from the Load balancers. They should also autoscale with new traffic.
2. Outside the VPC create:
    1. A WAF that will use basic rules for manual ip lists, sql injection, http flood, scanners and probes, etc found at https://aws.amazon.com/solutions/aws-waf-security-automations/
    2. Enable rate limiting on the WAF https://aws.amazon.com/about-aws/whats-new/2017/06/aws-announces-rate-based-rules-for-aws-waf/
    3. Create a Cloudfront CDN that should only accept traffic over 443 and disable all traffic not on 443
    4. Create a cert using ACM that will be used on the CDN and terminate at the Load Balancers
3. Monitoring Solutions
    1. Implement AWS Guard duty to enable threat detection and continous monitoring
    2. Implement VPC flow logs to track the flow of traffic through the VPC
    3. Implement Cloudwatch alarms on all instances to monitor network, cpu, and memory for any weirdness that may be a result of testing
    4. Implement AWS Shield standard for DDOS protection
4. To look at that might help
    1. AWS inspector
    2. Clean up one file and break it into something more maintainable
    3. Create a jenkins pipeline that will modify terraform on pull request