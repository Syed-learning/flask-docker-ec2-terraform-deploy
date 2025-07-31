
#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu

# Clone project from GitHub (you must push your project to GitHub first)
cd /home/ubuntu
git clone https://github.com/Syed-learning/flask-docker-ec2.git
cd flask-docker-ec2
docker build -t flask-app .
docker run -d -p 5000:5000 flask-app


