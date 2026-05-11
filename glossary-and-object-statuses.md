# Glossary and object statuses

## Glossary

**Client** – an individual who contacts the company to receive debt settlement services.

**Request** – a client application filled in manually by a company employee or submitted via API by a partner. It contains the client’s last name, first name, a unique request ID in the system, and may include contact details and SSN data.

**Request group** – a set of requests linked together that contain identical data and are identified by the system as duplicates. These requests are connected to each other to prevent them from being assigned to different employees.

**Client profile** – information about a client participating in the program, confirmed by a company employee via phone call, through an SSN registry check, or by other means.

**Contacts** – client contact details confirmed by a company employee.

**Contract** – terms of debt settlement services contained in documents signed by the client. The contract is linked to both the client and the request that has progressed to the contract signing stage.

## **Statuses**

**Lead** – Request status. The client has not signed documents and is not a program participant. A sales employee works with the client and offers participation in the program. At this stage, the Request and Contacts entities are created and active.

**Consented** – Request status. The client has agreed to participate in the program and is in the document signing stage. At this point, the Client Profile and Contract entities are created, and the Contacts data is updated or enriched.

**Cancelled** – Status for both Request and Contract. The client has declined participation in the program. A request in either Lead or Consented status, as well as a contract in Enrollment status, can move to Cancelled, since rejection may occur at both stages.

**Enrollment** – Contract status. Set after documents are signed and service delivery has begun. Indicates that the contract is in progress.

**Completed** – Contract status. Set after the completion of service delivery under the contract.

**Archive** – Request status. A request is moved to this status if it is identified as a duplicate. A corresponding flag is added in the data, along with a link to the master request.

![Application state.jpg](/images/application-state.jpg)

[Application state.puml](/docs/business_rules/application-state.puml)