sudo rpm -i kibana-6.0.0-x86_64.rpm
sudo systemctl daemon-reload
sudo systemctl enable kibana.service
sudo systemctl start kibana.service
