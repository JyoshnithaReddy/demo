# High-Throughput Log Analytics & Monitoring Engine - Milestone 1

This repository contains the work for **Milestone 1** of the project **High-Throughput Log Analytics & Monitoring Engine**.

The milestone includes designing log and anomaly schemas, creating system architecture diagrams, and setting up tools like **Dask** and **Ray**.

---

## Task 1: Log Schema Design

### Goal
Define what system/application logs look like in a structured format.

### Output File
- `schemas/log_schema.yaml`

### Description
The log schema defines the required and optional fields such as:
- timestamp
- log level
- service name
- message
- user_id
- ip_address
- metadata

This schema ensures all logs are normalized into a standard format for storage and analysis.

---

## Task 2: Anomaly Schema Design

### Goal
Define what anomalies look like and what types of problems the system should detect.

### Output File
- `schemas/anomaly_schema.yaml`

### Description
The anomaly schema includes anomaly types and details such as:
- anomaly id
- detected time
- anomaly type
- severity
- service name
- anomaly description
- anomaly score / confidence score

This helps represent detected problems in a structured way.

---

## Task 3: Draw System Architecture and Data Flow

### Goal
Draw diagrams showing how logs move through the system and how the overall system works.

### Output Files
- `diagrams/system_architecture.png`
- `diagrams/data_flow.png`
- `docs/architecture.md`

### Description
The diagrams show the full pipeline:

**Apps → Collect Logs → Store Logs → Find Problems → Send Alerts**

The documentation file explains:
- where logs come from
- how logs are collected
- how logs are processed
- what happens to bad or broken logs

---

## Task 4: Setup Tools (Dask + Ray)

### Goal
Install and configure **Dask** and **Ray**, and verify they work correctly.

### Output Files
- `environment/requirements.txt`
- `environment/setup.sh`
- `tests/test_environment.py`
- `README_SETUP.md`

### Setup Instructions
To install dependencies and set up environment:

```bash
bash environment/setup.sh
