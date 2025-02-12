# Install Docker
sudo apt  install docker.io -y

#Create Nexus Repo using Docker image
sudo docker run -d -p 8081:8081 sonatype/nexus3

#Create Sonarqube Repo using Docker image

sudo docker run -d -p 9000:9000 sonatype/nexus3

# To get nexus password

sudo docker exec -it <nexus contailes ID> /bin/bash


# install terraform
sudo snap install terraform --classic


# install kubectl
sudo snap install kubectl --classic


# connect cluster
aws eks --region ap-south-1 update-kubeconfig --name devopsshack-cluster



# Create secret for private dockerhub

kubectl create secret docker-registry regcred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=vamsi3203 \
  --docker-password=Learning@3203 \
  --namespace=webapps

===============================================================

Promotheus

wget https://github.com/prometheus/prometheus/releases/download/v3.2.0-rc.1/prometheus-3.2.0-rc.1.linux-amd64.tar.gz


blackbox exporter

wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz


==================================================

#Install Grafana

sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.5.1_amd64.deb
sudo dpkg -i grafana-enterprise_11.5.1_amd64.deb

# to Run Grafana
 sudo /bin/systemctl start grafana-server

# Run Prometheus
cd prometheus
./prometheus &

# Run Prometheus
cd prometheus
./prometheus &


=============================================

# link blackbox and Prometheus
https://github.com/prometheus/blackbox_exporter

- job_name: 'blackbox'
    metrics_path: /probe
    params:
      module: [http_2xx]  # Look for a HTTP 200 response.
    static_configs:
      - targets:
        - http://prometheus.io    # Target to probe with http.
        - https://prometheus.io   # Target to probe with https.
        - http://example.com:8080 # Target to probe with http on port 8080.
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: 127.0.0.1:9115