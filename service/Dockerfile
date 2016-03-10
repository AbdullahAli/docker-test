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

# Copy stuff over
RUN mkdir /src
COPY ./package.json src/
RUN cd src && npm install
COPY . /src
WORKDIR /src

# start
CMD ["npm", "start"]
