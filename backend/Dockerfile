# Stage 1: Build TypeScript
FROM node:24-alpine AS builder
WORKDIR /app/backend
COPY backend/package.json backend/package-lock.json ./
RUN npm ci
COPY backend/tsconfig.json ./
COPY backend/src/ ./src/
RUN npm run build

# Stage 2: Runtime
FROM node:24-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production
COPY backend/package.json backend/package-lock.json ./
RUN npm ci --omit=dev
COPY --from=builder /app/backend/dist ./dist
COPY frontend/ ./frontend/
EXPOSE 3000
CMD ["node", "dist/server.js"]
