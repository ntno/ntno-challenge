sudo yum update -y
sudo amazon-linux-extras disable docker
sudo amazon-linux-extras install -y ecs; sudo systemctl enable --now ecs
curl -s http://localhost:51678/v1/metadata | python -mjson.tool