#!/bin/bash

echo "🔐 Fetching .env from AWS Secrets Manager..."

# Replace with your actual secret name
SECRET_NAME="aws-laravel-code-pipeline"
REGION="ap-south-1"
PROJECT_PATH="/mnt/aws-laravel-code-pipeline"

# Fetch secret string and save to .env
aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region "$REGION" \
  --query SecretString \
  --output text > "$PROJECT_PATH"/.env

# Secure permissions
chmod 640 "$PROJECT_PATH"/.env
chown ubuntu:www-data "$PROJECT_PATH"/.env

echo "✅ .env successfully fetched and saved."
