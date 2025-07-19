
# PROG8830: Practical Lab 8 – Terraform Practical Assignment

## Objective

This assignment demonstrates the use of Terraform’s advanced features including loops (`count`, `for_each`), built-in functions (string, numeric, collection, datetime, networking), and dynamic infrastructure with modularization. The goal is to build a simplified version of a real-world web application scenario that includes:
- Multiple compute (EC2) instances
- Security groups
- Use of Terraform built-in functions
- Modularized infrastructure design

---

## How to Run Your Configurations

### Prerequisites:
- Terraform installed
- IAM user with EC2 permissions

### Steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/<your-username>/terraform-practicallab8.git
   cd terraform-practicallab8
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Apply the Configuration**:
   ```bash
   terraform apply
   ```
   - Type `yes` when prompted.
   - This creates:
     - 3 EC2 instances using a module
     - 3 security groups using `for_each`
     - Terraform outputs using built-in functions

4. **Destroy the Infrastructure**:
   ```bash
   terraform destroy
   ```

---

## The Purpose and Functionality of Each Task

###  Task 1: Using Terraform Loops

####  1.1 – Use of `count`:
- File: `ec2_instances.tf`
- Used `count = 3` to create three identical EC2 instances
- Tagged with dynamic names using `${count.index}`
-  Commented out later after refactoring in Task 3

 **Purpose**: Demonstrate how to use `count` to replicate identical infrastructure resources efficiently

---

####  1.2 – Use of `for_each`:
- File: `security-groups.tf`
- Uses a map:
  ```hcl
  {
    "web-sg" = 80,
    "ssh-sg" = 22,
    "app-sg" = 8080
  }
  ```
- Each entry creates a unique security group and rule using `for_each`

 **Purpose**: Learn to dynamically generate resources that need unique configurations (e.g., ports)

---

###  Task 2: Applying Built-in Functions in Terraform

- File: `functions.tf`
- Demonstrates use of one function from each required category:

| Category      | Function Used                            | Description                              |
|---------------|-------------------------------------------|------------------------------------------|
| String        | `upper("practical lab 8")`                  | Converts string to uppercase             |
| Numeric       | `max(3, 8, 2)`                          | Finds the highest value                  |
| Collection    | `length(["a", "b", "c"])`           | Counts items in a list                   |
| Date/Time     | `formatdate("YYYY-MM-DD", timestamp())`   | Formats current system date              |
| Networking    | `cidrsubnet("10.0.0.0/16", 8, 2)`         | Generates a subnet from a base CIDR      |

**Purpose**: Show how built-in functions make Terraform code dynamic, reusable, and intelligent.

---

### Task 3: Enhancing Terraform Configurations

- Files:
  - `main.tf` (uses the module)
  - `modules/ec2-instance/` (`main.tf`, `variables.tf`, `outputs.tf`)
- The EC2 logic from Task 1.1 is refactored into a reusable module
- Inputs passed: AMI ID, instance type, instance count

 **Purpose**: Learn how to modularize Terraform to reduce repetition, improve reusability, and follow best practices

---

##  Lessons Learned

###  Practical Differences Between `count` and `for_each`

| Feature       | `count`                                  | `for_each`                                      |
|---------------|-------------------------------------------|--------------------------------------------------|
| Use Case      | Identical resources                       | Unique resources with different configurations   |
| Input Type    | Integer (`count = 3`)                     | Map or list (`for_each = var.map`)               |
| Reference     | `count.index`                             | `each.key`, `each.value`                         |
| Used In Task  | EC2 instance loop                         | Security group loop                              |

>  **Conclusion**:  
> Use `count` when all resources are identical.  
> Use `for_each` when you need to vary each resource's configuration.

---

###  How Functions Enhance Infrastructure-as-Code (IaC)

Terraform functions help:
- Remove hardcoding (e.g., subnet IPs, dates)
- Automate logic (e.g., max value for resources)
- Improve flexibility and scalability of infrastructure

| Function         | Real-World Use                              |
|------------------|----------------------------------------------|
| `cidrsubnet`     | Create custom subnet IP blocks               |
| `length`         | Dynamically calculate resource counts        |
| `timestamp()`    | Add time-based tags to resources             |
| `upper()`        | Format names/tags uniformly                  |
| `max()`          | Calculate resource sizing from inputs        |

>  **Conclusion**:  
> Functions turn Terraform into a **smart declarative tool** that adapts to input changes.

---

##  Comments and Assumptions

###  Assumptions:
- AWS region: `us-east-1`
- AMI used: Amazon Linux 2 (`ami-0150ccaf51ab55a51`)
- EC2 instance type: `t2.micro` (Free Tier)
- Default VPC and subnets used
- Terraform version: ≥ 1.5

###  Comments:
Each `.tf` file includes comments explaining:
- Which task the block belongs to what

>  Example:
> ```hcl
> # Task 1.2 - Creating security groups using for_each from a map of ports
> ```

---

## Submission Checklist

This project includes:
- `provider.tf`, `variables.tf`, `outputs.tf`
- `ec2_instances.tf` (commented after Task 3)
- `security-groups.tf` (for_each loop)
- `functions.tf` (built-in function use)
- `main.tf` and `modules/` folder for modularization
- This `README.md`
- All files have descriptive comments

**Submit**: Push to GitHub and share your repository link as instructed.

---

##  Author

**Varun Kakkar**  
Student ID: **9020861**  
Course: PROG8830 – **Cloud DevOps**  
College: **Conestoga College**
