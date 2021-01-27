SET FOREIGN_KEY_CHECKS=0;
-- Setting FOREIGN_KEY_CHECKS is a VERY bad practice. Do not try at home ( or work ). And always set it back to 1.
-- We only do this here, because this is a mock database.
DROP SCHEMA IF EXISTS `gatete_stock`;
DROP SCHEMA IF EXISTS `gatete_web_store`;
DROP SCHEMA IF EXISTS `gatete_organization`;
SET FOREIGN_KEY_CHECKS=1;

CREATE SCHEMA IF NOT EXISTS `gatete_web_store` DEFAULT CHARACTER SET UTF8MB4 ;
USE `gatete_web_store` ;

CREATE TABLE IF NOT EXISTS `gatete_web_store`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `date_of_birth` DATETIME NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NULL,
  `mobile` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_web_store`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customers_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `gatete_web_store`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE SCHEMA IF NOT EXISTS `gatete_stock` DEFAULT CHARACTER SET UTF8MB4 ;
USE `gatete_stock` ;

CREATE TABLE IF NOT EXISTS `gatete_stock`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_stock`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_products_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `gatete_stock`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_web_store`.`social_media` (
  `customer_id` INT NOT NULL,
  `facebook` VARCHAR(100) NULL,
  `instagram` VARCHAR(100) NULL,
  `google` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_social_media_customers_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_social_media_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `gatete_web_store`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_web_store`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `autonomous_community` VARCHAR(100) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `postal_code` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_addresses_customers_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `gatete_web_store`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_web_store`.`reviews` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `note` INT NOT NULL,
  `comment` VARCHAR(256) NULL,
  `date` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `order_id` INT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `fk_reviews_customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_reviews_products_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_reviews_orders_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `gatete_web_store`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `gatete_stock`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `gatete_web_store`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE SCHEMA IF NOT EXISTS `gatete_organization` DEFAULT CHARACTER SET UTF8MB4 ;
USE `gatete_organization` ;
CREATE TABLE IF NOT EXISTS `gatete_organization`.`warehouses` (
    `warehouse_id` INT NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(100) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `autonomous_community` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `postal_code` INT NOT NULL,
    PRIMARY KEY (`warehouse_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_organization`.`staff` (
    `person_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `office` INT NOT NULL,
    `manager` INT NULL,
    `salary` INT NOT NULL,
    PRIMARY KEY (`person_id`),
  INDEX `fk_staff_offices_idx` (`office` ASC) VISIBLE,
  CONSTRAINT `fk_staff_office`
    FOREIGN KEY (`office`)
    REFERENCES `gatete_organization`.`warehouses` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `gatete_stock` ;

CREATE TABLE IF NOT EXISTS `gatete_stock`.`sizes` (
    `size_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`size_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_stock`.`colors` (
    `color_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`color_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `gatete_stock`.`inventory` (
  `product_id` INT NOT NULL,
  `size_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `warehouse_id` INT NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`,`color_id`,`warehouse_id`),
  INDEX `fk_inventory_products_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_inventory_sizes_idx` (`size_id` ASC) VISIBLE,
  INDEX `fk_inventory_colors_idx` (`color_id` ASC) VISIBLE,
  INDEX `fk_inventory_warehouses_idx` (`warehouse_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `gatete_stock`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_sizes`
    FOREIGN KEY (`size_id`)
    REFERENCES `gatete_stock`.`sizes` (`size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_colors`
    FOREIGN KEY (`color_id`)
    REFERENCES `gatete_stock`.`colors` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_inventory_warehouses`
    FOREIGN KEY (`warehouse_id`)
    REFERENCES `gatete_organization`.`warehouses` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `gatete_web_store` ;
CREATE TABLE IF NOT EXISTS `gatete_web_store`.`order_description` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `size_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unity_price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`,`color_id`,`size_id`),
  INDEX `fk_order_description_products_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_description_orders_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_order_description_colors_idx` (`color_id` ASC) VISIBLE,
  INDEX `fk_order_description_sizes_idx` (`size_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_description_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `gatete_web_store`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_description_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `gatete_stock`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_order_description_colors`
    FOREIGN KEY (`color_id`)
    REFERENCES `gatete_stock`.`colors` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `fk_order_description_sizes`
    FOREIGN KEY (`size_id`)
    REFERENCES `gatete_stock`.`sizes` (`size_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;