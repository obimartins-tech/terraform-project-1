# Production Runbook

## Terraform Workflow

1. Review configuration.
2. Run terraform fmt.
3. Run terraform validate.
4. Run terraform init.
5. Run terraform plan.
6. Review the plan.
7. Obtain approval.
8. Apply the approved changes.

## Troubleshooting

### Terraform authentication failure

Check AWS credentials.

### EC2 is unreachable

Check:

- Instance status
- Security group
- Public IP
- Route table
- Internet Gateway

### Website unavailable

Check:

- Nginx status
- Port 80
- Security group
- EC2 status