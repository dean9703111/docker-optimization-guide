FROM node AS builder
WORKDIR /usr/src/app
COPY package.json index.js ./
RUN npm install --production

# 改成用 Distroless
FROM gcr.io/distroless/nodejs
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
EXPOSE 3000
CMD ["index.js"]