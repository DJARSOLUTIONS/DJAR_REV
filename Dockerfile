# Base image for Node.js environment
FROM node:alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package.json ./
# Install dependencies
RUN npm install

# Copy the rest of the application code (excluding node_modules)
COPY . .

# Build stage - optimized for building the app
# Not needed for running the app, comment out if not required
# RUN npm run build  # Replace with your build command if needed

# Slim image for production (comment out builder stage if used)
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy only production dependencies and application code
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app .

# Expose port for the Express app (replace with your port if different)
EXPOSE 3000
EXPOSE 3001
EXPOSE 3002
EXPOSE 3003
EXPOSE 3004
EXPOSE 3005
EXPOSE 3006
EXPOSE 3007

# Start command (replace with your app.js or entry point)
CMD [ "npm", "start" ]
