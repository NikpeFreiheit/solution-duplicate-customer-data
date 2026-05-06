# Development of a Solution for the Problem of Duplicate Customer Data

## Overview

This project describes the design and development of a system for detecting, validating, and managing duplicate customer data across applications stored in a centralized database.

The goal is to ensure **data consistency**, reduce duplication, and improve the quality of customer records used in downstream business processes.

[Project summary](/docs/project-summary.md)

---

## Problem Statement

[Test assigment](/test-assignment.md)

In the current system, customer applications may contain:
- duplicated records
- inconsistent data formats
- partial or conflicting information
- multiple representations of the same individual

This leads to:
- incorrect analytics
- redundant processing
- increased operational costs
- unreliable customer profiles

---

## Proposed Solution

The solution introduces a structured process for:

- normalization of incoming applications
- validation against existing database records
- duplicate detection logic
- scenario-based processing (merge / create / archive)
- audit-friendly data storage

[Solution Selection](./docs/project-summary.md#solution-selection)

---

## Key Components

### 1. Data Normalization
Standardization of incoming application data before processing.

[Data normalization](/docs/business_rules/cleansing-normalization-validation.md#data-normalization)

### 2. Validation Layer and Duplicate Detection Logic
Comparison of normalized application with existing database records.

[Validation and grouping of client requests](/docs/business_rules/cleansing-normalization-validation.md#validation-and-grouping-of-client-requests)

### 3. Processing Scenarios

[Activity diagram.puml](/docs/business_rules/activity-diagram.puml)

- **Scenario 1:** Automatic merge of applications by system
- **Scenario 2:** Manual or rule-based resolution of duplicates
- **Scenario 3:** Creation of a new application when no match is found


---

## High-Level Flow

1. Application is received by the system  
2. Data is normalized  
3. System performs validation against database  
4. Matching logic is applied  
5. One of the scenarios is executed:
   - merge
   - archive duplicate
   - create new record

---

## Architecture Notes

The system is designed to support:

- modular validation rules
- extensible matching strategies
- audit logging for all decisions
- future integration with event-driven processing

---

## Technologies (conceptual)

- PlantUML (process modeling)
- [SQL](/db/ddl/conceptual-postgres-schema.sql) / [NoSQL databases](/db/ddl/mongo-raw-schema.json)
- [Event-driven architecture](/docs/architecture/context-diagram.puml)
- API-based integration layer

---

## Notes

This repository focuses on **system design and process modeling**, not implementation.

All diagrams and flows represent conceptual business logic for handling duplicate customer data.

---