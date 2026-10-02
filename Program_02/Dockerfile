# A multi stage Dockerfile

# Stage 1: Build Stage
From node:20-alpine AS builder

# Set the Working Directory
WORKDIR /app

# Copy packages
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy application source code
COPY . .


# Stage 2: Production Stage
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy the package files
COPY --from=builder /app/package*.json ./

# Copy the installed dependencies
COPY --from=builder /app/node_modules ./node_modules

# Copy the app source code
COPY --from=builder /app/src ./src

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]
