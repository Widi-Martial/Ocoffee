ARG NODE_VERSION=22.13.1

FROM node:${NODE_VERSION}-slim

# Use production node environment by default.
ENV NODE_ENV=production

WORKDIR /usr/src/app

# RUN --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
#     --mount=type=cache,target=/root/.npm \
#     npm install -g npm@11.5.1 && npm install -g pnpm@latest-10 && pnpm install

COPY package.json pnpm-lock.yaml ./
RUN npm install -g npm@11.5.1 && npm install -g pnpm@latest-10 && pnpm install --frozen-lockfile
    
    
COPY . .
    
RUN  chown -R node /usr/src/app
USER node
# Expose the port that the application listens on.
EXPOSE 3000

# Run the application.
CMD ["pnpm", "start"]

