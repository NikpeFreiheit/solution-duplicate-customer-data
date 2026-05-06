# Project Summary

| Project Topic | Development of a solution to the problem of duplicate customer data in the system |
| --- | --- |
| System Type | CRM and supporting services |
| Stakeholder | Americor |

| As is |  |
| --- | --- |
| Activity to be improved | interaction between employees processing customer requests and the CRM system |
| Stakeholders |   1. Employees who register and manage requests, contracts, contact data, and customer profiles via the CRM UI<br> 2. Company managers (sales managers)<br> 3. Partners who submit data on new customers to the CRM system via API |
| As is | Duplicate removal or the decision that a new record is a duplicate is performed manually by employees based on visual assessment of the data. |
| Existing Issues |   1. At the Lead stage, different employees within the company may work with the same client, which reduces productivity. The client may be contacted by multiple managers. As a result, the client has to repeat previously provided information, and frequent calls create a perception of pushy or intrusive service. The client may assume there is disorganization within the company and becomes unclear about whom to contact for their inquiries.<br>2. At the Enrollment stage, there must not be two active accounts for the same client within the program.<br>3. Communication systems (calls, SMS, email) do not know which account client communications should be associated with.<br>4. Incorrect reporting in analytics. Due to duplicate records, the number of clients significantly deviates from analytical data. This leads to inaccurate forecasting and a lack of reliable business performance metrics. |

| To be |  |
| --- | --- |
| Stakeholders goals |   1. Improving employee efficiency in client interactions<br>2. Obtaining higher-quality and more consistent data in the database |
| User goals | Eliminating cases where the same request is processed multiple times by different employees. |
| Comparable systems | No analysis conducted |
| Competing systems | No analysis conducted |

## Solution Options

### 1. Contact validation at the data entry stage

Includes assigning a unique identification number to each request entering the system, automatic duplicate detection upon ingestion, and suggesting links to similar requests. These requests are grouped and require manual confirmation of duplication.

For requests received via API, the system returns either a confirmation that all requests were successfully uploaded or a notification that some requests were flagged as potential duplicates and are awaiting manual review. After employee verification, a batch response is generated with request IDs and statuses such as “request already exists” or “request saved” and is sent back to the partner system via API.

### 2. Centralized database

Involves unifying client data after it has been loaded into the database. A “golden record” is created for each client, to which all requests and contact information from the CRM are linked. In this approach, duplicates are still created at the Lead stage and are only resolved later, after the time required for detection and merging in the database.

### 3. Manual review and merging via table-based interface

Involves manual duplicate checking by employees using filtering across existing requests, client, and contact databases exported in a tabular format. The data is accessible for review and modification by employees.

### 4. Fully automated merging based on matching algorithms

Involves automatic merging of all requests based on a predefined matching algorithm. This approach may lead to incorrect deletion or merging of non-duplicate records, especially in cases involving full name matches without additional unique identifiers such as SSN.

## Solution Selection

### Contact validation at the data entry stage

| Solution concept |  |
| --- | --- |
| Disadvantage of the solution |   1. The time required to process a request entered manually increases, as it is necessary to confirm that the new request is not a duplicate.<br>2. Not all requests submitted via API are immediately entered into the system. Similar requests must be verified by an employee to confirm the absence of duplicates. |
| Advantages of the solution |   1. Since duplicates are already eliminated at the request creation stage, the efficiency of contact center employees handling client requests is improved.<br>2. Standardized data is entered into the database, preventing duplicate records, which helps save storage space and improves overall system performance. |
| Assumptions | The probability of duplicate records being created still remains and is associated with possible employee negligence during duplicate checks, as the “Create new request” button will be available without any restrictions. Such restrictions may be introduced as part of system enhancements following further analysis. |
| Dependencies | Validation at the system entry stage becomes a critical point of failure, as in case of validation system downtime, requests will not be able to enter the system.<br><br>To address this issue, an intermediate database is proposed, where requests will be stored *as is*. This approach helps mitigate the risk of request loss in the event of validation failure, as well as enables retrospective analysis of requests.  |
| User types (roles) involved in the project |   **1. Employee** – Employees who register and manage requests, contracts, contact data, and client profiles through the CRM UI.<br>2. **Company Manager** – Sales managers, contact management managers, and analysts responsible for analytical reporting.<br>3. **Partner** – External partners who submit data on new clients into the CRM system. |
| Related systems (integrations) |   1. Partner service transmitting client request data.<br>2. Identity verification service based on SSN (Social Security Number) validation. |
| Required reports | Not specified in the project. |

## User stories

| User type (role) | Action and Expected Outcome |
| --- | --- |
| **Company Manager** |   1. As a **Company Manager**, I want the system to prevent duplicate records so that no duplicates exist in the system.<br>2. As a **Company Manager**, I want the system to detect potential duplicates and group them together so that these requests are assigned to a single employee instead of multiple employees. |
| **Employee** |   1. As an **Employee**, I want to manually enter request data, edit it, and save it in the system so that I can maintain and update request information.<br>2. As an **Employee**, I want to view and review potential duplicates detected automatically by the system so that I can confirm or reject the suggested duplicates. |
| **Partner** | As a **Partner**, I want to retain the ability to transmit client data without loss of data quality so that the integrity and reliability of the information are preserved. |

![Domain model.png](/images/domain-model.png)