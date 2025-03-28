-- Create wishlist table if it doesn't exist
CREATE TABLE IF NOT EXISTS wishlist (
  id VARCHAR(36) NOT NULL,
  userId VARCHAR(255) NOT NULL,
  productId VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY wishlist_user_product (userId, productId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 