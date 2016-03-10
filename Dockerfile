FROM ubuntu
MAINTAINER abdullah ali

# Update aptitude
RUN apt-get update

# Install Git
RUN apt-get install --yes git

# Make ssh directory
RUN mkdir /root/.ssh

# Copy private key and set permissions
ADD /Users/abdullahali/.ssh/id_rsa /root/.ssh/id_rsa

# Create known hosts
RUN touch /root/.ssh/known_hosts

# Add github to known hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Set working directory
RUN mkdir /src
WORKDIR /src

# Git pull (the git clone
ENV repo /docker-test
RUN if cd /src/${repo}; then git pull; else git clone https://github.com/AbdullahAli/docker-test ${repo}; fi
