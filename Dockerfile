# from: https://github.com/Stability-AI/StableStudio/issues/33#issuecomment-1555417796
# Use the official Node.js Alpine image as the base
# why didn't they use a number like, FROM node:12 ??
FROM node:alpine

RUN apk add git

# Set the working directory in the container
WORKDIR /app

# Copy package.json and yarn.lock to the container
COPY package.json yarn.lock ./

COPY . .

# Install dependencies
RUN yarn

# Build the project
# RUN yarn build

# Expose the desired port (e.g., 3000)
EXPOSE 3000

# Start the server
CMD ["yarn", "dev", "--host", "0.0.0.0"]