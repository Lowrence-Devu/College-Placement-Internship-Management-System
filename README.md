# College Placement & Internship Management System

**Batch:** 4  
**Program:** TCS Last Mile SmartBridge  
**Prepared by:** Lowrence Devu  

---

## Table of Contents

1. [Project Overview](#project-overview)  
2. [Features](#features)  
3. [System Architecture](#system-architecture)  
4. [Salesforce Implementation](#salesforce-implementation)  
   - [Phase 7: Integration & External Access](#phase-7-integration--external-access)  
   - [Phase 8: Data Management & Validation](#phase-8-data-management--validation)  
   - [Phase 9: Reporting, Dashboards & Security Review](#phase-9-reporting-dashboards--security-review)  
5. [Setup Instructions](#setup-instructions)  
6. [Testing](#testing)  
7. [Screenshots](#screenshots)  
8. [Expected Outcomes](#expected-outcomes)  
9. [Conclusion](#conclusion)  

---

## Project Overview

The College Placement & Internship Management System is designed to streamline and automate the placement process for students, recruiters, and placement officers. The system provides:

- Real-time tracking of job applications  
- Secure integration with external HR systems  
- Automated notifications via Platform Events  
- Role-based access control and dashboards  
- Data validation and duplicate management  

---

## Features

- **Student Management:** Add, update, and track student profiles.  
- **Job & Company Management:** Manage job postings and company details.  
- **Applications:** Track job applications and statuses.  
- **Integrations:** SOAP and REST API integration with external HR systems.  
- **Platform Events:** Notify external systems of new applications.  
- **Reports & Dashboards:** Role-specific reports for Placement Officers, Recruiters, and Students.  
- **Security:** Field-level security, OWD, Login IP restrictions.  

---

## System Architecture

- **Salesforce Objects:** Student, Company, Job Posting, Job Application  
- **Triggers & Flows:** Automate status updates and notifications  
- **Integration Layer:** Apex SOAP callouts using Named Credentials  
- **Platform Events:** Event-driven updates for external systems  
- **Reports & Dashboards:** Dynamic dashboards filtered by user role  

---

## Salesforce Implementation

### Phase 7: Integration & External Access

- Configured **Named Credentials** for secure API access.  
- Implemented **REST/SOAP API callouts** using Apex.  
- Created **Platform Events** to notify external systems.  
- Registered **External Services** for REST APIs (SOAP handled via Apex callouts).  
- Verified **OAuth authentication** and Remote Site Settings.  

### Phase 8: Data Management & Validation

- Imported sample Students, Companies, and Job Applications.  
- Configured **Duplicate Rules** and **Validation Rules** (CGPA-based status updates).  
- Validated **role-based access and record visibility**.  
- Tested triggers and flows for automation.  
- Configured **Data Export/Import** for backups.  

### Phase 9: Reporting, Dashboards & Security Review

- Created **Reports**:
  - Applications per Job Posting  
  - Students Shortlisted/Selected/Rejected  
  - Companies and their Job Postings  
- Created **Dashboards**:
  - Placement Officer Dashboard (Bar, Pie, Table)  
  - Recruiter Dashboard (Table, Donut)  
- Enabled **Dynamic Dashboards** for role-based visibility.  
- Reviewed **Security Settings**:
  - OWD, Profile Permissions, Field-Level Security, Login Policies  
- Monitored **Audit Trail** for configuration changes  

---

## Setup Instructions

1. Clone the repository:  
   ```bash
   git clone https://github.com/Lowrence-Devu/College-Placement-Internship-Management-System.git
   ```
2. Open the project in VS Code with Salesforce Extensions.  
3. Authenticate to a Dev Hub and create a scratch org.  
4. Deploy `force-app` to your scratch org.  

---

## Salesforce DX Project: Next Steps

Additional Salesforce DX resources:

- [Development models](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models)
- [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm)
- [Salesforce Extensions for VS Code](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
