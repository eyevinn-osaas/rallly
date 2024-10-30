#!/bin/sh
set -e

echo $OSC_HOSTNAME

SECRET_PASSWORD=`cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1`
DIRECT_DATABASE_URL=$DATABASE_URL prisma migrate deploy --schema=./prisma/schema.prisma
NEXT_PUBLIC_BASE_URL="https://$OSC_HOSTNAME"
NEXTAUTH_URL=$NEXT_PUBLIC_BASE_URL node apps/web/server.js
