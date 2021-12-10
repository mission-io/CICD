# Prometheus

```yml
global:
  scrape_interval: 30s
  scrape_timeout: 10s

rule_files:

scrape_configs:
  - job_name: services
    metrics_path: /metrics
    static_configs:
      - targets: ['prometheus:9090']
  - job_name: 'my-app'
    static_configs:
      - targets: ['host.docker.internal:8085']
```

## Sample Configuration of Prometheus
1. [Spring Boot Actuator](https://www.callicoder.com/spring-boot-actuator-metrics-monitoring-dashboard-prometheus-grafana/)
