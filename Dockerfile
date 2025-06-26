ARG NODE_VERSION=22.13.1

FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
ENV NODE_ENV=production

WORKDIR /usr/src/app

RUN --mount=type=bind,source=package.json,target=package.json \
    # --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
    --mount=type=cache,target=/root/.npm \
    npm install --include=dev
    
    # Download dependencies as a separate step to take advantage of Docker's caching.
    # Leverage a cache mount to /root/.npm to speed up subsequent builds.
    # Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
    # into this layer.
RUN npm install -g nodemon
    
COPY . /usr/src/app
    
RUN  chown -R node /usr/src/app
USER node
# Expose the port that the application listens on.
EXPOSE 3000

# Run the application.
CMD ["npm","run", "dev"]

