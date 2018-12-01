sudo rpm -i elasticsearch-6.0.0.rpm
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
