# homelab-infra

Infrastructure as code for my bare-metal Kubernetes homelab (Talos Linux, Proxmox, Longhorn, GitOps).

- `talos/` — Image Factory schematic and machine config patches (secrets are never committed)
- `terraform/` — Proxmox VMs for the Talos workers (in progress)
- `docs/` — architecture notes and runbooks
