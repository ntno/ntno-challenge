        #https://github.com/devteds/e7-cloudformation-docker/blob/master/stack.yml
        #!/bin/bash
        apt-get update -qq
        apt-get install -y apt-transport-https ca-certificates
        apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
        echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list
        apt-get update -qq
        apt-get purge lxc-docker || true
        apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
        apt-get -y install docker-engine
        usermod -aG docker ubuntu
        mkdir -p /etc/systemd/system/docker.service.d
        printf "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375\n" >>  /etc/systemd/system/docker.service.d/docker.conf
        systemctl daemon-reload
        systemctl restart docker
