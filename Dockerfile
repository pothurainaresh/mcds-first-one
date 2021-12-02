FROM node:10-alpine

WORKDIR "/app"

# Install app dependencies
COPY . /app
RUN cd /app; npm install; npm prune --production; npm install -g yo

ENV NODE_ENV production
ENV PORT 3000
ENV LOGGER_LEVEL debug
ENV DEBUG debug

EXPOSE 3000
CMD ["yo", "mss"]
