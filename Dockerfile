# Step 1: build stage
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Step 2: serve stage
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
