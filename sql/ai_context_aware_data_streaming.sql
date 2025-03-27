
-- AI Context-Aware Data Streaming SQL Project
-- Cloud Integration: AWS S3 (Data Lake)
-- Purpose: Store real-time context-enriched data streams for further AI analysis

CREATE DATABASE IF NOT EXISTS ai_context_streaming;
USE ai_context_streaming;

CREATE TABLE IF NOT EXISTS context_data_stream (
    event_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    device_id VARCHAR(100),
    timestamp DATETIME,
    location VARCHAR(255),
    temperature FLOAT,
    humidity FLOAT,
    user_context JSON,
    anomaly_flag BOOLEAN DEFAULT FALSE,
    raw_data_link VARCHAR(500) -- Link to AWS S3 bucket
);

INSERT INTO context_data_stream (device_id, timestamp, location, temperature, humidity, user_context, raw_data_link)
VALUES ('device_001', NOW(), 'NYC - Warehouse 12', 22.5, 65.3, '{"activity":"loading","shift":"night"}', 's3://company-bucket/streaming/device_001/2025-04-01.json');

SELECT * FROM context_data_stream
WHERE temperature > 30 OR humidity < 20;
