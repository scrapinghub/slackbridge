FROM ubuntu:vivid

ENV DEBIAN_FRONTEND noninteractive

# Usual update / upgrade
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Install our favorite tools and other requirements
RUN apt-get install -y vim supervisor

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install --fix-missing -y nodejs

# Get slack-irc
RUN npm install -g slack-irc

# Add supervisor configs
ADD supervisord.conf supervisord.conf

# Add entrypoint script
ADD run.sh /

# Make it executable
RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["start"]
