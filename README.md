# Azure Infrastructure Modernization – Consulting Case Study

## Goal
Simulate a real-world migration from a colo data center to Azure, using Windows Server 2019+/2022, Entra ID, Intune, and Azure-native patch/config management (moving away from SCCM).

## What this repo will include
- Core Azure infrastructure (VNet, subnets, NSGs)
- Windows Server 2022 workload (lift-and-shift baseline)
- Hybrid identity patterns (AD DS + Entra ID concepts)
- Windows 11 24H2 endpoint management with Intune
- Azure Update Manager / policy-based patching & governance
- PowerShell automation for provisioning, reporting, and ops

## Repo Structure
- scripts/00_setup: environment validation + login
- scripts/01_core_infra: networking + server build
- scripts/02_identity: identity + access automation
- scripts/03_endpoints: Win11 + Intune reporting
- scripts/04_ops: patching/compliance exports
- outputs/: exported reports (CSV/JSON)
- screenshots/: portal screenshots for documentation/LinkedIn
