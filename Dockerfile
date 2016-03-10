FROM ubuntu
MAINTAINER abdullah ali

# Update aptitude
RUN apt-get update

# Install Git
RUN apt-get install --yes git

# Install node
RUN apt-get install --yes nodejs nodejs-legacy npm

# Make ssh directory
RUN mkdir /root/.ssh

# Create known hosts
RUN touch /root/.ssh/known_hosts

# Add github to known hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Set working directory
RUN mkdir /src
WORKDIR /src

# Git pull (the git clone
ENV repo docker-test
RUN if cd ./${repo}; then git pull; else git clone https://github.com/AbdullahAli/docker-test ${repo}; fi
