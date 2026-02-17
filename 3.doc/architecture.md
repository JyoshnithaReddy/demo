1. Where do logs come from?
Logs are the "digital footprints" of your system. In this project, they originate from:

Application Services: High-throughput applications (like a web server or a database) that generate events every time a user logs in, a search is performed, or an error occurs.

System Components: The underlying operating system or virtual machines that report on CPU usage, memory health, and network connectivity.

Source Format: These usually start as raw text strings or structured JSON data stored in local files (e.g., /var/log/app.log).

2. How do you collect them?
Collection is the process of gathering logs from various sources and moving them to a central location.

Log Agents/Collectors: We use scripts or tools (like Fluentd, Logstash, or a custom Python watchdog script) that "tail" the log files.

Real-time Ingestion: Instead of waiting for a file to finish, the collector reads new lines the millisecond they are written, ensuring the monitoring system is always up to date.

Transport: The collector then pushes this data to the next stage—the storage layer or the processing engine—using APIs or data streams.

3. How do you process them?
Processing turns "messy" raw text into actionable data.

Parsing (Regex): The system uses Regular Expressions (Regex) to break a single line of text into parts: Timestamp, Log Level (INFO/ERROR), and Message.

Filtering: To avoid "noise," the processor focuses on specific keywords like "ERROR", "CRITICAL", or "FATAL". This helps in finding problems quickly without reading millions of "INFO" lines.

Normalization: Ensuring all logs, regardless of which app they came from, look the same (e.g., all dates are converted to a standard format like ISO 8601).

4. What happens to bad/broken logs?
A robust system must handle "dirty data" without crashing.

Validation: Before processing, the system checks if the log matches the expected schema (like the ones in your schemas/ folder).

Redirection (Dead Letter Queue): If a log is missing a timestamp or is corrupted, it is diverted to a 'Dead Letter Queue' or a specific folder named failed_logs/.

Alerting on Failures: The system logs the failure itself, notifying administrators that a specific source is sending "broken" data that needs to be fixed at the source.