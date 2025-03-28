-- Create carts table
CREATE TABLE IF NOT EXISTS carts (
  id VARCHAR(36) PRIMARY KEY,
  userId VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create cart_items table
CREATE TABLE IF NOT EXISTS cart_items (
  id VARCHAR(36) PRIMARY KEY,
  cartId VARCHAR(36) NOT NULL,
  productId INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (cartId) REFERENCES carts(id) ON DELETE CASCADE
);

-- Create indexes
CREATE INDEX idx_carts_userId ON carts(userId);
CREATE INDEX idx_cart_items_cartId ON cart_items(cartId);
CREATE INDEX idx_cart_items_productId ON cart_items(productId); 