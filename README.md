# Solution for Duplicate Customer Data

System design for detecting, grouping, and resolving duplicate customer records in a CRM serving the full customer lifecycle for credit debt settlement.

The repository contains the **system design and process modeling**, not implementation. See [test-assignment.md](test-assignment.md) for the original problem statement and [index.md](index.md) for the project entry point.

---

## What's in this repository

| Area | Where to look |
| --- | --- |
| Entry point | [index.md](index.md) |
| Glossary and object statuses | [glossary-and-object-statuses.md](glossary-and-object-statuses.md) |
| Solution options, selection & justification, user stories | [docs/project-summary.md](docs/project-summary.md) |
| Task decomposition for developers | [docs/tasks.md](docs/tasks.md) |
| Cleansing, normalization, validation, grouping rules | [docs/business_rules/cleansing-normalization-validation.md](docs/business_rules/cleansing-normalization-validation.md) |
| Activity & state diagrams | [docs/business_rules/](docs/business_rules/) · [images/](images/) |
| C4 architecture (context, container, component) and sequence diagrams | [docs/architecture/](docs/architecture/) |
| API specification (mapping, JSON contracts) | [docs/api/](docs/api/) |
| DB schemas — PostgreSQL (long-term) and MongoDB (raw/backup) | [db/ddl/](db/ddl/) |

---

## Scope & Assumptions

**Focus of this work:** handling of duplicate customer data at the data-entry stage of a CRM.

### In scope

- Analysis of solution options (4 alternatives) and selection of the recommended approach with justification
- Solution concept: data normalization rules, validation logic, and duplicate-grouping scenarios
- Process modeling: activity diagram, application state diagram, sequence diagrams for partner / user / SSN-check flows
- Integration architecture between CRM, Normalization & Validation service, API Gateway, Partner systems, and external SSN service (C4: context, container, component)
- Database schema for both long-term storage (PostgreSQL) and raw backup storage (MongoDB)
- API contract for partner data submission and CRM data retrieval
- Task decomposition for developers, sufficient to implement the proposed solution

### Assumptions

- Domains used in message exchange examples are fictional; message structures are illustrative.
- External system interfaces (Partner API, SSN service) are assumed based on the assignment description and are not validated against real implementations.
- HTTPS is assumed as the transport for data exchange between Partner systems and the company system.
- Phone numbers are assumed to follow NANP; the UI is assumed to allow country selection separately. Addresses are free-form and not used in matching logic.

---

## Out of scope

The following topics are part of a complete production design but were **consciously excluded** from this assignment, because they cannot be addressed responsibly without access to the existing production system, its technology stack, and stakeholders aligned with the System Analyst role.

I have a clear view of what each item should contain in a full design and am happy to discuss any of them in detail.

- **Security model** — RBAC, authentication and authorization for system users, security policies for personal data handling beyond the HTTPS-in-transit assumption.
- **Non-functional requirements** — SLA / SLR, performance and capacity targets, UI/UX requirements.
- **Observability** — logging strategy, metrics, alerting, monitoring dashboards.
- **UI mockups** — visual design for displaying grouped customer records and resolving duplicates.
- **Disaster recovery plan** — DR strategy, RPO/RTO targets, fallback and graceful degradation when Normalization or Validation services are unavailable. The raw MongoDB store mitigates request loss during validation downtime, but a full DR plan is out of scope.

> These require access to the production system, which was not part of the test assignment.

---

## Notes on completeness

The defined tasks cover the duplicate-data scenario described in the assignment and are not intended as a full system redesign. A complete resolution would require additional context about the existing ("as-is") architecture, the company's technology stack, and access rights appropriate to the System Analyst role.