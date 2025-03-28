# Wishlist Feature Fix Instructions

## Issue Description

The application shows a blank screen or no error message when trying to add items to wishlist. This happens because the wishlist table might not exist in your database.

## Solution

You need to create the wishlist table in your database. Here are two ways to do it:

### Option 1: Using phpMyAdmin (Recommended)

1. Open phpMyAdmin (usually at http://localhost/phpmyadmin/ if using XAMPP)
2. Select your database (`herba_db`) from the left sidebar
3. Click on the "SQL" tab at the top
4. Copy and paste the SQL from the `wishlist-table.sql` file in this repository
5. Click "Go" to execute the script

### Option 2: Running SQL from Command Line

If you prefer using the command line, you can use the following command:

```bash
mysql -u root -p herba_db < wishlist-table.sql
```

### The SQL Script

Here's the SQL that creates the wishlist table:

```sql
CREATE TABLE IF NOT EXISTS wishlist (
  id VARCHAR(36) NOT NULL,
  userId VARCHAR(255) NOT NULL,
  productId VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY wishlist_user_product (userId, productId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

## Verification

After creating the table, you should be able to:

1. Add products to your wishlist
2. See success messages when adding to wishlist
3. View your wishlist in the profile page
4. Remove items from your wishlist

If you're still experiencing issues after following these instructions, please contact support. 