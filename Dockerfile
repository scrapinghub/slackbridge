FROM node:8-slim

RUN npm install -g slack-irc@3.11.1

CMD ["slack-irc"]
