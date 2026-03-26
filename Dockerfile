FROM node:20-alpine

# --- system deps ---
RUN apk add --no-cache \
    git \
    bash \
    openssh-client \
    curl

# --- install paseo CLI ---
RUN npm install -g @getpaseo/cli

# --- working directory ---
WORKDIR /workspace

COPY paseo-config.json ~/.paseo/config.json

# optional: create non-root user (recommended for Coolify)
RUN adduser -D devuser
USER devuser

ENV NODE_ENV=production
ENV ORIGIN=https://paseo.summer-games.fr

# --- start paseo daemon ---
CMD ["paseo"]