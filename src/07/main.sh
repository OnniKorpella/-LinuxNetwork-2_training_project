#/!bin/bash
# sudo cp ../../data-samples/nginx_part_7.conf /etc/nginx/nginx.conf 

install_prometheus(){
sudo apt install prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
# http://localhost:9090/graph
}

install_node_exporter() {
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz -O - | tar -xzv -C ./
cp node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin
sudo chown -R prometheus:prometheus /usr/local/bin/node_exporter
# sudo cp node_exporter.service /etc/systemd/system/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter.service
sudo systemctl enable node_exporter.service
# http://localhost:9100/metrics

}

# install_prometheus
# install_node_exporter
# sudo apt install stress


# sudo systemctl status node_exporter.service 
# sudo systemctl status grafana-server.service   