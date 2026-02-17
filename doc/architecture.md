**Log Management and Anomaly Detection Workflow**



**1. Log Sources**



**System generates logs from multiple sources capturing events.**



**Examples:**



**Windows Event Viewer: System startup/shutdown logs**



**Web Server: Apache/Nginx access and error logs**



**Applications: Python, Java, custom logs**



**Sample Log: 2026-02-17 10:20:15 INFO User login attempt**



**2. Log Collector / Ingestion**



**Logs are automatically collected for processing.**



**Examples:**



**Filebeat reading log files**



**Python scripts collecting Windows Event logs**



**APIs receiving logs from applications**



**Real-Time Example: Collector reads C:\\logs\\app.log and forwards to pipeline**



**3. Log Parsing \& Normalization**



**Converts raw logs to structured format (JSON) for analysis.**



**Raw Log: 2026-02-17 10:20:15 ERROR Login failed user=102 ip=192.168.1.5**



**Parsed JSON:**



**{**

  **"timestamp": "2026-02-17 10:20:15",**

  **"level": "ERROR",**

  **"message": "Login failed",**

  **"user\_id": 102,**

  **"ip\_address": "192.168.1.5"**

**}**





**Note: log\_schema.yaml defines parsing structure**



**4. Log Storage (Database)**



**Structured logs stored for long-term access and analysis.**



**Common DBs: MongoDB, PostgreSQL, Elasticsearch**



**Real-Time Example: All login attempts saved for trend analysis**



**5. Processing \& Feature Extraction**



**Logs cleaned and features extracted for analytics/anomaly detection**



**Example Features:**



**Errors per minute**



**Failed logins per IP**



**CPU spikes**



**Request response times**



**Real-Time Example: User fails login 20 times in 1 minute → failed\_login\_count = 20**



**6. Monitoring \& Analytics Engine**



**Monitors patterns to detect abnormal behavior**



**Checks: Error trends, login trends, unusual activity**



**Real-Time Example: Normal errors/min = 2, Observed = 200 → flagged as abnormal**



**7. Anomaly Detection Module**



**ML or rule-based methods detect anomalies**



**Common Methods: Isolation Forest, Threshold rules, Random Forest**



**Real-Time Example: IP attempts 500 logins in 2 minutes →  Brute force detected**



**8. Anomaly Storage**



**Detected anomalies stored for auditing/reporting**



**Example Anomaly Record:**



**{**

  **"anomaly\_id": "A101",**

  **"detected\_at": "2026-02-17 10:25:00",**

  **"anomaly\_type": "unusual\_login\_attempts",**

  **"severity": "HIGH",**

  **"service": "authentication",**

  **"description": "500 failed login attempts from IP 192.168.1.5"**

**}**





**Note: anomaly\_schema.yaml defines record structure**



**9. Dashboard / Alerts / Reports**



**Visualize results and notify administrators**



**Examples: Graphs, alert emails/SMS, periodic reports**



**Real-Time Example: 
ALERT: High login failures detected from IP 192.168.1.5 → Admin can block IP**

