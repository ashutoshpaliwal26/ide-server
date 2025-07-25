# Base image
FROM node:22

WORKDIR /app

# Copy full monorepo
COPY . .

# Install dependencies from monorepo root
RUN npm install

# Build all or target package

# Use this if you're using Turbo
RUN npx turbo run build --filter=@repo/auth

EXPOSE 8000

# Final command
CMD ["node", "apps/auth/dist/index.js"]
