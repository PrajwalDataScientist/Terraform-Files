# Terraform AWS ALB + Auto Scaling Project Workflow

## Project Goal

Build a secure, scalable web application infrastructure on AWS using
Terraform.

**What users see:**\
A website URL that opens a web page saying:

> Hello from Auto Scaling Group

**What happens behind the scenes:**\
AWS creates networking, security, load balancing, and compute resources
so the application is reachable, secure, and scalable.

------------------------------------------------------------------------

# High-Level Workflow (Non-Technical View)

``` text
User opens website
      ↓
Load Balancer receives traffic
      ↓
Traffic is sent securely to application servers
      ↓
Application server responds
      ↓
User sees webpage
```

Why this design? - One server is risky (if it fails, app goes down) -
Multiple servers improve reliability - Load balancer spreads traffic -
Private servers improve security

------------------------------------------------------------------------

# Step-by-Step Build Workflow

## Step 1 --- Create a VPC (Private Network)

### What happens

A dedicated private network is created in AWS for your project.

### Why we need it

Think of it like creating a **new office building** for your
application.

Without it: - resources mix with other networks - security becomes hard

### Access

Internal AWS networking only.

------------------------------------------------------------------------

## Step 2 --- Create Public Subnets

### What happens

Public zones are created inside the VPC.

### Why

Resources that face the internet live here: - Load Balancer - NAT
Gateway

### Access

Internet accessible.

------------------------------------------------------------------------

## Step 3 --- Create Private Subnets

### What happens

Private zones are created.

### Why

Application servers live here safely.

### Access

No direct internet access.

Only: - Load Balancer can reach them - They can go out via NAT Gateway

------------------------------------------------------------------------

## Step 4 --- Internet Gateway

### What happens

Connects VPC to the internet.

### Why

Without this: - public services cannot be reached

### Access

Public path in/out.

------------------------------------------------------------------------

## Step 5 --- Route Tables

### What happens

Traffic rules are defined.

Example: - Public subnet → Internet Gateway - Private subnet → NAT
Gateway

### Why

Like road directions for packets.

------------------------------------------------------------------------

## Step 6 --- Elastic IP + NAT Gateway

### What happens

A fixed public IP is attached to NAT.

Private servers use NAT for outbound internet.

### Why

Private servers still need: - updates - package installs - API calls

### Access

Outbound only.

No inbound.

------------------------------------------------------------------------

## Step 7 --- Security Groups

## ALB Security Group

Allows: - 80 - 443

From: - everyone

Why: Users need website access.

## EC2 Security Group

Allows: - port 80

From: - ALB only

Why: Blocks direct hacking attempts.

------------------------------------------------------------------------

## Step 8 --- Application Load Balancer

### What happens

Receives all user traffic.

### Why

Spreads traffic across servers.

Benefits: - high availability - scaling - health checks

------------------------------------------------------------------------

## Step 9 --- Target Group

### What happens

Keeps list of healthy servers.

### Why

Only healthy servers receive traffic.

------------------------------------------------------------------------

## Step 10 --- Listener

### What happens

Listens on port 80.

Rule: Forward traffic to Target Group.

### Why

Connects users to application servers.

------------------------------------------------------------------------

## Step 11 --- Launch Template

### What happens

Defines: - AMI - instance type - security group - startup script

### Why

Blueprint for future servers.

------------------------------------------------------------------------

## Step 12 --- User Data Script

### What happens

On startup: - update packages - install nginx - start nginx - create
webpage

### Why

Automation.

No manual login needed.

------------------------------------------------------------------------

## Step 13 --- Auto Scaling Group

### What happens

Automatically creates servers.

Example: Minimum: 1\
Maximum: 2

### Why

If server dies: → replace automatically

If traffic increases: → add servers

If traffic drops: → remove extra servers

------------------------------------------------------------------------

# Final Architecture

``` text
Internet User
    ↓
Application Load Balancer
    ↓
Target Group
    ↓
Auto Scaling Group
    ↓
Private EC2 Servers
    ↓
Nginx Application
```

------------------------------------------------------------------------

# How to Access

1.  Open AWS Console
2.  Go to EC2 → Load Balancers
3.  Copy DNS name
4.  Open browser: http://ALB-DNS-NAME

Result: \> Hello from Auto Scaling Group

------------------------------------------------------------------------

# Business Value

-   Secure
-   Reliable
-   Scalable
-   Automated
-   Production-style architecture

------------------------------------------------------------------------

# Terraform Execution Flow

``` text
terraform init
terraform plan
terraform apply
terraform destroy
```

Meaning: - init → download provider - plan → preview changes - apply →
create infrastructure - destroy → remove infrastructure \`\`\`
