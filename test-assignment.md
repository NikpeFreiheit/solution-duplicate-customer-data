## Test Assignment

There is a CRM system that covers the entire customer lifecycle for credit debt settlement. A client can be at several stages.

*   **Lead Stage** – the client has not signed documents and is not a program participant; a sales department employee works with them and proposes joining the program.
*   **Enrollment Stage** – after documents are signed, the debt settlement service begins. A client can be in inactive stages, **Cancelled** or **Completed**, when they cancel or finish the program.

### Current Workflow
Leads enter the system through several channels: partners transfer leads via various API methods, and company employees can create leads manually. Consequently, there are currently several duplicate accounts for the same client at each stage in the system. The basic data received for a client includes:

*   **Mandatory:** “First Name”, “Last Name”
*   **Optional:** “Client Phone”, “Address”, “Email”, “SSN”

### Problems
1.  At the **Lead** stage, different employees may work with the same client, which reduces productivity.
2.  At the **Enrollment** stage, there should not be two active accounts for the same client in the program.
3.  Communication systems (calls, SMS, mail) do not know which account to link client communications to.

### Task
Propose solutions to the problem of duplicate client accounts in the current system.

**The solution should include:**
*   A description of possible options for solving this task.
*   Selection of the most suitable option from the list, with justification for why it fits best. Describe proposals, assumptions, and dependencies for it.
*   Development of a solution concept, including a description of processes (you may use any notations that you believe will help a developer understand the process being implemented), as well as reflecting the integration interaction between components within the system (you may use any suitable diagrams, methods, and data processing algorithms).
*   A description of the DB schema (main entities and the relationships between them necessary to solve the task).
*   Decomposition of the presented concept into a set of tasks understandable for developers. The completion of all set tasks should be sufficient for a full resolution of the entire problem.

**Important:** During the assignment period, you have the opportunity to ask clarifying questions.