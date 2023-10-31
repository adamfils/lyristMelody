# Start with the Alpine base image
FROM alpine:3.18

# Set the authors label
LABEL authors="adamfils"

# Set the working directory to /
WORKDIR /

# Install Node.js and git
RUN apk add --no-cache nodejs npm git \
    && git clone https://github.com/adamfils/lyrist.git \
    && apk del git

# Change the working directory to /lyrist
WORKDIR /lyrist

# Install dependencies
RUN npm install

# Expose the necessary port
EXPOSE 3000/tcp

# Set the entrypoint
ENTRYPOINT ["npm", "run", "dev"]
