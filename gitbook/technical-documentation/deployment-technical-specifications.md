# Deployment Technical Specifications

### **Table of contents**

[Introduction](deployment-technical-specifications.md#introduction)

[About usupport](deployment-technical-specifications.md#about-usupport)

[The Technology](deployment-technical-specifications.md#the-technology)

[Platform Components](deployment-technical-specifications.md#platform-components)

[Globally managed Server](deployment-technical-specifications.md#globally-managed-server)

[Globally managed Databases](deployment-technical-specifications.md#globally-managed-databases)

[Country-based Databases](deployment-technical-specifications.md#country-based-databases)

### Introduction

The purpose of this document is to get an overview of the usupport platform and understand the technical requirements for hosting part of the solution within your country for data sovereignty purposes.

### About Usupport

Usupport is an on-demand digital mental health (MH) solution for young people and their carers, commissioned by UNICEF Europe and Central Asia Office to address the growing mental health concerns for youth in the region.

### The Technology

The underlying technology behind the platform is leading-edge, open source and cloud based. The platform has been built from the ground-up to support the highest standards of security and privacy and exceed the requirements for GDPR (General Data Protection Regulation). The platform incorporates “privacy by design” principles and practices. The modular system utilises a microservices architecture and distributed databases to reduce the chances of a data breach.&#x20;

The platform has been designed to be regionally hosted on the cloud and support multiple country-based databases, allowing for data sovereignty.

A single instance of the platform is designed to support multiple countries, languages, translations, country-based content with appropriate authorisations, country-based terms of use and privacy policies. The system has been designed to save ongoing operational costs and support multiple countries by reducing their overheads in running the platform.

### Platform Components

<figure><img src="../.gitbook/assets/image (2).png" alt=""><figcaption><p>Figure 1: Technical specifications</p></figcaption></figure>

### Globally managed Server

The _back-end Infrastructure_ from **Figure 1** above will be hosted on an Amazon Web Services EC2 instance (eu-west-1), located in Europe (Ireland). The server will be shared amongst all different countries that are part of the USupport platform. There will be no personal or clinical data stored in the Server.

### Globally managed Databases

The _Master_ and _Headless CMS_ databases from Diagram 1 above are planned to be hosted on an Amazon Web Services RDS instance (eu-west-1), located in Europe (Ireland). These 2 databases will be shared amongst all different countries that are part of the USupport platform. There will be no personal or clinical data stored in the _Master_ and _Headless CMS_ databases.

### Country-based Databases

Apart from the globally managed server and databases, the USupport platform requires two more databases - PII (Personal Identifiable Information) and Clinical. Those are planned to be hosted on servers located within the borders of the deployment country, due to the personal and clinical data that will be stored in the 2 databases (data sovereignty). For example, for Kazakhstan the PII and Clinical databases will be hosted on a Kazakh based server, using a Kazakh hosting provider to ensure that all personal and clinical data related to Kazakh users of the USupport platform will be stored on Kazakh’s territory.

The minimum technical specifications of the server that will host those two databases are as follows:

* **2 vCPUs**
* **4GB memory**
* **30GB SSD**
* **100GB Backup Storage**

In addition to the above requirements, the hosting provider should support the hosting of PostgreSQL databases and it should also allow for scaling the server power in case the technical requirements change (i.e., increase the backup storage, memory usage, etc.)

Once a country-based hosting provider is chosen and the required purchases are made, our team will require credentials to access the account that owns those two databases, so that we can set them up and integrate them within the USupport platform.
