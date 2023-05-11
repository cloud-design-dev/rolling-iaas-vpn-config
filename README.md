# rolling-iaas-vpn-config

VPN server connection for Classic IaaS

## 1. Clone the repo

```
git clone https://github.com/cloud-design-dev/rolling-iaas-vpn-config.git
cd rolling-iaas-vpn-config
```

## 2. Set Terraform variables

```bash
cp tfvars.example terraform.tfvars
```

Open `terraform.tfvars` and set the variables. (provided in slack)

## 3. Initialize Terraform

```bash
terraform init 
```

## 4. Run Plan and Apply

```bash
terraform plan -out default.tfplan
terraform apply default.tfplan
```