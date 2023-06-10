# Use Alpine Linux as the base image
FROM alpine:latest

# Install required packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        python3 \
        py3-pip \
        build-base \
        libffi-dev \
        openssl-dev \
        python3-dev \
        openssh \
        rsync

# Install Ansible
RUN pip3 install --upgrade pip && \
    pip3 install ansible requests

# Set the working directory
WORKDIR /ansible

# Copy your Ansible playbook to the container
#COPY playbook.yml ./

# Copy ansible.cfg and ansible folder to container
COPY ./ansible.cfg /etc/ansible/ansible.cfg
COPY ./ansible /ansible

ENV DIST_DIR=/tmp/dist

# Run Ansible playbook
CMD ["/bin/ash", "-c", "/usr/bin/ansible-playbook -vvv -i inv/ci.yml src/ci.yml"]
