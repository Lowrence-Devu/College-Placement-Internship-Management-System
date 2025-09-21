# College Placement Management System (Salesforce Project)

## Table of Contents
- [Project Overview](#project-overview)  
- [Features](#features)  
- [Technologies Used](#technologies-used)  
- [Setup and Installation](#setup-and-installation)  
- [Usage](#usage)  
- [Project Structure](#project-structure)  
- [Project History](#project-history)  
- [Testing](#testing)  
- [Contributing](#contributing)  
- [License](#license)  

---

## Project Overview
The **College Placement Management System** is a Salesforce-based CRM solution that streamlines the end-to-end placement process in colleges.  
It helps **placement officers, students, and recruiters** manage placement activities efficiently by providing automation, transparency, and real-time analytics.  

The project was developed as part of an academic initiative to explore Salesforce CRM capabilities for real-world scenarios.  

---

## Features
- **Student Module**: Store student details, resumes, skills, and placement status.  
- **Company Module**: Maintain company profiles, job openings, and eligibility criteria.  
- **Placement Drive Management**: Schedule and track campus recruitment drives.  
- **Eligibility & Shortlisting**: Automate student shortlisting based on company criteria.  
- **Communication**: Notifications to students about placement updates.  
- **Reports & Dashboards**: Visualize placement statistics (offers, drives, success rate).  

---

## Technologies Used
- **Salesforce CRM** (Lightning Experience)  
- **Apex** (classes, triggers for automation)  
- **Lightning Web Components (LWC)** for UI enhancements  
- **Salesforce CLI** for source-driven development  
- **VS Code** with Salesforce Extensions  
- **GitHub** for version control  

---

## Setup and Installation
1. **Clone the repository**  
   ```bash
   git clone https://github.com/Lowrence-Devu/College-Placement-Internship-Management-System
   cd college-placement-system
   Authenticate with Salesforce
sfdx auth:web:login -a PlacementOrg
Deploy project to your org
sfdx force:source:deploy -p force-app
Run Apex tests (optional)
sfdx force:apex:test:run --resultformat human


Usage:
Placement Officer logs in and manages companies, job postings, and drives.
Students can register, update details, and track application status.
Recruiters can shortlist candidates and view resumes.
Reports & dashboards provide placement analytics (students placed, average salary, etc.).



college-placement-system/
├── force-app/
│   ├── main/
│   │   ├── default/
│   │   │   ├── classes/       # Apex classes for business logic
│   │   │   ├── triggers/      # Automation triggers
│   │   │   ├── layouts/       # Page layouts for objects
│   │   │   ├── objects/       # Custom objects (Student, Company, Drive)
│   │   │   └── lwc/           # Lightning Web Components
├── README.md
└── .gitignore

