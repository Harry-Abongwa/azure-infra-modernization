    Azure Infrastructure Modernization – Consulting Case Study

                         Overview

This project represents a real-world enterprise infrastructure modernization engagement, migrating a traditional on-premises (colo) Windows environment to Microsoft Azure using Infrastructure as Code, Windows Server 2022, and Azure-native operations.

The focus is on lift-and-shift infrastructure, operational visibility, and modern cloud management patterns, while intentionally moving away from legacy tooling such as SCCM.

---

    Business Scenario

A mid-size enterprise is decommissioning its on-premises data center and migrating core Windows workloads to Azure.

Key objectives include:
- Minimizing operational disruption during migration
- Establishing Azure-native monitoring and logging
- Maintaining Windows Server operational parity post-migration
- Preparing for modern identity, patching, and configuration management

The environment reflects a typical mid-size enterprise footprint, designed to mirror production operational requirements rather than a proof-of-concept lab.

---

Architecture (High-Level)

 On-Prem (Legacy)
- Windows Server workloads
- Manual and siloed monitoring
- SCCM-centric patching and configuration management

        Migration

 Azure (Target State)
- Azure Virtual Network with segmented subnets
- Windows Server 2022 Virtual Machine (lift-and-shift baseline)
- Azure Monitor and Log Analytics Workspace
- Azure-native operational tooling
- PowerShell and Terraform automation

The target architecture prioritizes operational continuity, visibility, and security parity before deeper refactoring or cloud-native re-platforming.

---

 What This Project Demonstrates

     Azure Cloud Infrastructure
- Azure Resource Groups
- Virtual Network, subnets, and NSGs
- Windows Server 2022 Virtual Machine
- Azure-native networking and security boundaries

     Infrastructure as Code (Terraform)
- Declarative Azure provisioning using Terraform
- Provider and variable separation
- Outputs for reusable infrastructure components
- State-aware infrastructure lifecycle management

     Windows Server Operations
- Windows Server 2022 administration
- Server Manager validation
- System and Security Event Logs
- OS-level observability post-migration

     Monitoring & Observability
- Azure Monitor VM metrics (CPU, memory, network)
- Log Analytics Workspace integration
- Heartbeat monitoring for VM health
- Time-series analysis using KQL

     Identity & Access (Design-Level)
- Hybrid identity patterns (Active Directory + Entra ID)
- Azure-aligned authentication and authorization approach
- Enterprise-ready identity foundation

Identity is intentionally documented at the design level to reflect common enterprise migration sequencing, where identity modernization follows initial infrastructure stabilization.

    Automation with PowerShell
- Scripted resource group creation
- Automated Windows VM provisioning
- Repeatable and auditable infrastructure actions

---

## Repository Structure

```text
azure-infra-modernization/
│
├── infra/
│   └── terraform/
│       └── core/
│           ├── main.tf
│           ├── providers.tf
│           ├── variables.tf
│           └── outputs.tf
│
├── scripts/
│   └── 01_core_infra/
│       ├── 01-create-resource-group.ps1
│       └── 03-create-windows-vm.ps1
│
├── screenshots/
│   ├── 01-azure-vm-overview.png
│   ├── 02-azure-monitor-metrics.png
│   ├── 03-log-analytics-heartbeat.png
│   ├── 05-log-analytics-heartbeat-timechart.png
│   ├── 06-windows-event-viewer-system-logs.png
│   ├── 07-windows-security-event-logs-auditing.png
│   └── 08-windows-server-manager-dashboard.png
│
├── README.md
└── .gitignore


⸻

Evidence & Validation

The screenshots/ directory provides proof of:
	•	Running Azure infrastructure
	•	Live VM metrics in Azure Monitor
	•	Log Analytics heartbeat ingestion
	•	Windows Server system and security events
	•	Operational health from both Azure and OS perspectives

This ensures the project reflects actual runtime behavior, not just configuration files.

⸻

Key Design Decisions
	•	Lift-and-shift first: modernization begins with stability before refactoring
	•	Azure-native tooling over third-party agents
	•	Infrastructure as Code over manual provisioning
	•	Operational visibility treated as a first-class requirement
	•	Designed for future Azure-native enhancements

⸻

Future Enhancements
	•	Azure Arc–enabled servers
	•	Azure Update Manager for patch orchestration
	•	Entra ID join and Conditional Access
	•	Intune-managed Windows endpoints
	•	CI/CD pipeline for Terraform deployments
	•	Azure Policy and Defender for Cloud integration

⸻

Why This Project Matters

This case study demonstrates that successful cloud modernization is as much an operational and organizational challenge as it is a technical one. The project emphasizes stability, observability, and control as prerequisites for long-term cloud transformation.

⸻

Target Audience
	•	Azure Cloud Engineers
	•	Infrastructure / Platform Engineers
	•	DevOps & SRE practitioners
	•	Cloud Security Engineers
	•	Technical Consultants

⸻

Author

Harry Abongwa
Multi-Cloud & Infrastructure Engineer | Azure & Security Focus
Azure • Terraform • Windows • Security • Automation