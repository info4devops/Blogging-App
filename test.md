# Docker Installation

```sh
sudo apt install docker.io -y
```

## Deploy Nexus Repository with Docker

```sh
sudo docker run -d -p 8081:8081 sonatype/nexus3
```

## Deploy SonarQube with Docker

```sh
sudo docker run -d -p 9000:9000 sonatype/nexus3
```

## Retrieve Nexus Admin Password

```sh
sudo docker exec -it <nexus-container-ID> /bin/bash
```

---

# Terraform Installation

```sh
sudo snap install terraform --classic
```

# Kubectl Installation

```sh
sudo snap install kubectl --classic
```

## Connect to AWS EKS Cluster

```sh
aws eks --region ap-south-1 update-kubeconfig --name devopsshack-cluster
```

## Create a Kubernetes Secret for Private DockerHub Registry

```sh
kubectl create secret docker-registry regcred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=<your-docker-username> \
  --docker-password=<your-docker-password> \
  --namespace=webapps
```

---

# Prometheus Installation

Download and extract Prometheus:

```sh
wget https://github.com/prometheus/prometheus/releases/download/v3.2.0-rc.1/prometheus-3.2.0-rc.1.linux-amd64.tar.gz
```

## Blackbox Exporter Installation

```sh
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz
```

---

# Grafana Installation

```sh
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.5.1_amd64.deb
sudo dpkg -i grafana-enterprise_11.5.1_amd64.deb
```

## Start Grafana Service

```sh
sudo /bin/systemctl start grafana-server
```

## Start Prometheus

```sh
cd prometheus
./prometheus &
```

---

# Linking Blackbox Exporter with Prometheus

Refer to the official Blackbox Exporter repository: [Blackbox Exporter](https://github.com/prometheus/blackbox_exporter)

### Prometheus Configuration for Blackbox Exporter

```yaml
- job_name: 'blackbox'
  metrics_path: /probe
  params:
    module: [http_2xx]  # Expect HTTP 200 responses.
  static_configs:
    - targets:
        - http://prometheus.io    # HTTP target.
        - https://prometheus.io   # HTTPS target.
        - http://example.com:8080 # HTTP target on port 8080.
  relabel_configs:
    - source_labels: [__address__]
      target_label: __param_target
    - source_labels: [__param_target]
      target_label: instance
    - target_label: __address__
      replacement: 127.0.0.1:9115
```

---

