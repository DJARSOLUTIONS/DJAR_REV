# Base image for Node.js environment
FROM node:alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies (excluding devDependencies)
RUN npm install

# Copy the rest of the application code (excluding node_modules)
COPY . .

# Build stage (optional)
FROM node:alpine AS dev-builder

# Install devDependencies
WORKDIR /app
COPY --from=builder . .
RUN npm install --only=dev

# Slim image for production (comment out builder and dev-builder stages if used)
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy only production dependencies and application code
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app .

# Expose ports for your Express apps (replace with your ports if different)
EXPOSE 3000
EXPOSE 3001
EXPOSE 3002
EXPOSE 3003
EXPOSE 3004
EXPOSE 3005
EXPOSE 3006
EXPOSE 3007  # You can adjust the number of exposed ports as needed

# Start command (replace with your app.js or entry point)
CMD [ "npm", "start" ]
