# Rules for cleansing, normalization, validation, and grouping

## Data cleansing

- Removal of empty values
- Removal of leading and trailing whitespace from strings

## Data normalization

Standardizing data into a unified format:

- All **First Name** and **Last Name** values are converted to a single case (uppercase letters)
- All **First Name** and **Last Name** values are cleaned from all characters except A–Z and “-” (for double-barreled names and surnames)
- All **Client Phone** values are converted to the NANP format (*North American Numbering Plan*)
`It is assumed that the UI allows the user to select the country separately and enter the remaining part of the phone number independently, potentially using an input mask.
Advantage: enables the use of different input masks for different countries (as well as regions within a country).
Disadvantages: the list of countries (and regions within each country) may become large; the phone number is no longer treated as a single unified entity (or requires preprocessing before storage and display)`


The valid NANP phone number format is:

**+1-NPA-NXX-xxxx**

| Component | Name | Value Range | Notes |
| --- | --- | --- | --- |
| **+1** | country code | - | “1” also serves as the prefix for long-distance calls within NANP. Within NANP, numbers are typically written without the leading “+”. |
| **NPA** | area code | Valid values: first digit [2–9], second and third digits [0–9] | Covers Canada, the United States, parts of the Caribbean, and some Atlantic and Pacific islands. The area code is often written in parentheses. |
| **NXX** | central office (exchange) code | Valid values: first digit [2–9], second and third digits [0–9] | Often considered part of the subscriber number. The three-digit central office code is assigned to a specific telephone exchange serving subscribers, but it may be physically routed via call forwarding, belong to a mobile operator, or be used by other services. |
| **xxxx** | subscriber number | [0–9] for each digit | A unique 4-digit subscriber number within a given telephone exchange. |
- All **SSNs** are standardized to the format **078-05-1120** (area number, group number, serial number within the group).
- All **Email** values are validated for the presence of the “@” symbol and converted to a single case (uppercase letters).
- The **Address** field is not normalized and is free-form. As a result, the **Address** field cannot be used in validation or client grouping logic.

## Validation and grouping of client requests

At the request creation stage, each request is assigned a unique identification number.

### Scenario 1

Requests are considered duplicates and are automatically processed (merged) by the system based on the following criteria:

- First Name, Last Name, Client Phone, Email, and SSN of one request fully match the First Name, Last Name, Client Phone, Email, and SSN of another request
- First Name, Last Name, and SSN of one request fully match the First Name, Last Name, and SSN of another request

### Scenario 2

Requests are considered duplicates, grouped together, and require additional confirmation from an employee based on the following criteria:

- First Name, Last Name, and Client Phone of one request fully match the First Name, Last Name, and Client Phone of another request
- First Name, Last Name, and Email of one request fully match the First Name, Last Name, and Email of another request
- First Name, Last Name, and SSN of one request fully match the First Name, Last Name, and SSN of another request
- First Name, Last Name of one request fully match the First Name, Last Name of another request, while one request contains only Email and the other contains only Client Phone

### Scenario 3

Requests with other combinations of matches and mismatches are processed and stored in the system with normalized data without additional flags.

________________

**Requests grouped together with cross-references are assigned to a single employee for processing, eliminating the possibility of identical requests being handled by multiple employees.**

![Activity diagram.jpeg](/images/activity-diagram.jpg)
[Activity diagram.puml](/docs/business_rules/activity-diagram.puml)
