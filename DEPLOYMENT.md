# Deploying Herbal Shop to Coolify

This guide provides step-by-step instructions for deploying the Herbal Shop application to Coolify.

## Prerequisites

1. Access to a Coolify server or account
2. Git repository with your project (GitHub, GitLab, Bitbucket, etc.)

## Deployment Steps

### Step 1: Connect Your Repository

1. Log in to your Coolify dashboard
2. Go to "Sources" and connect your Git provider if not already connected
3. Add your repository as a source

### Step 2: Create a New Service

1. In the Coolify dashboard, click on "Create a new resource"
2. Select "Application" as the resource type
3. Choose "Docker Compose" as the application type
4. Select your repository and branch (usually `main` or `master`)

### Step 3: Configure Environment Variables

Set the following environment variables in the Coolify dashboard:

```
DATABASE_HOST=db
DATABASE_USER=root
DATABASE_PASSWORD=your_mysql_password
DATABASE_NAME=herba_db
DATABASE_URL=mysql://root:your_mysql_password@db:3306/herba_db?connection_limit=5&connect_timeout=30&charset=utf8mb4
NEXTAUTH_SECRET=your-secure-random-string
NEXTAUTH_URL=https://your-domain.com
NEXT_PUBLIC_API_URL=https://your-domain.com/api
MYSQL_ROOT_PASSWORD=your_mysql_password
NODE_ENV=production
```

Make sure to replace:
- `your_mysql_password` with a secure password
- `your-secure-random-string` with a random string for session encryption
- `https://your-domain.com` with your actual domain

### Step 4: Configure Domain and SSL

1. In the service settings, add your domain
2. Enable SSL with Let's Encrypt

### Step 5: Deploy

1. Click "Save" to save your configuration
2. Click "Deploy" to start the deployment process

## Database Initialization

The first time you deploy, the database will be initialized using the SQL files in the `database` directory and the `wishlist-table.sql` file.

## Troubleshooting

### Issue: Wishlist Not Working

If the wishlist feature is not working, it might be because the wishlist table hasn't been created. Check the database logs to ensure that `wishlist-table.sql` was properly executed during initialization.

### Issue: Connection Refused to MySQL

Check if the MySQL service is running properly by checking the logs in the Coolify dashboard. Make sure the `DATABASE_HOST` is set correctly to `db`.

### Issue: Next.js Build Failing

Check the build logs for any errors. Make sure all dependencies are properly installed and there are no environment-specific code that might fail in production.

## Maintenance

### Updating the Application

To update your application, simply push changes to your repository, and then redeploy in the Coolify dashboard.

### Database Backups

Set up regular database backups using Coolify's backup functionality or manually export your data periodically. 