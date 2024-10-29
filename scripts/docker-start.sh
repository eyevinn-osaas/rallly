#!/bin/sh
set -e

DIRECT_DATABASE_URL=$DATABASE_URL
prisma migrate deploy --schema=./prisma/schema.prisma
NEXT_PUBLIC_BASE_URL=https://$OSC_HOSTNAME
NEXTAUTH_URL=$NEXT_PUBLIC_BASE_URL node apps/web/server.js
