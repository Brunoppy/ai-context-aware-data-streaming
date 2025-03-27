-- Projeto SQL de Transmissão de Dados Sensível ao Contexto com IA
-- Integração com Nuvem: AWS S3 (Data Lake)
-- Objetivo: Armazenar fluxos de dados em tempo real enriquecidos com contexto para análise posterior por IA
 
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
    raw_data_link VARCHAR(500) -- Link para o bucket AWS S3
);

INSERT INTO context_data_stream (device_id, timestamp, location, temperature, humidity, user_context, raw_data_link)
VALUES ('device_001', NOW(), 'NYC - Armazém 12', 22.5, 65.3, '{"atividade":"carregamento","turno":"noturno"}', 's3://company-bucket/streaming/device_001/2025-04-01.json');

SELECT * FROM context_data_stream
WHERE temperature > 30 OR humidity < 20;
