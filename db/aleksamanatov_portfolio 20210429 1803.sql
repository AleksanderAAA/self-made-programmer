--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.2.58.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 29.04.2021 18:03:23
-- Версия сервера: 5.6.47
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE aleksamanatov_portfolio;

--
-- Описание для таблицы wp_actionscheduler_actions
--
DROP TABLE IF EXISTS wp_actionscheduler_actions;
CREATE TABLE wp_actionscheduler_actions (
  action_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  hook VARCHAR(191) NOT NULL,
  status VARCHAR(20) NOT NULL,
  scheduled_date_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  scheduled_date_local DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  args VARCHAR(191) DEFAULT NULL,
  schedule LONGTEXT DEFAULT NULL,
  group_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  attempts INT(11) NOT NULL DEFAULT 0,
  last_attempt_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  last_attempt_local DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  claim_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  extended_args VARCHAR(8000) DEFAULT NULL,
  PRIMARY KEY (action_id),
  INDEX args (args),
  INDEX claim_id (claim_id),
  INDEX group_id (group_id),
  INDEX hook (hook),
  INDEX last_attempt_gmt (last_attempt_gmt),
  INDEX scheduled_date_gmt (scheduled_date_gmt),
  INDEX status (status)
)
ENGINE = INNODB
AUTO_INCREMENT = 127
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_actionscheduler_claims
--
DROP TABLE IF EXISTS wp_actionscheduler_claims;
CREATE TABLE wp_actionscheduler_claims (
  claim_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  date_created_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (claim_id),
  INDEX date_created_gmt (date_created_gmt)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_actionscheduler_groups
--
DROP TABLE IF EXISTS wp_actionscheduler_groups;
CREATE TABLE wp_actionscheduler_groups (
  group_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  slug VARCHAR(255) NOT NULL,
  PRIMARY KEY (group_id),
  INDEX slug (slug(191))
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_actionscheduler_logs
--
DROP TABLE IF EXISTS wp_actionscheduler_logs;
CREATE TABLE wp_actionscheduler_logs (
  log_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  action_id BIGINT(20) UNSIGNED NOT NULL,
  message TEXT NOT NULL,
  log_date_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  log_date_local DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (log_id),
  INDEX action_id (action_id),
  INDEX log_date_gmt (log_date_gmt)
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_commentmeta
--
DROP TABLE IF EXISTS wp_commentmeta;
CREATE TABLE wp_commentmeta (
  meta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  comment_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (meta_id),
  INDEX comment_id (comment_id),
  INDEX meta_key (meta_key(191))
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_comments
--
DROP TABLE IF EXISTS wp_comments;
CREATE TABLE wp_comments (
  comment_ID BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  comment_post_ID BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  comment_author TINYTEXT NOT NULL,
  comment_author_email VARCHAR(100) NOT NULL DEFAULT '',
  comment_author_url VARCHAR(200) NOT NULL DEFAULT '',
  comment_author_IP VARCHAR(100) NOT NULL DEFAULT '',
  comment_date DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  comment_date_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  comment_content TEXT NOT NULL,
  comment_karma INT(11) NOT NULL DEFAULT 0,
  comment_approved VARCHAR(20) NOT NULL DEFAULT '1',
  comment_agent VARCHAR(255) NOT NULL DEFAULT '',
  comment_type VARCHAR(20) NOT NULL DEFAULT 'comment',
  comment_parent BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  user_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (comment_ID),
  INDEX comment_approved_date_gmt (comment_approved, comment_date_gmt),
  INDEX comment_author_email (comment_author_email(10)),
  INDEX comment_date_gmt (comment_date_gmt),
  INDEX comment_parent (comment_parent),
  INDEX comment_post_ID (comment_post_ID),
  INDEX woo_idx_comment_type (comment_type)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_links
--
DROP TABLE IF EXISTS wp_links;
CREATE TABLE wp_links (
  link_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  link_url VARCHAR(255) NOT NULL DEFAULT '',
  link_name VARCHAR(255) NOT NULL DEFAULT '',
  link_image VARCHAR(255) NOT NULL DEFAULT '',
  link_target VARCHAR(25) NOT NULL DEFAULT '',
  link_description VARCHAR(255) NOT NULL DEFAULT '',
  link_visible VARCHAR(20) NOT NULL DEFAULT 'Y',
  link_owner BIGINT(20) UNSIGNED NOT NULL DEFAULT 1,
  link_rating INT(11) NOT NULL DEFAULT 0,
  link_updated DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  link_rel VARCHAR(255) NOT NULL DEFAULT '',
  link_notes MEDIUMTEXT NOT NULL,
  link_rss VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (link_id),
  INDEX link_visible (link_visible)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_options
--
DROP TABLE IF EXISTS wp_options;
CREATE TABLE wp_options (
  option_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  option_name VARCHAR(191) NOT NULL DEFAULT '',
  option_value LONGTEXT NOT NULL,
  autoload VARCHAR(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (option_id),
  INDEX autoload (autoload),
  UNIQUE INDEX option_name (option_name)
)
ENGINE = INNODB
AUTO_INCREMENT = 808
AVG_ROW_LENGTH = 9081
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_postmeta
--
DROP TABLE IF EXISTS wp_postmeta;
CREATE TABLE wp_postmeta (
  meta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  post_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (meta_id),
  INDEX meta_key (meta_key(191)),
  INDEX post_id (post_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 918
AVG_ROW_LENGTH = 682
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_posts
--
DROP TABLE IF EXISTS wp_posts;
CREATE TABLE wp_posts (
  ID BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  post_author BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  post_date DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  post_date_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  post_content LONGTEXT NOT NULL,
  post_title TEXT NOT NULL,
  post_excerpt TEXT NOT NULL,
  post_status VARCHAR(20) NOT NULL DEFAULT 'publish',
  comment_status VARCHAR(20) NOT NULL DEFAULT 'open',
  ping_status VARCHAR(20) NOT NULL DEFAULT 'open',
  post_password VARCHAR(255) NOT NULL DEFAULT '',
  post_name VARCHAR(200) NOT NULL DEFAULT '',
  to_ping TEXT NOT NULL,
  pinged TEXT NOT NULL,
  post_modified DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  post_modified_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  post_content_filtered LONGTEXT NOT NULL,
  post_parent BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  guid VARCHAR(255) NOT NULL DEFAULT '',
  menu_order INT(11) NOT NULL DEFAULT 0,
  post_type VARCHAR(20) NOT NULL DEFAULT 'post',
  post_mime_type VARCHAR(100) NOT NULL DEFAULT '',
  comment_count BIGINT(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (ID),
  INDEX post_author (post_author),
  INDEX post_name (post_name(191)),
  INDEX post_parent (post_parent),
  INDEX type_status_date (post_type, post_status, post_date, ID)
)
ENGINE = INNODB
AUTO_INCREMENT = 200
AVG_ROW_LENGTH = 8936
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_term_relationships
--
DROP TABLE IF EXISTS wp_term_relationships;
CREATE TABLE wp_term_relationships (
  object_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  term_taxonomy_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  term_order INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (object_id, term_taxonomy_id),
  INDEX term_taxonomy_id (term_taxonomy_id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_term_taxonomy
--
DROP TABLE IF EXISTS wp_term_taxonomy;
CREATE TABLE wp_term_taxonomy (
  term_taxonomy_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  term_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  taxonomy VARCHAR(32) NOT NULL DEFAULT '',
  description LONGTEXT NOT NULL,
  parent BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  count BIGINT(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (term_taxonomy_id),
  INDEX taxonomy (taxonomy),
  UNIQUE INDEX term_id_taxonomy (term_id, taxonomy)
)
ENGINE = INNODB
AUTO_INCREMENT = 31
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_termmeta
--
DROP TABLE IF EXISTS wp_termmeta;
CREATE TABLE wp_termmeta (
  meta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  term_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (meta_id),
  INDEX meta_key (meta_key(191)),
  INDEX term_id (term_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_terms
--
DROP TABLE IF EXISTS wp_terms;
CREATE TABLE wp_terms (
  term_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL DEFAULT '',
  slug VARCHAR(200) NOT NULL DEFAULT '',
  term_group BIGINT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (term_id),
  INDEX name (name(191)),
  INDEX slug (slug(191))
)
ENGINE = INNODB
AUTO_INCREMENT = 31
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_usermeta
--
DROP TABLE IF EXISTS wp_usermeta;
CREATE TABLE wp_usermeta (
  umeta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (umeta_id),
  INDEX meta_key (meta_key(191)),
  INDEX user_id (user_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 32
AVG_ROW_LENGTH = 910
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_users
--
DROP TABLE IF EXISTS wp_users;
CREATE TABLE wp_users (
  ID BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_login VARCHAR(60) NOT NULL DEFAULT '',
  user_pass VARCHAR(255) NOT NULL DEFAULT '',
  user_nicename VARCHAR(50) NOT NULL DEFAULT '',
  user_email VARCHAR(100) NOT NULL DEFAULT '',
  user_url VARCHAR(100) NOT NULL DEFAULT '',
  user_registered DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  user_activation_key VARCHAR(255) NOT NULL DEFAULT '',
  user_status INT(11) NOT NULL DEFAULT 0,
  display_name VARCHAR(250) NOT NULL DEFAULT '',
  PRIMARY KEY (ID),
  INDEX user_email (user_email),
  INDEX user_login_key (user_login),
  INDEX user_nicename (user_nicename)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_admin_note_actions
--
DROP TABLE IF EXISTS wp_wc_admin_note_actions;
CREATE TABLE wp_wc_admin_note_actions (
  action_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  note_id BIGINT(20) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  label VARCHAR(255) NOT NULL,
  query LONGTEXT NOT NULL,
  status VARCHAR(255) NOT NULL,
  is_primary TINYINT(1) NOT NULL DEFAULT 0,
  actioned_text VARCHAR(255) NOT NULL,
  PRIMARY KEY (action_id),
  INDEX note_id (note_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 34
AVG_ROW_LENGTH = 910
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_admin_notes
--
DROP TABLE IF EXISTS wp_wc_admin_notes;
CREATE TABLE wp_wc_admin_notes (
  note_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(20) NOT NULL,
  locale VARCHAR(20) NOT NULL,
  title LONGTEXT NOT NULL,
  content LONGTEXT NOT NULL,
  content_data LONGTEXT DEFAULT NULL,
  status VARCHAR(200) NOT NULL,
  source VARCHAR(200) NOT NULL,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_reminder DATETIME DEFAULT NULL,
  is_snoozable TINYINT(1) NOT NULL DEFAULT 0,
  layout VARCHAR(20) NOT NULL DEFAULT '',
  image VARCHAR(200) DEFAULT NULL,
  is_deleted TINYINT(1) NOT NULL DEFAULT 0,
  icon VARCHAR(200) NOT NULL DEFAULT 'info',
  PRIMARY KEY (note_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 18
AVG_ROW_LENGTH = 963
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_category_lookup
--
DROP TABLE IF EXISTS wp_wc_category_lookup;
CREATE TABLE wp_wc_category_lookup (
  category_tree_id BIGINT(20) UNSIGNED NOT NULL,
  category_id BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (category_tree_id, category_id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_customer_lookup
--
DROP TABLE IF EXISTS wp_wc_customer_lookup;
CREATE TABLE wp_wc_customer_lookup (
  customer_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id BIGINT(20) UNSIGNED DEFAULT NULL,
  username VARCHAR(60) NOT NULL DEFAULT '',
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(100) DEFAULT NULL,
  date_last_active TIMESTAMP NULL DEFAULT NULL,
  date_registered TIMESTAMP NULL DEFAULT NULL,
  country CHAR(2) NOT NULL DEFAULT '',
  postcode VARCHAR(20) NOT NULL DEFAULT '',
  city VARCHAR(100) NOT NULL DEFAULT '',
  state VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY (customer_id),
  INDEX email (email),
  UNIQUE INDEX user_id (user_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_order_coupon_lookup
--
DROP TABLE IF EXISTS wp_wc_order_coupon_lookup;
CREATE TABLE wp_wc_order_coupon_lookup (
  order_id BIGINT(20) UNSIGNED NOT NULL,
  coupon_id BIGINT(20) NOT NULL,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  discount_amount DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id, coupon_id),
  INDEX coupon_id (coupon_id),
  INDEX date_created (date_created)
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_order_product_lookup
--
DROP TABLE IF EXISTS wp_wc_order_product_lookup;
CREATE TABLE wp_wc_order_product_lookup (
  order_item_id BIGINT(20) UNSIGNED NOT NULL,
  order_id BIGINT(20) UNSIGNED NOT NULL,
  product_id BIGINT(20) UNSIGNED NOT NULL,
  variation_id BIGINT(20) UNSIGNED NOT NULL,
  customer_id BIGINT(20) UNSIGNED DEFAULT NULL,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  product_qty INT(11) NOT NULL,
  product_net_revenue DOUBLE NOT NULL DEFAULT 0,
  product_gross_revenue DOUBLE NOT NULL DEFAULT 0,
  coupon_amount DOUBLE NOT NULL DEFAULT 0,
  tax_amount DOUBLE NOT NULL DEFAULT 0,
  shipping_amount DOUBLE NOT NULL DEFAULT 0,
  shipping_tax_amount DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (order_item_id),
  INDEX customer_id (customer_id),
  INDEX date_created (date_created),
  INDEX order_id (order_id),
  INDEX product_id (product_id)
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_order_stats
--
DROP TABLE IF EXISTS wp_wc_order_stats;
CREATE TABLE wp_wc_order_stats (
  order_id BIGINT(20) UNSIGNED NOT NULL,
  parent_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_created_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  num_items_sold INT(11) NOT NULL DEFAULT 0,
  total_sales DOUBLE NOT NULL DEFAULT 0,
  tax_total DOUBLE NOT NULL DEFAULT 0,
  shipping_total DOUBLE NOT NULL DEFAULT 0,
  net_total DOUBLE NOT NULL DEFAULT 0,
  returning_customer TINYINT(1) DEFAULT NULL,
  status VARCHAR(200) NOT NULL,
  customer_id BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (order_id),
  INDEX customer_id (customer_id),
  INDEX date_created (date_created),
  INDEX status (status(191))
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_order_tax_lookup
--
DROP TABLE IF EXISTS wp_wc_order_tax_lookup;
CREATE TABLE wp_wc_order_tax_lookup (
  order_id BIGINT(20) UNSIGNED NOT NULL,
  tax_rate_id BIGINT(20) UNSIGNED NOT NULL,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  shipping_tax DOUBLE NOT NULL DEFAULT 0,
  order_tax DOUBLE NOT NULL DEFAULT 0,
  total_tax DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id, tax_rate_id),
  INDEX date_created (date_created),
  INDEX tax_rate_id (tax_rate_id)
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_product_meta_lookup
--
DROP TABLE IF EXISTS wp_wc_product_meta_lookup;
CREATE TABLE wp_wc_product_meta_lookup (
  product_id BIGINT(20) NOT NULL,
  sku VARCHAR(100) DEFAULT '',
  virtual TINYINT(1) DEFAULT 0,
  downloadable TINYINT(1) DEFAULT 0,
  min_price DECIMAL(19, 4) DEFAULT NULL,
  max_price DECIMAL(19, 4) DEFAULT NULL,
  onsale TINYINT(1) DEFAULT 0,
  stock_quantity DOUBLE DEFAULT NULL,
  stock_status VARCHAR(100) DEFAULT 'instock',
  rating_count BIGINT(20) DEFAULT 0,
  average_rating DECIMAL(3, 2) DEFAULT 0.00,
  total_sales BIGINT(20) DEFAULT 0,
  tax_status VARCHAR(100) DEFAULT 'taxable',
  tax_class VARCHAR(100) DEFAULT '',
  PRIMARY KEY (product_id),
  INDEX downloadable (downloadable),
  INDEX min_max_price (min_price, max_price),
  INDEX onsale (onsale),
  INDEX stock_quantity (stock_quantity),
  INDEX stock_status (stock_status),
  INDEX virtual (virtual)
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_reserved_stock
--
DROP TABLE IF EXISTS wp_wc_reserved_stock;
CREATE TABLE wp_wc_reserved_stock (
  order_id BIGINT(20) NOT NULL,
  product_id BIGINT(20) NOT NULL,
  stock_quantity DOUBLE NOT NULL DEFAULT 0,
  timestamp DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  expires DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (order_id, product_id)
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_tax_rate_classes
--
DROP TABLE IF EXISTS wp_wc_tax_rate_classes;
CREATE TABLE wp_wc_tax_rate_classes (
  tax_rate_class_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL DEFAULT '',
  slug VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (tax_rate_class_id),
  UNIQUE INDEX slug (slug(191))
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_webhooks
--
DROP TABLE IF EXISTS wp_wc_webhooks;
CREATE TABLE wp_wc_webhooks (
  webhook_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  status VARCHAR(200) NOT NULL,
  name TEXT NOT NULL,
  user_id BIGINT(20) UNSIGNED NOT NULL,
  delivery_url TEXT NOT NULL,
  secret TEXT NOT NULL,
  topic VARCHAR(200) NOT NULL,
  date_created DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_created_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified_gmt DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  api_version SMALLINT(4) NOT NULL,
  failure_count SMALLINT(10) NOT NULL DEFAULT 0,
  pending_delivery TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (webhook_id),
  INDEX user_id (user_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_api_keys
--
DROP TABLE IF EXISTS wp_woocommerce_api_keys;
CREATE TABLE wp_woocommerce_api_keys (
  key_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id BIGINT(20) UNSIGNED NOT NULL,
  description VARCHAR(200) DEFAULT NULL,
  permissions VARCHAR(10) NOT NULL,
  consumer_key CHAR(64) NOT NULL,
  consumer_secret CHAR(43) NOT NULL,
  nonces LONGTEXT DEFAULT NULL,
  truncated_key CHAR(7) NOT NULL,
  last_access DATETIME DEFAULT NULL,
  PRIMARY KEY (key_id),
  INDEX consumer_key (consumer_key),
  INDEX consumer_secret (consumer_secret)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_attribute_taxonomies
--
DROP TABLE IF EXISTS wp_woocommerce_attribute_taxonomies;
CREATE TABLE wp_woocommerce_attribute_taxonomies (
  attribute_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  attribute_name VARCHAR(200) NOT NULL,
  attribute_label VARCHAR(200) DEFAULT NULL,
  attribute_type VARCHAR(20) NOT NULL,
  attribute_orderby VARCHAR(20) NOT NULL,
  attribute_public INT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (attribute_id),
  INDEX attribute_name (attribute_name(20))
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_downloadable_product_permissions
--
DROP TABLE IF EXISTS wp_woocommerce_downloadable_product_permissions;
CREATE TABLE wp_woocommerce_downloadable_product_permissions (
  permission_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  download_id VARCHAR(36) NOT NULL,
  product_id BIGINT(20) UNSIGNED NOT NULL,
  order_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  order_key VARCHAR(200) NOT NULL,
  user_email VARCHAR(200) NOT NULL,
  user_id BIGINT(20) UNSIGNED DEFAULT NULL,
  downloads_remaining VARCHAR(9) DEFAULT NULL,
  access_granted DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  access_expires DATETIME DEFAULT NULL,
  download_count BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (permission_id),
  INDEX download_order_key_product (product_id, order_id, order_key(16), download_id),
  INDEX download_order_product (download_id, order_id, product_id),
  INDEX order_id (order_id),
  INDEX user_order_remaining_expires (user_id, order_id, downloads_remaining, access_expires)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_log
--
DROP TABLE IF EXISTS wp_woocommerce_log;
CREATE TABLE wp_woocommerce_log (
  log_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  timestamp DATETIME NOT NULL,
  level SMALLINT(4) NOT NULL,
  source VARCHAR(200) NOT NULL,
  message LONGTEXT NOT NULL,
  context LONGTEXT DEFAULT NULL,
  PRIMARY KEY (log_id),
  INDEX level (level)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_order_itemmeta
--
DROP TABLE IF EXISTS wp_woocommerce_order_itemmeta;
CREATE TABLE wp_woocommerce_order_itemmeta (
  meta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_item_id BIGINT(20) UNSIGNED NOT NULL,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (meta_id),
  INDEX meta_key (meta_key(32)),
  INDEX order_item_id (order_item_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_order_items
--
DROP TABLE IF EXISTS wp_woocommerce_order_items;
CREATE TABLE wp_woocommerce_order_items (
  order_item_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_item_name TEXT NOT NULL,
  order_item_type VARCHAR(200) NOT NULL DEFAULT '',
  order_id BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (order_item_id),
  INDEX order_id (order_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_payment_tokenmeta
--
DROP TABLE IF EXISTS wp_woocommerce_payment_tokenmeta;
CREATE TABLE wp_woocommerce_payment_tokenmeta (
  meta_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  payment_token_id BIGINT(20) UNSIGNED NOT NULL,
  meta_key VARCHAR(255) DEFAULT NULL,
  meta_value LONGTEXT DEFAULT NULL,
  PRIMARY KEY (meta_id),
  INDEX meta_key (meta_key(32)),
  INDEX payment_token_id (payment_token_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_payment_tokens
--
DROP TABLE IF EXISTS wp_woocommerce_payment_tokens;
CREATE TABLE wp_woocommerce_payment_tokens (
  token_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  gateway_id VARCHAR(200) NOT NULL,
  token TEXT NOT NULL,
  user_id BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  type VARCHAR(200) NOT NULL,
  is_default TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (token_id),
  INDEX user_id (user_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_sessions
--
DROP TABLE IF EXISTS wp_woocommerce_sessions;
CREATE TABLE wp_woocommerce_sessions (
  session_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  session_key CHAR(32) NOT NULL,
  session_value LONGTEXT NOT NULL,
  session_expiry BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (session_id),
  UNIQUE INDEX session_key (session_key)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_shipping_zone_locations
--
DROP TABLE IF EXISTS wp_woocommerce_shipping_zone_locations;
CREATE TABLE wp_woocommerce_shipping_zone_locations (
  location_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  zone_id BIGINT(20) UNSIGNED NOT NULL,
  location_code VARCHAR(200) NOT NULL,
  location_type VARCHAR(40) NOT NULL,
  PRIMARY KEY (location_id),
  INDEX location_id (location_id),
  INDEX location_type_code (location_type(10), location_code(20))
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_shipping_zone_methods
--
DROP TABLE IF EXISTS wp_woocommerce_shipping_zone_methods;
CREATE TABLE wp_woocommerce_shipping_zone_methods (
  zone_id BIGINT(20) UNSIGNED NOT NULL,
  instance_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  method_id VARCHAR(200) NOT NULL,
  method_order BIGINT(20) UNSIGNED NOT NULL,
  is_enabled TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (instance_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_shipping_zones
--
DROP TABLE IF EXISTS wp_woocommerce_shipping_zones;
CREATE TABLE wp_woocommerce_shipping_zones (
  zone_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  zone_name VARCHAR(200) NOT NULL,
  zone_order BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (zone_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_tax_rate_locations
--
DROP TABLE IF EXISTS wp_woocommerce_tax_rate_locations;
CREATE TABLE wp_woocommerce_tax_rate_locations (
  location_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  location_code VARCHAR(200) NOT NULL,
  tax_rate_id BIGINT(20) UNSIGNED NOT NULL,
  location_type VARCHAR(40) NOT NULL,
  PRIMARY KEY (location_id),
  INDEX location_type_code (location_type(10), location_code(20)),
  INDEX tax_rate_id (tax_rate_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_woocommerce_tax_rates
--
DROP TABLE IF EXISTS wp_woocommerce_tax_rates;
CREATE TABLE wp_woocommerce_tax_rates (
  tax_rate_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  tax_rate_country VARCHAR(2) NOT NULL DEFAULT '',
  tax_rate_state VARCHAR(200) NOT NULL DEFAULT '',
  tax_rate VARCHAR(8) NOT NULL DEFAULT '',
  tax_rate_name VARCHAR(200) NOT NULL DEFAULT '',
  tax_rate_priority BIGINT(20) UNSIGNED NOT NULL,
  tax_rate_compound INT(1) NOT NULL DEFAULT 0,
  tax_rate_shipping INT(1) NOT NULL DEFAULT 1,
  tax_rate_order BIGINT(20) UNSIGNED NOT NULL,
  tax_rate_class VARCHAR(200) NOT NULL DEFAULT '',
  PRIMARY KEY (tax_rate_id),
  INDEX tax_rate_class (tax_rate_class(10)),
  INDEX tax_rate_country (tax_rate_country),
  INDEX tax_rate_priority (tax_rate_priority),
  INDEX tax_rate_state (tax_rate_state(2))
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

--
-- Описание для таблицы wp_wc_download_log
--
DROP TABLE IF EXISTS wp_wc_download_log;
CREATE TABLE wp_wc_download_log (
  download_log_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  timestamp DATETIME NOT NULL,
  permission_id BIGINT(20) UNSIGNED NOT NULL,
  user_id BIGINT(20) UNSIGNED DEFAULT NULL,
  user_ip_address VARCHAR(100) DEFAULT '',
  PRIMARY KEY (download_log_id),
  INDEX timestamp (timestamp),
  CONSTRAINT fk_wp_wc_download_log_permission_id FOREIGN KEY (permission_id)
    REFERENCES wp_woocommerce_downloadable_product_permissions(permission_id) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_520_ci;

-- 
-- Вывод данных для таблицы wp_actionscheduler_actions
--
INSERT INTO wp_actionscheduler_actions VALUES
(125, 'action_scheduler/migration_hook', 'complete', '2021-03-31 20:42:30', '2021-03-31 20:42:30', '[]', 'O:30:"ActionScheduler_SimpleSchedule":2:{s:22:"\0*\0scheduled_timestamp";i:1617223350;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1617223350;}', 1, 1, '2021-04-01 10:05:05', '2021-04-01 13:05:05', 0, NULL),
(126, 'action_scheduler/migration_hook', 'complete', '2021-04-01 10:06:06', '2021-04-01 10:06:06', '[]', 'O:30:"ActionScheduler_SimpleSchedule":2:{s:22:"\0*\0scheduled_timestamp";i:1617271566;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1617271566;}', 1, 1, '2021-04-01 11:16:43', '2021-04-01 14:16:43', 0, NULL);

-- 
-- Вывод данных для таблицы wp_actionscheduler_claims
--

-- Таблица aleksamanatov_portfolio.wp_actionscheduler_claims не содержит данных

-- 
-- Вывод данных для таблицы wp_actionscheduler_groups
--
INSERT INTO wp_actionscheduler_groups VALUES
(1, 'action-scheduler-migration');

-- 
-- Вывод данных для таблицы wp_actionscheduler_logs
--
INSERT INTO wp_actionscheduler_logs VALUES
(1, 125, 'действие создано', '2021-03-31 20:41:30', '2021-03-31 20:41:30'),
(2, 125, 'действие началось через WP Cron', '2021-04-01 10:05:04', '2021-04-01 10:05:04'),
(3, 125, 'действие завершено через WP Cron', '2021-04-01 10:05:05', '2021-04-01 10:05:05'),
(4, 126, 'действие создано', '2021-04-01 10:05:06', '2021-04-01 10:05:06'),
(5, 126, 'действие началось через WP Cron', '2021-04-01 11:16:43', '2021-04-01 11:16:43'),
(6, 126, 'действие завершено через WP Cron', '2021-04-01 11:16:43', '2021-04-01 11:16:43');

-- 
-- Вывод данных для таблицы wp_commentmeta
--

-- Таблица aleksamanatov_portfolio.wp_commentmeta не содержит данных

-- 
-- Вывод данных для таблицы wp_comments
--
INSERT INTO wp_comments VALUES
(1, 1, 'Автор комментария', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-03-21 22:32:36', '2021-03-21 19:32:36', 'Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href="https://ru.gravatar.com">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- 
-- Вывод данных для таблицы wp_links
--

-- Таблица aleksamanatov_portfolio.wp_links не содержит данных

-- 
-- Вывод данных для таблицы wp_options
--
INSERT INTO wp_options VALUES
(1, 'siteurl', 'http://self-made-programmer.loc', 'yes'),
(2, 'home', 'http://self-made-programmer.loc', 'yes'),
(3, 'blogname', 'Моё портфолио', 'yes'),
(4, 'blogdescription', 'Сайт сделан на WordPress для целей обучения', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@self-made-programmer.loc', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'd.m.Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd.m.Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%category%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:133:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:17:"^wp-sitemap\\.xml$";s:23:"index.php?sitemap=index";s:17:"^wp-sitemap\\.xsl$";s:36:"index.php?sitemap-stylesheet=sitemap";s:23:"^wp-sitemap-index\\.xsl$";s:34:"index.php?sitemap-stylesheet=index";s:48:"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$";s:75:"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]";s:34:"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$";s:47:"index.php?sitemap=$matches[1]&paged=$matches[2]";s:8:"event/?$";s:25:"index.php?post_type=event";s:38:"event/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:33:"event/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?post_type=event&feed=$matches[1]";s:25:"event/page/([0-9]{1,})/?$";s:43:"index.php?post_type=event&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:33:"event/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"event/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"event/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:22:"event/([^/]+)/embed/?$";s:38:"index.php?event=$matches[1]&embed=true";s:26:"event/([^/]+)/trackback/?$";s:32:"index.php?event=$matches[1]&tb=1";s:46:"event/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:41:"event/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?event=$matches[1]&feed=$matches[2]";s:34:"event/([^/]+)/page/?([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&paged=$matches[2]";s:41:"event/([^/]+)/comment-page-([0-9]{1,})/?$";s:45:"index.php?event=$matches[1]&cpage=$matches[2]";s:30:"event/([^/]+)(?:/([0-9]+))?/?$";s:44:"index.php?event=$matches[1]&page=$matches[2]";s:22:"event/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"event/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:52:"event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"event/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"topics/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?topics=$matches[1]&feed=$matches[2]";s:42:"topics/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?topics=$matches[1]&feed=$matches[2]";s:23:"topics/([^/]+)/embed/?$";s:39:"index.php?topics=$matches[1]&embed=true";s:35:"topics/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?topics=$matches[1]&paged=$matches[2]";s:17:"topics/([^/]+)/?$";s:28:"index.php?topics=$matches[1]";s:49:"hashtags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?hashtags=$matches[1]&feed=$matches[2]";s:44:"hashtags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?hashtags=$matches[1]&feed=$matches[2]";s:25:"hashtags/([^/]+)/embed/?$";s:41:"index.php?hashtags=$matches[1]&embed=true";s:37:"hashtags/([^/]+)/page/?([0-9]{1,})/?$";s:48:"index.php?hashtags=$matches[1]&paged=$matches[2]";s:19:"hashtags/([^/]+)/?$";s:30:"index.php?hashtags=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:13:"favicon\\.ico$";s:19:"index.php?favicon=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=2&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:31:".+?/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:".+?/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:".+?/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:".+?/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:".+?/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:22:"(.+?)/([^/]+)/embed/?$";s:63:"index.php?category_name=$matches[1]&name=$matches[2]&embed=true";s:26:"(.+?)/([^/]+)/trackback/?$";s:57:"index.php?category_name=$matches[1]&name=$matches[2]&tb=1";s:46:"(.+?)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:41:"(.+?)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&feed=$matches[3]";s:34:"(.+?)/([^/]+)/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&paged=$matches[3]";s:41:"(.+?)/([^/]+)/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&name=$matches[2]&cpage=$matches[3]";s:30:"(.+?)/([^/]+)(?:/([0-9]+))?/?$";s:69:"index.php?category_name=$matches[1]&name=$matches[2]&page=$matches[3]";s:20:".+?/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:".+?/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:".+?/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:".+?/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:".+?/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:14:"(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:8:"(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:5:{i:0;s:31:"query-monitor/query-monitor.php";i:1;s:30:"advanced-custom-fields/acf.php";i:2;s:55:"art-frontend-create-posts/art-frontend-create-posts.php";i:3;s:36:"contact-form-7/wp-contact-form-7.php";i:4;s:22:"cyr2lat/cyr-to-lat.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:81:"D:\\OSPanel\\domains\\self-made-programmer.loc/wp-content/themes/academics/style.css";i:2;s:0:"";}', 'no'),
(40, 'template', 'academics', 'yes'),
(41, 'stylesheet', 'academics', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '2', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '169', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1631907155', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'initial_db_version', '49752', 'yes'),
(99, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:114:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"edit_theme_options";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(100, 'fresh_site', '0', 'yes'),
(101, 'WPLANG', 'ru_RU', 'yes'),
(102, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'sidebars_widgets', 'a:2:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(108, 'cron', 'a:9:{i:1619696489;a:1:{s:33:"wc_admin_process_orders_milestone";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1619696504;a:1:{s:29:"wc_admin_unsnooze_admin_notes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1619700053;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1619724757;a:5:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:18:"wp_https_detection";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1619724776;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1619724777;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1619728890;a:1:{s:14:"wc_admin_daily";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1620070357;a:1:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}s:7:"version";i:2;}', 'yes'),
(109, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(115, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(117, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(119, 'recovery_keys', 'a:0:{}', 'yes'),
(120, 'theme_mods_twentytwentyone', 'a:8:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1619177498;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}}}s:18:"nav_menu_locations";a:0:{}s:16:"background_image";s:79:"http://self-made-programmer.loc/wp-content/uploads/2021/03/konsol_wordpress.jpg";s:17:"background_preset";s:4:"fill";s:15:"background_size";s:5:"cover";s:17:"background_repeat";s:9:"no-repeat";s:21:"background_attachment";s:5:"fixed";}', 'yes'),
(121, 'https_detection_errors', 'a:1:{s:23:"ssl_verification_failed";a:1:{i:0;s:38:"Проверка SSL неудачна.";}}', 'yes'),
(142, 'can_compress_scripts', '1', 'no'),
(151, 'recently_activated', 'a:0:{}', 'yes'),
(156, 'finished_updating_comment_type', '1', 'yes'),
(163, 'acf_version', '5.9.5', 'yes'),
(164, 'theme_mods_twentytwenty', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(169, 'current_theme', 'Academics SelfMade', 'yes'),
(170, 'theme_mods_oceanwp', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1616331398;s:4:"data";a:8:{s:19:"wp_inactive_widgets";a:0:{}s:7:"sidebar";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:14:"search_sidebar";a:0:{}s:10:"footer-one";a:0:{}s:10:"footer-two";a:0:{}s:12:"footer-three";a:0:{}s:11:"footer-four";a:0:{}}}}', 'yes'),
(171, 'theme_switched', '', 'yes'),
(173, 'theme_mods_astra', 'a:4:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1616331626;s:4:"data";a:9:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:13:"header-widget";a:0:{}s:15:"footer-widget-1";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:15:"footer-widget-2";a:0:{}s:24:"advanced-footer-widget-1";a:0:{}s:24:"advanced-footer-widget-2";a:0:{}s:24:"advanced-footer-widget-3";a:0:{}s:24:"advanced-footer-widget-4";a:0:{}}}}', 'yes'),
(175, 'astra-settings', 'a:3:{s:18:"theme-auto-version";s:5:"3.2.0";s:22:"is_theme_queue_running";b:0;s:33:"_astra_pb_compatibility_completed";b:1;}', 'yes'),
(180, 'theme_mods_academics', 'a:5:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:11:"header_menu";i:29;s:11:"social_menu";i:30;}s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1619411079;s:4:"data";a:1:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}s:11:"custom_logo";i:165;}', 'yes'),
(182, 'theme_mods_childhood', 'a:5:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:11:"custom_logo";i:17;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1619411075;s:4:"data";a:1:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(186, '_transient_health-check-site-status-result', '{"good":"12","recommended":"6","critical":"2"}', 'yes'),
(249, 'new_admin_email', 'admin@self-made-programmer.loc', 'yes'),
(272, 'https_migration_required', '1', 'yes'),
(277, 'wpcf7', 'a:2:{s:7:"version";s:3:"5.4";s:13:"bulk_validate";a:4:{s:9:"timestamp";i:1617087736;s:7:"version";s:3:"5.4";s:11:"count_valid";i:1;s:13:"count_invalid";i:0;}}', 'yes'),
(283, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:1:{i:0;i:5;}}', 'yes'),
(286, 'recovery_mode_email_last_sent', '1617108144', 'yes'),
(338, 'action_scheduler_hybrid_store_demarkation', '124', 'yes'),
(339, 'schema-ActionScheduler_StoreSchema', '3.0.1617223273', 'yes'),
(340, 'schema-ActionScheduler_LoggerSchema', '2.0.1617223274', 'yes'),
(343, 'woocommerce_schema_version', '430', 'yes'),
(344, 'woocommerce_store_address', '', 'yes'),
(345, 'woocommerce_store_address_2', '', 'yes'),
(346, 'woocommerce_store_city', '', 'yes'),
(347, 'woocommerce_default_country', 'GB', 'yes'),
(348, 'woocommerce_store_postcode', '', 'yes'),
(349, 'woocommerce_allowed_countries', 'all', 'yes'),
(350, 'woocommerce_all_except_countries', '', 'yes'),
(351, 'woocommerce_specific_allowed_countries', '', 'yes'),
(352, 'woocommerce_ship_to_countries', '', 'yes'),
(353, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(354, 'woocommerce_default_customer_address', 'base', 'yes'),
(355, 'woocommerce_calc_taxes', 'no', 'yes'),
(356, 'woocommerce_enable_coupons', 'yes', 'yes'),
(357, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(358, 'woocommerce_currency', 'GBP', 'yes'),
(359, 'woocommerce_currency_pos', 'left', 'yes'),
(360, 'woocommerce_price_thousand_sep', ',', 'yes'),
(361, 'woocommerce_price_decimal_sep', '.', 'yes'),
(362, 'woocommerce_price_num_decimals', '2', 'yes'),
(363, 'woocommerce_shop_page_id', '125', 'yes'),
(364, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(365, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(366, 'woocommerce_placeholder_image', '124', 'yes'),
(367, 'woocommerce_weight_unit', 'kg', 'yes'),
(368, 'woocommerce_dimension_unit', 'cm', 'yes'),
(369, 'woocommerce_enable_reviews', 'yes', 'yes'),
(370, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(371, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(372, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(373, 'woocommerce_review_rating_required', 'yes', 'no'),
(374, 'woocommerce_manage_stock', 'yes', 'yes'),
(375, 'woocommerce_hold_stock_minutes', '60', 'no'),
(376, 'woocommerce_notify_low_stock', 'yes', 'no'),
(377, 'woocommerce_notify_no_stock', 'yes', 'no'),
(378, 'woocommerce_stock_email_recipient', 'admin@portfolio.loc', 'no'),
(379, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(380, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(381, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(382, 'woocommerce_stock_format', '', 'yes'),
(383, 'woocommerce_file_download_method', 'force', 'no'),
(384, 'woocommerce_downloads_require_login', 'no', 'no'),
(385, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(386, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(387, 'woocommerce_prices_include_tax', 'no', 'yes'),
(388, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(389, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(390, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(391, 'woocommerce_tax_classes', '', 'yes'),
(392, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(393, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(394, 'woocommerce_price_display_suffix', '', 'yes'),
(395, 'woocommerce_tax_total_display', 'itemized', 'no'),
(396, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(397, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(398, 'woocommerce_ship_to_destination', 'billing', 'no'),
(399, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(400, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(401, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(402, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(403, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(404, 'woocommerce_registration_generate_username', 'yes', 'no'),
(405, 'woocommerce_registration_generate_password', 'yes', 'no'),
(406, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(407, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(408, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(409, 'woocommerce_registration_privacy_policy_text', 'Ваши личные данные будут использоваться для упрощения вашей работы с сайтом, управления доступом к вашей учётной записи и для других целей, описанных в нашей [privacy_policy].', 'yes'),
(410, 'woocommerce_checkout_privacy_policy_text', 'Ваши личные данные будут использоваться для обработки ваших заказов, упрощения вашей работы с сайтом и для других целей, описанных в нашей [privacy_policy].', 'yes'),
(411, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(412, 'woocommerce_trash_pending_orders', '', 'no'),
(413, 'woocommerce_trash_failed_orders', '', 'no'),
(414, 'woocommerce_trash_cancelled_orders', '', 'no'),
(415, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(416, 'woocommerce_email_from_name', 'Моё портфолио', 'no'),
(417, 'woocommerce_email_from_address', 'admin@portfolio.loc', 'no'),
(418, 'woocommerce_email_header_image', '', 'no'),
(419, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(420, 'woocommerce_email_base_color', '#96588a', 'no'),
(421, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(422, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(423, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(424, 'woocommerce_merchant_email_notifications', 'no', 'no'),
(425, 'woocommerce_cart_page_id', '127', 'no'),
(426, 'woocommerce_checkout_page_id', '129', 'no'),
(427, 'woocommerce_myaccount_page_id', '131', 'no'),
(428, 'woocommerce_terms_page_id', '', 'no'),
(429, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(430, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(431, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(432, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(433, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(434, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(435, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(436, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(437, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(438, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(439, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(440, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(441, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(442, 'woocommerce_api_enabled', 'no', 'yes'),
(443, 'woocommerce_allow_tracking', 'no', 'no'),
(444, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(445, 'woocommerce_single_image_width', '600', 'yes'),
(446, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(447, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(448, 'woocommerce_demo_store', 'no', 'no'),
(449, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(450, 'woocommerce_permalinks', 'a:5:{s:12:"product_base";s:7:"product";s:13:"category_base";s:16:"product-category";s:8:"tag_base";s:11:"product-tag";s:14:"attribute_base";s:0:"";s:22:"use_verbose_page_rules";b:0;}', 'yes'),
(451, 'current_theme_supports_woocommerce', 'no', 'yes'),
(452, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(453, 'product_cat_children', 'a:0:{}', 'yes'),
(454, 'default_product_cat', '19', 'yes'),
(455, '_transient_product_query-transient-version', '1617223286', 'yes'),
(458, 'woocommerce_version', '5.1.0', 'yes'),
(459, 'woocommerce_db_version', '5.1.0', 'yes'),
(463, '_transient_jetpack_autoloader_plugin_paths', 'a:0:{}', 'yes'),
(464, 'action_scheduler_lock_async-request-runner', '1617276219', 'yes'),
(465, 'woocommerce_admin_notices', 'a:0:{}', 'yes'),
(466, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:"database_prefix";s:32:"ARnzKmiBLfcgoaFh3mDZFPRqgDKNzI7j";}', 'yes'),
(467, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(468, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(469, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(470, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(471, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(472, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(473, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(474, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(475, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(476, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(477, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(478, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(479, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(482, 'woocommerce_admin_version', '2.0.2', 'yes'),
(483, 'woocommerce_admin_install_timestamp', '1617223290', 'yes'),
(487, '_transient_wc_count_comments', 'O:8:"stdClass":7:{s:14:"total_comments";i:1;s:3:"all";i:1;s:8:"approved";s:1:"1";s:9:"moderated";i:0;s:4:"spam";i:0;s:5:"trash";i:0;s:12:"post-trashed";i:0;}', 'yes'),
(488, 'wc_blocks_db_schema_version', '260', 'yes'),
(489, 'wc_remote_inbox_notifications_stored_state', 'O:8:"stdClass":2:{s:22:"there_were_no_products";b:1;s:22:"there_are_now_products";b:0;}', 'yes'),
(490, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(492, 'wc_remote_inbox_notifications_specs', 'a:14:{s:23:"facebook_pixel_api_2021";O:8:"stdClass":8:{s:4:"slug";s:23:"facebook_pixel_api_2021";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:44:"Improve the performance of your Facebook ads";s:7:"content";s:168:"Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved performance and measurement of your Facebook ad campaigns.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:30:"upgrade_now_facebook_pixel_api";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:11:"Upgrade now";}}s:3:"url";s:67:"plugin-install.php?tab=plugin-information&plugin=&section=changelog";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:3:{i:0;O:8:"stdClass":2:{s:4:"type";s:18:"publish_after_time";s:13:"publish_after";s:19:"2021-02-15 00:00:00";}i:1;O:8:"stdClass":2:{s:4:"type";s:19:"publish_before_time";s:14:"publish_before";s:19:"2021-02-29 00:00:00";}i:2;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:24:"facebook-for-woocommerce";s:7:"version";s:5:"2.1.4";s:8:"operator";s:2:"<=";}}}s:16:"facebook_ec_2021";O:8:"stdClass":8:{s:4:"slug";s:16:"facebook_ec_2021";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:59:"Sync your product catalog with Facebook to help boost sales";s:7:"content";s:170:"A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:22:"learn_more_facebook_ec";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:42:"https://woocommerce.com/products/facebook/";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:10:"unactioned";}}s:5:"rules";a:3:{i:0;O:8:"stdClass":2:{s:4:"type";s:18:"publish_after_time";s:13:"publish_after";s:19:"2021-03-01 00:00:00";}i:1;O:8:"stdClass":2:{s:4:"type";s:19:"publish_before_time";s:14:"publish_before";s:19:"2021-03-15 00:00:00";}i:2;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:1:{i:0;s:24:"facebook-for-woocommerce";}}}}s:37:"ecomm-need-help-setting-up-your-store";O:8:"stdClass":8:{s:4:"slug";s:37:"ecomm-need-help-setting-up-your-store";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:32:"Need help setting up your Store?";s:7:"content";s:350:"Schedule a free 30-min <a href="https://wordpress.com/support/concierge-support/">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:16:"set-up-concierge";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:21:"Schedule free session";}}s:3:"url";s:34:"https://wordpress.com/me/concierge";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:1:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:3:{i:0;s:35:"woocommerce-shipping-australia-post";i:1;s:32:"woocommerce-shipping-canada-post";i:2;s:30:"woocommerce-shipping-royalmail";}}}}s:20:"woocommerce-services";O:8:"stdClass":8:{s:4:"slug";s:20:"woocommerce-services";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:26:"WooCommerce Shipping & Tax";s:7:"content";s:255:"WooCommerce Shipping & Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:10:"learn-more";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:84:"https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:10:"unactioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:1:{i:0;s:20:"woocommerce-services";}}i:1;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:"<";s:4:"days";i:2;}}}s:32:"ecomm-unique-shopping-experience";O:8:"stdClass":8:{s:4:"slug";s:32:"ecomm-unique-shopping-experience";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:53:"For a shopping experience as unique as your customers";s:7:"content";s:274:"Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:43:"learn-more-ecomm-unique-shopping-experience";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:71:"https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:3:{i:0;s:35:"woocommerce-shipping-australia-post";i:1;s:32:"woocommerce-shipping-canada-post";i:2;s:30:"woocommerce-shipping-royalmail";}}i:1;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:"<";s:4:"days";i:2;}}}s:37:"wc-admin-getting-started-in-ecommerce";O:8:"stdClass":8:{s:4:"slug";s:37:"wc-admin-getting-started-in-ecommerce";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:38:"Getting Started in eCommerce - webinar";s:7:"content";s:174:"We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:17:"watch-the-webinar";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:17:"Watch the webinar";}}s:3:"url";s:28:"https://youtu.be/V_2XtCOyZ7o";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":4:{s:4:"type";s:18:"onboarding_profile";s:5:"index";s:12:"setup_client";s:9:"operation";s:2:"!=";s:5:"value";b:1;}i:1;O:8:"stdClass":2:{s:4:"type";s:2:"or";s:8:"operands";a:3:{i:0;O:8:"stdClass":4:{s:4:"type";s:18:"onboarding_profile";s:5:"index";s:13:"product_count";s:9:"operation";s:1:"=";s:5:"value";s:1:"0";}i:1;O:8:"stdClass":4:{s:4:"type";s:18:"onboarding_profile";s:5:"index";s:7:"revenue";s:9:"operation";s:1:"=";s:5:"value";s:4:"none";}i:2;O:8:"stdClass":4:{s:4:"type";s:18:"onboarding_profile";s:5:"index";s:7:"revenue";s:9:"operation";s:1:"=";s:5:"value";s:10:"up-to-2500";}}}}}s:18:"your-first-product";O:8:"stdClass":8:{s:4:"slug";s:18:"your-first-product";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:18:"Your first product";s:7:"content";s:461:"That''s huge! You''re well on your way to building a successful online store — now it’s time to think about how you''ll fulfill your orders.<br/><br/>Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href="https://href.li/?https://woocommerce.com/shipping" target="_blank">WooCommerce Shipping</a>.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:10:"learn-more";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:82:"https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:4:{i:0;O:8:"stdClass":4:{s:4:"type";s:12:"stored_state";s:5:"index";s:22:"there_were_no_products";s:9:"operation";s:1:"=";s:5:"value";b:1;}i:1;O:8:"stdClass":4:{s:4:"type";s:12:"stored_state";s:5:"index";s:22:"there_are_now_products";s:9:"operation";s:1:"=";s:5:"value";b:1;}i:2;O:8:"stdClass":3:{s:4:"type";s:13:"product_count";s:9:"operation";s:2:">=";s:5:"value";i:1;}i:3;O:8:"stdClass":5:{s:4:"type";s:18:"onboarding_profile";s:5:"index";s:13:"product_types";s:9:"operation";s:8:"contains";s:5:"value";s:8:"physical";s:7:"default";a:0:{}}}}s:31:"wc-square-apple-pay-boost-sales";O:8:"stdClass":8:{s:4:"slug";s:31:"wc-square-apple-pay-boost-sales";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:26:"Boost sales with Apple Pay";s:7:"content";s:191:"Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:27:"boost-sales-marketing-guide";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:19:"See marketing guide";}}s:3:"url";s:97:"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:9:{i:0;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:11:"woocommerce";s:8:"operator";s:2:">=";s:7:"version";s:3:"4.8";}i:1;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:18:"woocommerce-square";s:8:"operator";s:2:">=";s:7:"version";s:3:"2.3";}i:2;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:27:"wc_square_apple_pay_enabled";s:5:"value";i:1;s:7:"default";b:0;s:9:"operation";s:1:"=";}i:3;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:38:"wc-square-apple-pay-grow-your-business";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:4;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:38:"wc-square-apple-pay-grow-your-business";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}i:5;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:6;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}i:7;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:8;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}}}s:38:"wc-square-apple-pay-grow-your-business";O:8:"stdClass":8:{s:4:"slug";s:38:"wc-square-apple-pay-grow-your-business";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:45:"Grow your business with Square and Apple Pay ";s:7:"content";s:178:"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:34:"grow-your-business-marketing-guide";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:19:"See marketing guide";}}s:3:"url";s:104:"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:9:{i:0;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:11:"woocommerce";s:8:"operator";s:2:">=";s:7:"version";s:3:"4.8";}i:1;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:18:"woocommerce-square";s:8:"operator";s:2:">=";s:7:"version";s:3:"2.3";}i:2;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:27:"wc_square_apple_pay_enabled";s:5:"value";i:2;s:7:"default";b:0;s:9:"operation";s:1:"=";}i:3;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:31:"wc-square-apple-pay-boost-sales";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:4;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:31:"wc-square-apple-pay-boost-sales";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}i:5;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:6;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}i:7;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:8;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}}}s:32:"wcpay-apple-pay-is-now-available";O:8:"stdClass":8:{s:4:"slug";s:32:"wcpay-apple-pay-is-now-available";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:53:"Apple Pay is now available with WooCommerce Payments!";s:7:"content";s:397:"Increase your conversion rate by offering a fast and secure checkout with <a href="https://woocommerce.com/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay" target="_blank">Apple Pay</a>®. It’s free to get started with <a href="https://woocommerce.com/payments/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay" target="_blank">WooCommerce Payments</a>.";}}s:7:"actions";a:2:{i:0;O:8:"stdClass":6:{s:4:"name";s:13:"add-apple-pay";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:13:"Add Apple Pay";}}s:3:"url";s:69:"/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}i:1;O:8:"stdClass":6:{s:4:"name";s:10:"learn-more";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:121:"https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:4:{i:0;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:11:"woocommerce";s:8:"operator";s:2:">=";s:7:"version";s:3:"4.8";}i:1;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:20:"woocommerce-payments";s:8:"operator";s:2:">=";s:7:"version";s:5:"2.2.0";}i:2;O:8:"stdClass":3:{s:4:"type";s:21:"base_location_country";s:5:"value";s:2:"US";s:9:"operation";s:1:"=";}i:3;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:26:"wcpay_is_apple_pay_enabled";s:5:"value";b:0;s:7:"default";b:0;s:9:"operation";s:1:"=";}}}s:27:"wcpay-apple-pay-boost-sales";O:8:"stdClass":8:{s:4:"slug";s:27:"wcpay-apple-pay-boost-sales";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:26:"Boost sales with Apple Pay";s:7:"content";s:205:"Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:27:"boost-sales-marketing-guide";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:19:"See marketing guide";}}s:3:"url";s:96:"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:4:{i:0;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:11:"woocommerce";s:8:"operator";s:2:">=";s:7:"version";s:3:"4.8";}i:1;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:26:"wcpay_is_apple_pay_enabled";s:5:"value";i:1;s:7:"default";b:0;s:9:"operation";s:1:"=";}i:2;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:3;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:34:"wcpay-apple-pay-grow-your-business";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}}}s:34:"wcpay-apple-pay-grow-your-business";O:8:"stdClass":8:{s:4:"slug";s:34:"wcpay-apple-pay-grow-your-business";s:4:"type";s:9:"marketing";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:58:"Grow your business with WooCommerce Payments and Apple Pay";s:7:"content";s:178:"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:34:"grow-your-business-marketing-guide";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:19:"See marketing guide";}}s:3:"url";s:103:"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:4:{i:0;O:8:"stdClass":4:{s:4:"type";s:14:"plugin_version";s:6:"plugin";s:11:"woocommerce";s:8:"operator";s:2:">=";s:7:"version";s:3:"4.8";}i:1;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:26:"wcpay_is_apple_pay_enabled";s:5:"value";i:2;s:7:"default";b:0;s:9:"operation";s:1:"=";}i:2;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:8:"actioned";s:9:"operation";s:2:"!=";}i:3;O:8:"stdClass":4:{s:4:"type";s:11:"note_status";s:9:"note_name";s:27:"wcpay-apple-pay-boost-sales";s:6:"status";s:10:"unactioned";s:9:"operation";s:2:"!=";}}}s:37:"wc-admin-optimizing-the-checkout-flow";O:8:"stdClass":8:{s:4:"slug";s:37:"wc-admin-optimizing-the-checkout-flow";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:28:"Optimizing the checkout flow";s:7:"content";s:171:"It''s crucial to get your store''s checkout as smooth as possible to avoid losing sales. Let''s take a look at how you can optimize the checkout experience for your shoppers.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:28:"optimizing-the-checkout-flow";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:78:"https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:">";s:4:"days";i:3;}i:1;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:45:"woocommerce_task_list_tracked_completed_tasks";s:9:"operation";s:8:"contains";s:5:"value";s:8:"payments";s:7:"default";a:0:{}}}}s:39:"wc-admin-first-five-things-to-customize";O:8:"stdClass":8:{s:4:"slug";s:39:"wc-admin-first-five-things-to-customize";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:45:"The first 5 things to customize in your store";s:7:"content";s:173:"Deciding what to start with first is tricky. To help you properly prioritize, we''ve put together this short list of the first few things you should customize in WooCommerce.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:10:"learn-more";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:82:"https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:10:"unactioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:">";s:4:"days";i:2;}i:1;O:8:"stdClass":5:{s:4:"type";s:6:"option";s:11:"option_name";s:45:"woocommerce_task_list_tracked_completed_tasks";s:5:"value";s:9:"NOT EMPTY";s:7:"default";s:9:"NOT EMPTY";s:9:"operation";s:2:"!=";}}}}', 'yes'),
(497, '_transient_woocommerce_reports-transient-version', '1617223302', 'yes'),
(535, 'topics_children', 'a:0:{}', 'yes'),
(549, 'hashtags_children', 'a:0:{}', 'yes'),
(575, 'category_children', 'a:0:{}', 'yes'),
(643, '_site_transient_timeout_php_check_787617df3522cd9d9182823c87ee367d', '1619726574', 'no'),
(644, '_site_transient_php_check_787617df3522cd9d9182823c87ee367d', 'a:5:{s:19:"recommended_version";s:3:"7.4";s:15:"minimum_version";s:6:"5.6.20";s:12:"is_supported";b:1;s:9:"is_secure";b:1;s:13:"is_acceptable";b:1;}', 'no'),
(646, 'core_updater.lock', '1619121803', 'no'),
(649, '_site_transient_timeout_browser_f71f9bb2feb2e8e16a9587e3d8fb809a', '1619727015', 'no'),
(650, '_site_transient_browser_f71f9bb2feb2e8e16a9587e3d8fb809a', 'a:10:{s:4:"name";s:5:"Opera";s:7:"version";s:13:"75.0.3969.171";s:8:"platform";s:7:"Windows";s:10:"update_url";s:22:"https://www.opera.com/";s:7:"img_src";s:42:"http://s.w.org/images/browsers/opera.png?1";s:11:"img_src_ssl";s:43:"https://s.w.org/images/browsers/opera.png?1";s:15:"current_version";s:5:"12.18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(667, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-5.7.1.zip";s:6:"locale";s:5:"ru_RU";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/ru_RU/wordpress-5.7.1.zip";s:10:"no_content";s:0:"";s:11:"new_bundled";s:0:"";s:7:"partial";s:0:"";s:8:"rollback";s:0:"";}s:7:"current";s:5:"5.7.1";s:7:"version";s:5:"5.7.1";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.6";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1619681570;s:15:"version_checked";s:5:"5.7.1";s:12:"translations";a:0:{}}', 'no'),
(668, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1619681571;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:5:{s:30:"advanced-custom-fields/acf.php";O:8:"stdClass":9:{s:2:"id";s:36:"w.org/plugins/advanced-custom-fields";s:4:"slug";s:22:"advanced-custom-fields";s:6:"plugin";s:30:"advanced-custom-fields/acf.php";s:11:"new_version";s:5:"5.9.5";s:3:"url";s:53:"https://wordpress.org/plugins/advanced-custom-fields/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.9.5.zip";s:5:"icons";a:2:{s:2:"2x";s:75:"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746";s:2:"1x";s:75:"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746";}s:7:"banners";a:2:{s:2:"2x";s:78:"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099";s:2:"1x";s:77:"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102";}s:11:"banners_rtl";a:0:{}}s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.1.9";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.1.9.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":9:{s:2:"id";s:28:"w.org/plugins/contact-form-7";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:3:"5.4";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/contact-form-7.5.4.zip";s:5:"icons";a:3:{s:2:"2x";s:67:"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696";s:2:"1x";s:59:"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255";s:3:"svg";s:59:"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901";s:2:"1x";s:68:"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427";}s:11:"banners_rtl";a:0:{}}s:22:"cyr2lat/cyr-to-lat.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/cyr2lat";s:4:"slug";s:7:"cyr2lat";s:6:"plugin";s:22:"cyr2lat/cyr-to-lat.php";s:11:"new_version";s:5:"5.0.4";s:3:"url";s:38:"https://wordpress.org/plugins/cyr2lat/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/cyr2lat.5.0.4.zip";s:5:"icons";a:3:{s:2:"2x";s:60:"https://ps.w.org/cyr2lat/assets/icon-256x256.jpg?rev=2434252";s:2:"1x";s:52:"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2498806";s:3:"svg";s:52:"https://ps.w.org/cyr2lat/assets/icon.svg?rev=2498806";}s:7:"banners";a:2:{s:2:"2x";s:63:"https://ps.w.org/cyr2lat/assets/banner-1544x500.png?rev=2434252";s:2:"1x";s:62:"https://ps.w.org/cyr2lat/assets/banner-772x250.png?rev=2434252";}s:11:"banners_rtl";a:0:{}}s:31:"query-monitor/query-monitor.php";O:8:"stdClass":9:{s:2:"id";s:27:"w.org/plugins/query-monitor";s:4:"slug";s:13:"query-monitor";s:6:"plugin";s:31:"query-monitor/query-monitor.php";s:11:"new_version";s:5:"3.6.7";s:3:"url";s:44:"https://wordpress.org/plugins/query-monitor/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/query-monitor.3.6.7.zip";s:5:"icons";a:3:{s:2:"2x";s:66:"https://ps.w.org/query-monitor/assets/icon-256x256.png?rev=2301273";s:2:"1x";s:58:"https://ps.w.org/query-monitor/assets/icon.svg?rev=2056073";s:3:"svg";s:58:"https://ps.w.org/query-monitor/assets/icon.svg?rev=2056073";}s:7:"banners";a:2:{s:2:"2x";s:69:"https://ps.w.org/query-monitor/assets/banner-1544x500.png?rev=2457098";s:2:"1x";s:68:"https://ps.w.org/query-monitor/assets/banner-772x250.png?rev=2457098";}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(761, '_site_transient_timeout_browser_e10a96f0aba50379a554d3ba05d09e5c', '1620163817', 'no'),
(762, '_site_transient_browser_e10a96f0aba50379a554d3ba05d09e5c', 'a:10:{s:4:"name";s:5:"Opera";s:7:"version";s:13:"75.0.3969.218";s:8:"platform";s:7:"Windows";s:10:"update_url";s:22:"https://www.opera.com/";s:7:"img_src";s:42:"http://s.w.org/images/browsers/opera.png?1";s:11:"img_src_ssl";s:43:"https://s.w.org/images/browsers/opera.png?1";s:15:"current_version";s:5:"12.18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(775, '_site_transient_update_themes', 'O:8:"stdClass":5:{s:12:"last_checked";i:1619679068;s:7:"checked";a:7:{s:9:"academics";s:3:"0.1";s:5:"astra";s:5:"3.3.3";s:9:"childhood";s:3:"1.7";s:7:"oceanwp";s:5:"2.0.8";s:14:"twentynineteen";s:3:"2.0";s:12:"twentytwenty";s:3:"1.7";s:15:"twentytwentyone";s:3:"1.3";}s:8:"response";a:0:{}s:9:"no_update";a:5:{s:5:"astra";a:6:{s:5:"theme";s:5:"astra";s:11:"new_version";s:5:"3.3.3";s:3:"url";s:35:"https://wordpress.org/themes/astra/";s:7:"package";s:53:"https://downloads.wordpress.org/theme/astra.3.3.3.zip";s:8:"requires";s:3:"5.3";s:12:"requires_php";s:3:"5.3";}s:7:"oceanwp";a:6:{s:5:"theme";s:7:"oceanwp";s:11:"new_version";s:5:"2.0.8";s:3:"url";s:37:"https://wordpress.org/themes/oceanwp/";s:7:"package";s:55:"https://downloads.wordpress.org/theme/oceanwp.2.0.8.zip";s:8:"requires";s:3:"5.3";s:12:"requires_php";s:3:"7.2";}s:14:"twentynineteen";a:6:{s:5:"theme";s:14:"twentynineteen";s:11:"new_version";s:3:"2.0";s:3:"url";s:44:"https://wordpress.org/themes/twentynineteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentynineteen.2.0.zip";s:8:"requires";s:5:"4.9.6";s:12:"requires_php";s:5:"5.2.4";}s:12:"twentytwenty";a:6:{s:5:"theme";s:12:"twentytwenty";s:11:"new_version";s:3:"1.7";s:3:"url";s:42:"https://wordpress.org/themes/twentytwenty/";s:7:"package";s:58:"https://downloads.wordpress.org/theme/twentytwenty.1.7.zip";s:8:"requires";s:3:"4.7";s:12:"requires_php";s:5:"5.2.4";}s:15:"twentytwentyone";a:6:{s:5:"theme";s:15:"twentytwentyone";s:11:"new_version";s:3:"1.3";s:3:"url";s:45:"https://wordpress.org/themes/twentytwentyone/";s:7:"package";s:61:"https://downloads.wordpress.org/theme/twentytwentyone.1.3.zip";s:8:"requires";s:3:"5.3";s:12:"requires_php";s:3:"5.6";}}s:12:"translations";a:0:{}}', 'no'),
(794, '_transient_timeout_dash_v2_f69de0bbfe7eaa113146875f40c02000', '1619722309', 'no'),
(795, '_transient_dash_v2_f69de0bbfe7eaa113146875f40c02000', '<div class="rss-widget"><p><strong>Ошибка RSS:</strong> WP HTTP Error: Предоставлен неверный URL.</p></div><div class="rss-widget"><p><strong>Ошибка RSS:</strong> WP HTTP Error: Предоставлен неверный URL.</p></div>', 'no'),
(797, '_site_transient_timeout_theme_roots', '1619683371', 'no'),
(798, '_site_transient_theme_roots', 'a:7:{s:9:"academics";s:7:"/themes";s:5:"astra";s:7:"/themes";s:9:"childhood";s:7:"/themes";s:7:"oceanwp";s:7:"/themes";s:14:"twentynineteen";s:7:"/themes";s:12:"twentytwenty";s:7:"/themes";s:15:"twentytwentyone";s:7:"/themes";}', 'no'),
(803, 'theme_contact_phone', '+7(915) 452 - 72 - 51', 'yes'),
(804, 'theme_contact_mail_visible', '1', 'yes'),
(805, 'theme_contact_mail', 'request@self-made-programmer.ru', 'yes'),
(806, 'theme_contact_phone_visible', '1', 'yes');

-- 
-- Вывод данных для таблицы wp_postmeta
--
INSERT INTO wp_postmeta VALUES
(1, 2, '_wp_page_template', 'default'),
(28, 17, '_wp_attached_file', '2021/03/images-1.png'),
(29, 17, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:225;s:6:"height";i:225;s:4:"file";s:20:"2021/03/images-1.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"images-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(30, 17, '_wp_attachment_image_alt', 'logotip'),
(31, 18, '_wp_attached_file', '2021/03/cropped-images-1.png'),
(32, 18, '_wp_attachment_context', 'custom-logo'),
(33, 18, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:225;s:6:"height";i:225;s:4:"file";s:28:"2021/03/cropped-images-1.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"cropped-images-1-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(34, 19, '_wp_attached_file', '2021/03/logodelphirgb.png'),
(35, 19, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:281;s:6:"height";i:280;s:4:"file";s:25:"2021/03/logodelphirgb.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"logodelphirgb-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(41, 22, '_edit_last', '1'),
(42, 22, '_edit_lock', '1619443825:1'),
(43, 2, '_edit_lock', '1619590831:1'),
(44, 27, '_wp_attached_file', '2021/03/rad-studio-02.png'),
(45, 27, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1000;s:6:"height";i:573;s:4:"file";s:25:"2021/03/rad-studio-02.png";s:5:"sizes";a:3:{s:6:"medium";a:4:{s:4:"file";s:25:"rad-studio-02-300x172.png";s:5:"width";i:300;s:6:"height";i:172;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:25:"rad-studio-02-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:25:"rad-studio-02-768x440.png";s:5:"width";i:768;s:6:"height";i:440;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(46, 27, '_wp_attachment_image_alt', 'Delphi'),
(47, 2, '_edit_last', '1'),
(48, 2, 'navyk_title', 'Delphi'),
(49, 2, '_navyk_title', 'field_605b2192827d0'),
(50, 2, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(51, 2, '_navyk_description', 'field_605b222d827d1'),
(52, 2, 'navyk_img', '27'),
(53, 2, '_navyk_img', 'field_605b2257827d2'),
(54, 29, 'navyk_title', 'Delphi'),
(55, 29, '_navyk_title', 'field_605b2192827d0'),
(56, 29, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(57, 29, '_navyk_description', 'field_605b222d827d1'),
(58, 29, 'navyk_img', '27'),
(59, 29, '_navyk_img', 'field_605b2257827d2'),
(60, 30, '_edit_last', '1'),
(61, 30, '_edit_lock', '1617972824:1'),
(62, 34, '_wp_attached_file', '2021/03/community-reverse.jpg'),
(63, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:700;s:6:"height";i:490;s:4:"file";s:29:"2021/03/community-reverse.jpg";s:5:"sizes";a:2:{s:6:"medium";a:4:{s:4:"file";s:29:"community-reverse-300x210.jpg";s:5:"width";i:300;s:6:"height";i:210;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:29:"community-reverse-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(64, 34, '_wp_attachment_image_alt', 'Обо мне'),
(65, 2, 'about_title', 'Я программист'),
(66, 2, '_about_title', 'field_605b335f43d5e'),
(67, 2, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(68, 2, '_about_description', 'field_605b338843d5f'),
(69, 2, 'about_img', '34'),
(70, 2, '_about_img', 'field_605b33ba43d60'),
(71, 35, 'navyk_title', 'Delphi'),
(72, 35, '_navyk_title', 'field_605b2192827d0'),
(73, 35, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(74, 35, '_navyk_description', 'field_605b222d827d1'),
(75, 35, 'navyk_img', '27'),
(76, 35, '_navyk_img', 'field_605b2257827d2'),
(77, 35, 'about_title', 'Я программист'),
(78, 35, '_about_title', 'field_605b335f43d5e'),
(79, 35, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(80, 35, '_about_description', 'field_605b338843d5f'),
(81, 35, 'about_img', '34'),
(82, 35, '_about_img', 'field_605b33ba43d60'),
(83, 39, '_edit_last', '1'),
(84, 39, '_edit_lock', '1619591146:1'),
(85, 2, 'mail', 'request@self-made-programmer.ru'),
(86, 2, '_mail', 'field_605b3a97f0902'),
(87, 41, 'navyk_title', 'Delphi'),
(88, 41, '_navyk_title', 'field_605b2192827d0'),
(89, 41, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(90, 41, '_navyk_description', 'field_605b222d827d1'),
(91, 41, 'navyk_img', '27'),
(92, 41, '_navyk_img', 'field_605b2257827d2'),
(93, 41, 'about_title', 'Я программист'),
(94, 41, '_about_title', 'field_605b335f43d5e'),
(95, 41, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(96, 41, '_about_description', 'field_605b338843d5f'),
(97, 41, 'about_img', '34'),
(98, 41, '_about_img', 'field_605b33ba43d60'),
(99, 41, 'mail', 'delphiprogrammer@bk.ru'),
(100, 41, '_mail', 'field_605b3a97f0902'),
(101, 2, 'phone', '+79264705889'),
(102, 2, '_phone', 'field_605b3c2ea285c'),
(103, 2, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(104, 2, '_adress', 'field_605b3c60a285d'),
(105, 44, 'navyk_title', 'Delphi'),
(106, 44, '_navyk_title', 'field_605b2192827d0'),
(107, 44, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(108, 44, '_navyk_description', 'field_605b222d827d1'),
(109, 44, 'navyk_img', '27'),
(110, 44, '_navyk_img', 'field_605b2257827d2'),
(111, 44, 'about_title', 'Я программист'),
(112, 44, '_about_title', 'field_605b335f43d5e'),
(113, 44, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(114, 44, '_about_description', 'field_605b338843d5f'),
(115, 44, 'about_img', '34'),
(116, 44, '_about_img', 'field_605b33ba43d60'),
(117, 44, 'mail', 'delphiprogrammer@bk.ru'),
(118, 44, '_mail', 'field_605b3a97f0902'),
(119, 44, 'phone', '+7(926) 470-58-89'),
(120, 44, '_phone', 'field_605b3c2ea285c'),
(121, 44, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(122, 44, '_adress', 'field_605b3c60a285d'),
(123, 45, 'navyk_title', 'Delphi'),
(124, 45, '_navyk_title', 'field_605b2192827d0'),
(125, 45, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(126, 45, '_navyk_description', 'field_605b222d827d1'),
(127, 45, 'navyk_img', '27'),
(128, 45, '_navyk_img', 'field_605b2257827d2'),
(129, 45, 'about_title', 'Я программист'),
(130, 45, '_about_title', 'field_605b335f43d5e'),
(131, 45, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(132, 45, '_about_description', 'field_605b338843d5f'),
(133, 45, 'about_img', '34'),
(134, 45, '_about_img', 'field_605b33ba43d60'),
(135, 45, 'mail', 'delphiprogrammer@bk.ru'),
(136, 45, '_mail', 'field_605b3a97f0902'),
(137, 45, 'phone', '+79264705889'),
(138, 45, '_phone', 'field_605b3c2ea285c'),
(139, 45, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(140, 45, '_adress', 'field_605b3c60a285d'),
(141, 46, '_edit_last', '1'),
(142, 46, '_edit_lock', '1617974840:1'),
(143, 50, '_wp_attached_file', '2021/03/course_2.jpg'),
(144, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:494;s:4:"file";s:20:"2021/03/course_2.jpg";s:5:"sizes";a:3:{s:6:"medium";a:4:{s:4:"file";s:20:"course_2-300x185.jpg";s:5:"width";i:300;s:6:"height";i:185;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"course_2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"course_2-768x474.jpg";s:5:"width";i:768;s:6:"height";i:474;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(145, 50, '_wp_attachment_image_alt', 'Моя история'),
(146, 2, 'history_title', 'Моя история'),
(147, 2, '_history_title', 'field_605c207638aba'),
(148, 2, 'history_description', 'Все началось в далеком 1995 году, у меня появился первый компьютер IBM PC XT 486 SX 25.\r\nЯ начал сразу с языка С++, это был компилятор Borland C++ 2.0. Для меня это был очень сложный язык.\r\nПрошли годы и я перешел на Delphi 7 в 2003 году. \r\nНа Delphi 7 было много самых разных задач и это было интересно, но в 2018 году решил освоить разработку вебсайтов.\r\nЯ попробовал разные CMS и фреймворки, и вот теперь остановился на WordPress.'),
(149, 2, '_history_description', 'field_605c209738abb'),
(150, 2, 'history_img', '50'),
(151, 2, '_history_img', 'field_605c20c338abc'),
(152, 51, 'navyk_title', 'Delphi'),
(153, 51, '_navyk_title', 'field_605b2192827d0'),
(154, 51, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(155, 51, '_navyk_description', 'field_605b222d827d1'),
(156, 51, 'navyk_img', '27'),
(157, 51, '_navyk_img', 'field_605b2257827d2'),
(158, 51, 'about_title', 'Я программист'),
(159, 51, '_about_title', 'field_605b335f43d5e'),
(160, 51, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(161, 51, '_about_description', 'field_605b338843d5f'),
(162, 51, 'about_img', '34'),
(163, 51, '_about_img', 'field_605b33ba43d60'),
(164, 51, 'mail', 'delphiprogrammer@bk.ru'),
(165, 51, '_mail', 'field_605b3a97f0902'),
(166, 51, 'phone', '+79264705889'),
(167, 51, '_phone', 'field_605b3c2ea285c'),
(168, 51, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(169, 51, '_adress', 'field_605b3c60a285d'),
(170, 51, 'history_title', 'Моя история'),
(171, 51, '_history_title', 'field_605c207638aba'),
(172, 51, 'history_description', 'Все началось в далеком 1995 году, у меня появился первый компьютер IBM PC XT 486 SX 25.\r\nЯ начал сразу с языка С++, это был компилятор Borland C++ 2.0. Для меня это был очень сложный язык.\r\nПрошли годы и я перешел на Delphi 7 в 2003 году. \r\nНа Delphi 7 было много самых разных задач и это было интересно, но в 2018 году решил освоить разработку вебсайтов.\r\nЯ попробовал разные CMS и фреймворки, и вот теперь остановился на WordPress.'),
(173, 51, '_history_description', 'field_605c209738abb'),
(174, 51, 'history_img', '50'),
(175, 51, '_history_img', 'field_605c20c338abc'),
(176, 1, '_edit_lock', '1619617350:1'),
(179, 1, '_wp_old_slug', '%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80'),
(180, 54, '_edit_lock', '1619611329:1'),
(183, 56, '_edit_lock', '1619611278:1'),
(186, 58, '_edit_lock', '1619444759:1'),
(189, 60, '_edit_lock', '1619529152:1'),
(192, 62, '_edit_lock', '1619444838:1'),
(195, 64, '_edit_lock', '1616999894:1'),
(199, 67, '_edit_last', '1'),
(200, 67, '_edit_lock', '1617606631:1'),
(201, 72, '_wp_attached_file', '2021/03/blog_1.jpg'),
(202, 72, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:400;s:6:"height";i:399;s:4:"file";s:18:"2021/03/blog_1.jpg";s:5:"sizes";a:2:{s:6:"medium";a:4:{s:4:"file";s:18:"blog_1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"blog_1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(205, 56, '_edit_last', '1'),
(206, 56, 'slider_img', '72'),
(207, 56, '_slider_img', 'field_605c3079460c7'),
(208, 56, 'slider_color', 'dark'),
(209, 56, '_slider_color', 'field_605c30bf460c8'),
(210, 56, 'slider_btn', 'off'),
(211, 56, '_slider_btn', 'field_605c3107460c9'),
(212, 56, 'slider_link', 'http:\\\\wordpress.org'),
(213, 56, '_slider_link', 'field_605c3123460ca'),
(214, 73, 'slider_img', '72'),
(215, 73, '_slider_img', 'field_605c3079460c7'),
(216, 73, 'slider_color', 'dark'),
(217, 73, '_slider_color', 'field_605c30bf460c8'),
(218, 73, 'slider_btn', 'on'),
(219, 73, '_slider_btn', 'field_605c3107460c9'),
(220, 73, 'slider_link', 'http:\\\\wordpress.org'),
(221, 73, '_slider_link', 'field_605c3123460ca'),
(222, 74, '_wp_attached_file', '2021/03/bg_1.jpg'),
(223, 74, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:717;s:4:"file";s:16:"2021/03/bg_1.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:16:"bg_1-300x112.jpg";s:5:"width";i:300;s:6:"height";i:112;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:17:"bg_1-1024x382.jpg";s:5:"width";i:1024;s:6:"height";i:382;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:16:"bg_1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:16:"bg_1-768x287.jpg";s:5:"width";i:768;s:6:"height";i:287;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:17:"bg_1-1536x574.jpg";s:5:"width";i:1536;s:6:"height";i:574;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(224, 74, '_wp_attachment_image_alt', 'Я уже кое что умею'),
(227, 54, '_edit_last', '1'),
(230, 54, 'slider_img', '74'),
(231, 54, '_slider_img', 'field_605c3079460c7'),
(232, 54, 'slider_color', 'white'),
(233, 54, '_slider_color', 'field_605c30bf460c8'),
(234, 54, 'slider_btn', 'off'),
(235, 54, '_slider_btn', 'field_605c3107460c9'),
(236, 54, 'slider_link', 'http:\\\\drupal.org'),
(237, 54, '_slider_link', 'field_605c3123460ca'),
(238, 75, 'slider_img', '74'),
(239, 75, '_slider_img', 'field_605c3079460c7'),
(240, 75, 'slider_color', 'white'),
(241, 75, '_slider_color', 'field_605c30bf460c8'),
(242, 75, 'slider_btn', 'on'),
(243, 75, '_slider_btn', 'field_605c3107460c9'),
(244, 75, 'slider_link', 'http:\\\\drupal.org'),
(245, 75, '_slider_link', 'field_605c3123460ca'),
(246, 76, '_wp_attached_file', '2021/03/bg_2.jpg'),
(247, 76, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:600;s:4:"file";s:16:"2021/03/bg_2.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:15:"bg_2-300x94.jpg";s:5:"width";i:300;s:6:"height";i:94;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:17:"bg_2-1024x320.jpg";s:5:"width";i:1024;s:6:"height";i:320;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:16:"bg_2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:16:"bg_2-768x240.jpg";s:5:"width";i:768;s:6:"height";i:240;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:17:"bg_2-1536x480.jpg";s:5:"width";i:1536;s:6:"height";i:480;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(248, 76, '_wp_attachment_image_alt', 'Я учусь создавать сайты на WordPress'),
(251, 1, '_wp_old_slug', 'privet-mir'),
(252, 1, '_edit_last', '1'),
(255, 1, 'slider_img', '76'),
(256, 1, '_slider_img', 'field_605c3079460c7'),
(257, 1, 'slider_color', 'white'),
(258, 1, '_slider_color', 'field_605c30bf460c8'),
(259, 1, 'slider_btn', 'off'),
(260, 1, '_slider_btn', 'field_605c3107460c9'),
(261, 1, 'slider_link', 'http:\\\\cakephp.org'),
(262, 1, '_slider_link', 'field_605c3123460ca'),
(263, 78, 'slider_img', '76'),
(264, 78, '_slider_img', 'field_605c3079460c7'),
(265, 78, 'slider_color', 'white'),
(266, 78, '_slider_color', 'field_605c30bf460c8'),
(267, 78, 'slider_btn', 'on'),
(268, 78, '_slider_btn', 'field_605c3107460c9'),
(269, 78, 'slider_link', 'http:\\\\cakephp.org'),
(270, 78, '_slider_link', 'field_605c3123460ca'),
(271, 81, '_wp_attached_file', '2021/03/bez-nazvaniya.jpg'),
(272, 81, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:225;s:6:"height";i:225;s:4:"file";s:25:"2021/03/bez-nazvaniya.jpg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"bez-nazvaniya-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(273, 81, '_wp_attachment_image_alt', 'FireBird'),
(276, 64, '_edit_last', '1'),
(279, 64, 'navyk_title', 'FireBird'),
(280, 64, '_navyk_title', 'field_605b2192827d0'),
(281, 64, 'navyk_description', 'Я работал с FireBird 2.5. Я создавал процедуры, запросы, триггеры.\r\nЭту СУБД я знаю лучше всего.\r\nНо я не использовал ее в создании вебсайтов.'),
(282, 64, '_navyk_description', 'field_605b222d827d1'),
(283, 64, 'navyk_img', '81'),
(284, 64, '_navyk_img', 'field_605b2257827d2'),
(285, 64, 'navyk_link', 'https:\\\\firebird.org'),
(286, 64, '_navyk_link', 'field_605c3952f1072'),
(287, 82, 'navyk_title', 'FireBird'),
(288, 82, '_navyk_title', 'field_605b2192827d0'),
(289, 82, 'navyk_description', 'Я работал с FireBird 2.5. Я создавал процедуры, запросы, триггеры.\r\nЭту СУБД я знаю лучше всего.\r\nНо я не использовал ее в создании вебсайтов.'),
(290, 82, '_navyk_description', 'field_605b222d827d1'),
(291, 82, 'navyk_img', '81'),
(292, 82, '_navyk_img', 'field_605b2257827d2'),
(293, 82, 'navyk_link', 'https:\\\\firebird.org'),
(294, 82, '_navyk_link', 'field_605c3952f1072'),
(295, 83, '_wp_attached_file', '2021/03/bez-nazvaniya.png'),
(296, 83, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:312;s:6:"height";i:161;s:4:"file";s:25:"2021/03/bez-nazvaniya.png";s:5:"sizes";a:2:{s:6:"medium";a:4:{s:4:"file";s:25:"bez-nazvaniya-300x155.png";s:5:"width";i:300;s:6:"height";i:155;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:25:"bez-nazvaniya-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(297, 83, '_wp_attachment_image_alt', 'MySQL'),
(300, 62, '_edit_last', '1'),
(303, 62, 'navyk_title', 'MySQL'),
(304, 62, '_navyk_title', 'field_605b2192827d0'),
(305, 62, 'navyk_description', 'С MySQL я познакомился при изучении различных PHP фреймворков.\r\nЯ могу не только создавать таблицы и разрабатывать SQL запросы, но и разрабатывать процедуры и функции.'),
(306, 62, '_navyk_description', 'field_605b222d827d1'),
(307, 62, 'navyk_img', '83'),
(308, 62, '_navyk_img', 'field_605b2257827d2'),
(309, 62, 'navyk_link', 'http:\\\\mysql.org'),
(310, 62, '_navyk_link', 'field_605c3952f1072'),
(311, 84, 'navyk_title', 'MySQL'),
(312, 84, '_navyk_title', 'field_605b2192827d0'),
(313, 84, 'navyk_description', 'С MySQL я познакомился при изучении различных PHP фреймворков.\r\nЯ могу не только создавать таблицы и разрабатывать SQL запросы, но и разрабатывать процедуры и функции.'),
(314, 84, '_navyk_description', 'field_605b222d827d1'),
(315, 84, 'navyk_img', '83'),
(316, 84, '_navyk_img', 'field_605b2257827d2'),
(317, 84, 'navyk_link', 'http:\\\\mysql.org'),
(318, 84, '_navyk_link', 'field_605c3952f1072'),
(319, 85, '_wp_attached_file', '2021/03/images-2.png'),
(320, 85, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:284;s:6:"height";i:177;s:4:"file";s:20:"2021/03/images-2.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"images-2-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(321, 85, '_wp_attachment_image_alt', 'PHP'),
(324, 60, '_edit_last', '1'),
(327, 60, 'navyk_title', 'PHP'),
(328, 60, '_navyk_title', 'field_605b2192827d0'),
(329, 60, 'navyk_description', 'С языком программирования PHP я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(330, 60, '_navyk_description', 'field_605b222d827d1'),
(331, 60, 'navyk_img', '85'),
(332, 60, '_navyk_img', 'field_605b2257827d2'),
(333, 60, 'navyk_link', 'http:\\\\php.net'),
(334, 60, '_navyk_link', 'field_605c3952f1072'),
(335, 86, 'navyk_title', 'PHP'),
(336, 86, '_navyk_title', 'field_605b2192827d0'),
(337, 86, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(338, 86, '_navyk_description', 'field_605b222d827d1'),
(339, 86, 'navyk_img', '85'),
(340, 86, '_navyk_img', 'field_605b2257827d2'),
(341, 86, 'navyk_link', 'http:\\\\php.net'),
(342, 86, '_navyk_link', 'field_605c3952f1072'),
(343, 87, '_wp_attached_file', '2021/03/delphi10.4.png'),
(344, 87, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:139;s:6:"height";i:200;s:4:"file";s:22:"2021/03/delphi10.4.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"delphi10.4-139x150.png";s:5:"width";i:139;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(345, 87, '_wp_attachment_image_alt', 'Delphi'),
(348, 58, '_edit_last', '1'),
(351, 58, 'navyk_title', 'Delphi'),
(352, 58, '_navyk_title', 'field_605b2192827d0'),
(353, 58, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(354, 58, '_navyk_description', 'field_605b222d827d1'),
(355, 58, 'navyk_img', '87'),
(356, 58, '_navyk_img', 'field_605b2257827d2'),
(357, 58, 'navyk_link', 'https:\\\\embarcadero.com'),
(358, 58, '_navyk_link', 'field_605c3952f1072'),
(359, 88, 'navyk_title', 'Delphi'),
(360, 88, '_navyk_title', 'field_605b2192827d0'),
(361, 88, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(362, 88, '_navyk_description', 'field_605b222d827d1'),
(363, 88, 'navyk_img', '87'),
(364, 88, '_navyk_img', 'field_605b2257827d2'),
(365, 88, 'navyk_link', 'https:\\\\embarcadero.com'),
(366, 88, '_navyk_link', 'field_605c3952f1072'),
(369, 60, '_thumbnail_id', '85'),
(372, 89, '_edit_lock', '1617182206:1'),
(373, 89, '_wp_page_template', 'page-obomne.php'),
(374, 91, '_edit_lock', '1617612354:1'),
(375, 91, '_wp_page_template', 'page-navyk.php'),
(376, 93, '_edit_lock', '1619238267:1'),
(377, 93, '_wp_page_template', 'page-contacts.php'),
(378, 95, '_edit_lock', '1617941841:1'),
(379, 95, '_wp_page_template', 'page-history.php'),
(380, 97, '_edit_last', '1'),
(381, 97, '_edit_lock', '1619589635:1'),
(382, 100, '_wp_attached_file', '2021/03/69.png'),
(383, 100, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1366;s:6:"height";i:768;s:4:"file";s:14:"2021/03/69.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:14:"69-300x169.png";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:15:"69-1024x576.png";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:14:"69-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:14:"69-768x432.png";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(384, 101, '_wp_attached_file', '2021/03/d9qxnvlxyaeby-s.png'),
(385, 101, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:801;s:4:"file";s:27:"2021/03/d9qxnvlxyaeby-s.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:27:"d9qxnvlxyaeby-s-300x200.png";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:28:"d9qxnvlxyaeby-s-1024x684.png";s:5:"width";i:1024;s:6:"height";i:684;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:27:"d9qxnvlxyaeby-s-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:27:"d9qxnvlxyaeby-s-768x513.png";s:5:"width";i:768;s:6:"height";i:513;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(386, 102, '_wp_attached_file', '2021/03/delphi_10.2.3_ce_splash.png'),
(387, 102, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1092;s:6:"height";i:684;s:4:"file";s:35:"2021/03/delphi_10.2.3_ce_splash.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:35:"delphi_10.2.3_ce_splash-300x188.png";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:36:"delphi_10.2.3_ce_splash-1024x641.png";s:5:"width";i:1024;s:6:"height";i:641;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:35:"delphi_10.2.3_ce_splash-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:35:"delphi_10.2.3_ce_splash-768x481.png";s:5:"width";i:768;s:6:"height";i:481;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(388, 103, '_wp_attached_file', '2021/03/hands.jpg'),
(389, 103, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1200;s:4:"file";s:17:"2021/03/hands.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:17:"hands-300x188.jpg";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:18:"hands-1024x640.jpg";s:5:"width";i:1024;s:6:"height";i:640;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:17:"hands-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:17:"hands-768x480.jpg";s:5:"width";i:768;s:6:"height";i:480;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:18:"hands-1536x960.jpg";s:5:"width";i:1536;s:6:"height";i:960;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(390, 104, '_wp_attached_file', '2021/03/konsol_wordpress.jpg'),
(391, 104, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1600;s:6:"height";i:1044;s:4:"file";s:28:"2021/03/konsol_wordpress.jpg";s:5:"sizes";a:5:{s:6:"medium";a:4:{s:4:"file";s:28:"konsol_wordpress-300x196.jpg";s:5:"width";i:300;s:6:"height";i:196;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"konsol_wordpress-1024x668.jpg";s:5:"width";i:1024;s:6:"height";i:668;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"konsol_wordpress-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"konsol_wordpress-768x501.jpg";s:5:"width";i:768;s:6:"height";i:501;s:9:"mime-type";s:10:"image/jpeg";}s:9:"1536x1536";a:4:{s:4:"file";s:30:"konsol_wordpress-1536x1002.jpg";s:5:"width";i:1536;s:6:"height";i:1002;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(394, 106, '_form', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit "Submit"]'),
(395, 106, '_mail', 'a:8:{s:7:"subject";s:30:"[_site_title] "[your-subject]"";s:6:"sender";s:35:"[_site_title] <admin@portfolio.loc>";s:4:"body";s:163:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])";s:9:"recipient";s:19:"[_site_admin_email]";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(396, 106, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:30:"[_site_title] "[your-subject]"";s:6:"sender";s:35:"[_site_title] <admin@portfolio.loc>";s:4:"body";s:105:"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:29:"Reply-To: [_site_admin_email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(397, 106, '_messages', 'a:12:{s:12:"mail_sent_ok";s:45:"Thank you for your message. It has been sent.";s:12:"mail_sent_ng";s:71:"There was an error trying to send your message. Please try again later.";s:16:"validation_error";s:61:"One or more fields have an error. Please check and try again.";s:4:"spam";s:71:"There was an error trying to send your message. Please try again later.";s:12:"accept_terms";s:69:"You must accept the terms and conditions before sending your message.";s:16:"invalid_required";s:22:"The field is required.";s:16:"invalid_too_long";s:22:"The field is too long.";s:17:"invalid_too_short";s:23:"The field is too short.";s:13:"upload_failed";s:46:"There was an unknown error uploading the file.";s:24:"upload_file_type_invalid";s:49:"You are not allowed to upload files of this type.";s:21:"upload_file_too_large";s:20:"The file is too big.";s:23:"upload_failed_php_error";s:38:"There was an error uploading the file.";}'),
(398, 106, '_additional_settings', NULL),
(399, 106, '_locale', 'ru_RU'),
(402, 109, '_menu_item_type', 'post_type'),
(403, 109, '_menu_item_menu_item_parent', '0'),
(404, 109, '_menu_item_object_id', '2'),
(405, 109, '_menu_item_object', 'page'),
(406, 109, '_menu_item_target', ''),
(407, 109, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(408, 109, '_menu_item_xfn', ''),
(409, 109, '_menu_item_url', ''),
(410, 110, '_menu_item_type', 'post_type'),
(411, 110, '_menu_item_menu_item_parent', '0'),
(412, 110, '_menu_item_object_id', '95'),
(413, 110, '_menu_item_object', 'page'),
(414, 110, '_menu_item_target', ''),
(415, 110, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(416, 110, '_menu_item_xfn', ''),
(417, 110, '_menu_item_url', ''),
(418, 111, '_menu_item_type', 'post_type'),
(419, 111, '_menu_item_menu_item_parent', '0'),
(420, 111, '_menu_item_object_id', '93'),
(421, 111, '_menu_item_object', 'page'),
(422, 111, '_menu_item_target', ''),
(423, 111, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(424, 111, '_menu_item_xfn', ''),
(425, 111, '_menu_item_url', ''),
(426, 112, '_menu_item_type', 'post_type'),
(427, 112, '_menu_item_menu_item_parent', '0'),
(428, 112, '_menu_item_object_id', '91'),
(429, 112, '_menu_item_object', 'page'),
(430, 112, '_menu_item_target', ''),
(431, 112, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(432, 112, '_menu_item_xfn', ''),
(433, 112, '_menu_item_url', ''),
(442, 108, '_wp_trash_meta_status', 'publish'),
(443, 108, '_wp_trash_meta_time', '1617101279'),
(444, 95, '_edit_last', '1'),
(445, 95, 'history_title', 'История номер 1'),
(446, 95, '_history_title', 'field_605c207638aba'),
(447, 95, 'history_description', 'Описание истории 1'),
(448, 95, '_history_description', 'field_605c209738abb'),
(449, 95, 'history_img', '102'),
(450, 95, '_history_img', 'field_605c20c338abc'),
(451, 117, 'history_title', 'История номер 1'),
(452, 117, '_history_title', 'field_605c207638aba'),
(453, 117, 'history_description', 'Описание истории 1'),
(454, 117, '_history_description', 'field_605c209738abb'),
(455, 117, 'history_img', '102'),
(456, 117, '_history_img', 'field_605c20c338abc'),
(457, 118, '_edit_lock', '1617973127:1'),
(468, 122, 'navyk_title', 'PHP'),
(469, 122, '_navyk_title', 'field_605b2192827d0'),
(470, 122, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(471, 122, '_navyk_description', 'field_605b222d827d1'),
(472, 122, 'navyk_img', '85'),
(473, 122, '_navyk_img', 'field_605b2257827d2'),
(474, 122, 'navyk_link', 'http:\\\\php.net'),
(475, 122, '_navyk_link', 'field_605c3952f1072'),
(476, 123, 'navyk_title', 'PHP'),
(477, 123, '_navyk_title', 'field_605b2192827d0'),
(478, 123, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(479, 123, '_navyk_description', 'field_605b222d827d1'),
(480, 123, 'navyk_img', '85'),
(481, 123, '_navyk_img', 'field_605b2257827d2'),
(482, 123, 'navyk_link', 'http:\\\\php.net'),
(483, 123, '_navyk_link', 'field_605c3952f1072'),
(484, 124, '_wp_attached_file', 'woocommerce-placeholder.png'),
(485, 124, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:1200;s:4:"file";s:27:"woocommerce-placeholder.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:35:"woocommerce-placeholder-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:37:"woocommerce-placeholder-1024x1024.png";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:35:"woocommerce-placeholder-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:35:"woocommerce-placeholder-768x768.png";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(518, 133, '_wp_trash_meta_status', 'publish'),
(519, 133, '_wp_trash_meta_time', '1617342064'),
(520, 134, 'event_date', '09.04.2021'),
(521, 134, 'event_location', 'dfgdfgdfgdfg'),
(522, 135, 'event_date', '08.04.2021'),
(523, 135, 'event_location', 'dfgdfgdfgdfg'),
(524, 135, '_edit_lock', '1617369487:1'),
(525, 137, 'event_date', '01.04.2021'),
(526, 137, 'event_location', 'Место'),
(527, 138, '_wp_attached_file', '2021/04/alarmclock_stop.png'),
(528, 138, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:64;s:6:"height";i:64;s:4:"file";s:27:"2021/04/alarmclock_stop.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(529, 137, '_thumbnail_id', '138'),
(530, 137, '_edit_lock', '1617606334:1'),
(531, 134, '_edit_lock', '1617478713:1'),
(533, 95, 'ssylka', 'a:3:{i:0;s:2:"56";i:1;s:2:"64";i:2;s:2:"62";}'),
(534, 95, '_ssylka', 'field_606a036cce97d'),
(535, 141, 'history_title', 'История номер 1'),
(536, 141, '_history_title', 'field_605c207638aba'),
(537, 141, 'history_description', 'Описание истории 1'),
(538, 141, '_history_description', 'field_605c209738abb'),
(539, 141, 'history_img', '102'),
(540, 141, '_history_img', 'field_605c20c338abc'),
(541, 141, 'ssylka', 'a:3:{i:0;s:2:"56";i:1;s:2:"64";i:2;s:2:"62";}'),
(542, 141, '_ssylka', 'field_606a036cce97d'),
(555, 93, '_edit_last', '1'),
(556, 109, '_wp_old_date', '2021-03-30'),
(557, 110, '_wp_old_date', '2021-03-30'),
(558, 112, '_wp_old_date', '2021-03-30'),
(560, 111, '_wp_old_date', '2021-03-30'),
(562, 146, 'navyk_title', 'Delphi'),
(563, 146, '_navyk_title', 'field_605b2192827d0'),
(564, 146, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(565, 146, '_navyk_description', 'field_605b222d827d1'),
(566, 146, 'navyk_img', '27'),
(567, 146, '_navyk_img', 'field_605b2257827d2'),
(568, 146, 'about_title', 'Я программист'),
(569, 146, '_about_title', 'field_605b335f43d5e'),
(570, 146, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(571, 146, '_about_description', 'field_605b338843d5f'),
(572, 146, 'about_img', '34'),
(573, 146, '_about_img', 'field_605b33ba43d60'),
(574, 146, 'mail', 'delphiprogrammer@bk.ru'),
(575, 146, '_mail', 'field_605b3a97f0902'),
(576, 146, 'phone', '+79264705889'),
(577, 146, '_phone', 'field_605b3c2ea285c'),
(578, 146, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(579, 146, '_adress', 'field_605b3c60a285d'),
(580, 146, 'history_title', 'Моя история'),
(581, 146, '_history_title', 'field_605c207638aba'),
(582, 146, 'history_description', 'Все началось в далеком 1995 году, у меня появился первый компьютер IBM PC XT 486 SX 25.\r\nЯ начал сразу с языка С++, это был компилятор Borland C++ 2.0. Для меня это был очень сложный язык.\r\nПрошли годы и я перешел на Delphi 7 в 2003 году. \r\nНа Delphi 7 было много самых разных задач и это было интересно, но в 2018 году решил освоить разработку вебсайтов.\r\nЯ попробовал разные CMS и фреймворки, и вот теперь остановился на WordPress.'),
(583, 146, '_history_description', 'field_605c209738abb'),
(584, 146, 'history_img', '50'),
(585, 146, '_history_img', 'field_605c20c338abc'),
(588, 148, 'navyk_title', 'Delphi'),
(589, 148, '_navyk_title', 'field_605b2192827d0'),
(590, 148, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(591, 148, '_navyk_description', 'field_605b222d827d1'),
(592, 148, 'navyk_img', '87'),
(593, 148, '_navyk_img', 'field_605b2257827d2'),
(594, 148, 'navyk_link', 'https:\\\\embarcadero.com'),
(595, 148, '_navyk_link', 'field_605c3952f1072'),
(599, 150, 'navyk_title', 'Delphi'),
(600, 150, '_navyk_title', 'field_605b2192827d0'),
(601, 150, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(602, 150, '_navyk_description', 'field_605b222d827d1'),
(603, 150, 'navyk_img', '87'),
(604, 150, '_navyk_img', 'field_605b2257827d2'),
(605, 150, 'navyk_link', 'https:\\\\embarcadero.com'),
(606, 150, '_navyk_link', 'field_605c3952f1072'),
(609, 151, 'navyk_title', 'Delphi'),
(610, 151, '_navyk_title', 'field_605b2192827d0'),
(611, 151, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(612, 151, '_navyk_description', 'field_605b222d827d1'),
(613, 151, 'navyk_img', '87'),
(614, 151, '_navyk_img', 'field_605b2257827d2'),
(615, 151, 'navyk_link', 'https:\\\\embarcadero.com'),
(616, 151, '_navyk_link', 'field_605c3952f1072'),
(619, 153, '_edit_lock', '1617972737:1'),
(622, 153, '_edit_last', '1'),
(625, 153, 'history_title', 'Начало программирования'),
(626, 153, '_history_title', 'field_605c207638aba'),
(627, 153, 'history_description', 'Программированием я начал заниматься еще в далеком 1995 году. У меня был на тот момент довольно неплохой компьютер: IBM PC/XT SX-25 с четырьмя мегабайтами оперативной памяти. В тот момент у меня были небольшие познания языка программирования Basic.'),
(628, 153, '_history_description', 'field_605c209738abb'),
(629, 153, 'history_img', '50'),
(630, 153, '_history_img', 'field_605c20c338abc'),
(631, 153, 'ssylka', ''),
(632, 153, '_ssylka', 'field_606a036cce97d'),
(633, 155, 'history_title', 'Начало программирования'),
(634, 155, '_history_title', 'field_605c207638aba'),
(635, 155, 'history_description', 'Программированием я начал заниматься еще в далеком 1995 году. У меня был на тот момент довольно неплохой компьютер: IBM PC/XT SX-25 с четырьмя мегабайтами оперативной памяти. В тот момент у меня были небольшие познания языка программирования Basic.'),
(636, 155, '_history_description', 'field_605c209738abb'),
(637, 155, 'history_img', '50'),
(638, 155, '_history_img', 'field_605c20c338abc'),
(639, 155, 'ssylka', ''),
(640, 155, '_ssylka', 'field_606a036cce97d'),
(641, 118, '_edit_last', '1'),
(642, 118, '_wp_page_template', 'default'),
(643, 109, '_wp_old_date', '2021-04-05'),
(644, 110, '_wp_old_date', '2021-04-05'),
(645, 112, '_wp_old_date', '2021-04-05'),
(647, 111, '_wp_old_date', '2021-04-05'),
(648, 104, '_wp_attachment_is_custom_background', 'twentytwentyone'),
(649, 159, '_wp_trash_meta_status', 'publish'),
(650, 159, '_wp_trash_meta_time', '1619177176'),
(651, 160, '_wp_trash_meta_status', 'publish'),
(652, 160, '_wp_trash_meta_time', '1619177194'),
(653, 161, '_wp_trash_meta_status', 'publish'),
(654, 161, '_wp_trash_meta_time', '1619177537'),
(655, 162, '_wp_trash_meta_status', 'publish'),
(656, 162, '_wp_trash_meta_time', '1619177574'),
(657, 163, '_wp_trash_meta_status', 'publish'),
(658, 163, '_wp_trash_meta_time', '1619177607'),
(659, 164, 'navyk_title', 'Delphi'),
(660, 164, '_navyk_title', 'field_605b2192827d0'),
(661, 164, 'navyk_description', 'Delphi 7, Delphi 10.3.3'),
(662, 164, '_navyk_description', 'field_605b222d827d1'),
(663, 164, 'navyk_img', '27'),
(664, 164, '_navyk_img', 'field_605b2257827d2'),
(665, 164, 'about_title', 'Я программист'),
(666, 164, '_about_title', 'field_605b335f43d5e'),
(667, 164, 'about_description', 'Здравствуйте! Я приветствую Вас на моем сайте.\r\nЗдесь я расскажу о своем опыте в программировании и различными примерами покажу свои навыки.'),
(668, 164, '_about_description', 'field_605b338843d5f'),
(669, 164, 'about_img', '34'),
(670, 164, '_about_img', 'field_605b33ba43d60'),
(671, 164, 'mail', 'request@self-made-programmer.ru'),
(672, 164, '_mail', 'field_605b3a97f0902'),
(673, 164, 'phone', '+79264705889'),
(674, 164, '_phone', 'field_605b3c2ea285c'),
(675, 164, 'adress', 'Россия, Московская область, п.Власиха, ул.Маршала Жукова'),
(676, 164, '_adress', 'field_605b3c60a285d'),
(677, 164, 'history_title', 'Моя история'),
(678, 164, '_history_title', 'field_605c207638aba'),
(679, 164, 'history_description', 'Все началось в далеком 1995 году, у меня появился первый компьютер IBM PC XT 486 SX 25.\r\nЯ начал сразу с языка С++, это был компилятор Borland C++ 2.0. Для меня это был очень сложный язык.\r\nПрошли годы и я перешел на Delphi 7 в 2003 году. \r\nНа Delphi 7 было много самых разных задач и это было интересно, но в 2018 году решил освоить разработку вебсайтов.\r\nЯ попробовал разные CMS и фреймворки, и вот теперь остановился на WordPress.'),
(680, 164, '_history_description', 'field_605c209738abb'),
(681, 164, 'history_img', '50'),
(682, 164, '_history_img', 'field_605c20c338abc'),
(683, 165, '_wp_attached_file', '2021/04/logosmptext-e1619415220197.png'),
(684, 165, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:100;s:6:"height";i:100;s:4:"file";s:38:"2021/04/logosmptext-e1619415220197.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"logosmptext-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(685, 165, '_edit_lock', '1619415099:1'),
(686, 166, '_edit_lock', '1619415210:1'),
(687, 165, '_wp_attachment_backup_sizes', 'a:1:{s:9:"full-orig";a:3:{s:5:"width";i:150;s:6:"height";i:150;s:4:"file";s:15:"logosmptext.png";}}'),
(688, 165, '_edit_last', '1'),
(689, 166, '_customize_restore_dismissed', '1'),
(690, 167, '_wp_trash_meta_status', 'publish'),
(691, 167, '_wp_trash_meta_time', '1619415290'),
(692, 168, '_wp_trash_meta_status', 'publish'),
(693, 168, '_wp_trash_meta_time', '1619415324'),
(694, 169, '_wp_attached_file', '2021/04/logosmptextfavicon.png'),
(695, 169, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:150;s:6:"height";i:150;s:4:"file";s:30:"2021/04/logosmptextfavicon.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"logosmptextfavicon-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(696, 170, '_wp_trash_meta_status', 'publish'),
(697, 170, '_wp_trash_meta_time', '1619415753'),
(701, 171, 'navyk_title', 'PHP'),
(702, 171, '_navyk_title', 'field_605b2192827d0'),
(703, 171, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(704, 171, '_navyk_description', 'field_605b222d827d1'),
(705, 171, 'navyk_img', '85'),
(706, 171, '_navyk_img', 'field_605b2257827d2'),
(707, 171, 'navyk_link', 'http:\\\\php.net'),
(708, 171, '_navyk_link', 'field_605c3952f1072'),
(712, 172, 'navyk_title', 'PHP'),
(713, 172, '_navyk_title', 'field_605b2192827d0'),
(714, 172, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(715, 172, '_navyk_description', 'field_605b222d827d1'),
(716, 172, 'navyk_img', '85'),
(717, 172, '_navyk_img', 'field_605b2257827d2'),
(718, 172, 'navyk_link', 'http:\\\\php.net'),
(719, 172, '_navyk_link', 'field_605c3952f1072'),
(724, 60, 'navyk_icon', 'icon-wordpress text-white'),
(725, 60, '_navyk_icon', 'field_6086a6c64020d'),
(726, 174, 'navyk_title', 'PHP'),
(727, 174, '_navyk_title', 'field_605b2192827d0'),
(728, 174, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(729, 174, '_navyk_description', 'field_605b222d827d1'),
(730, 174, 'navyk_img', '85'),
(731, 174, '_navyk_img', 'field_605b2257827d2'),
(732, 174, 'navyk_link', 'http:\\\\php.net'),
(733, 174, '_navyk_link', 'field_605c3952f1072'),
(734, 174, 'navyk_icon', 'icon-wordpress'),
(735, 174, '_navyk_icon', 'field_6086a6c64020d'),
(738, 175, 'navyk_title', 'PHP'),
(739, 175, '_navyk_title', 'field_605b2192827d0'),
(740, 175, 'navyk_description', 'С языком программирования я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(741, 175, '_navyk_description', 'field_605b222d827d1'),
(742, 175, 'navyk_img', '85'),
(743, 175, '_navyk_img', 'field_605b2257827d2'),
(744, 175, 'navyk_link', 'http:\\\\php.net'),
(745, 175, '_navyk_link', 'field_605c3952f1072'),
(746, 175, 'navyk_icon', 'icon-wordpress text-white'),
(747, 175, '_navyk_icon', 'field_6086a6c64020d'),
(751, 58, 'navyk_icon', 'icon-institution text-white'),
(752, 58, '_navyk_icon', 'field_6086a6c64020d'),
(753, 176, 'navyk_title', 'Delphi'),
(754, 176, '_navyk_title', 'field_605b2192827d0'),
(755, 176, 'navyk_description', 'На Delphi 7 я работаю с 2003 года, с появлением первой стабильно работающей новой версией я работаю на ней, для меня это Delphi 10.3.3 Rio.'),
(756, 176, '_navyk_description', 'field_605b222d827d1'),
(757, 176, 'navyk_img', '87'),
(758, 176, '_navyk_img', 'field_605b2257827d2'),
(759, 176, 'navyk_link', 'https:\\\\embarcadero.com'),
(760, 176, '_navyk_link', 'field_605c3952f1072'),
(761, 176, 'navyk_icon', 'icon-institution text-white'),
(762, 176, '_navyk_icon', 'field_6086a6c64020d'),
(766, 62, 'navyk_icon', 'icon-database text-white'),
(767, 62, '_navyk_icon', 'field_6086a6c64020d'),
(768, 177, 'navyk_title', 'MySQL'),
(769, 177, '_navyk_title', 'field_605b2192827d0'),
(770, 177, 'navyk_description', 'С MySQL я познакомился при изучении различных PHP фреймворков.\r\nЯ могу не только создавать таблицы и разрабатывать SQL запросы, но и разрабатывать процедуры и функции.'),
(771, 177, '_navyk_description', 'field_605b222d827d1'),
(772, 177, 'navyk_img', '83'),
(773, 177, '_navyk_img', 'field_605b2257827d2'),
(774, 177, 'navyk_link', 'http:\\\\mysql.org'),
(775, 177, '_navyk_link', 'field_605c3952f1072'),
(776, 177, 'navyk_icon', 'icon-database text-white'),
(777, 177, '_navyk_icon', 'field_6086a6c64020d'),
(780, 178, 'navyk_title', 'PHP'),
(781, 178, '_navyk_title', 'field_605b2192827d0'),
(782, 178, 'navyk_description', 'С языком программирования PHP я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(783, 178, '_navyk_description', 'field_605b222d827d1'),
(784, 178, 'navyk_img', '85'),
(785, 178, '_navyk_img', 'field_605b2257827d2'),
(786, 178, 'navyk_link', 'http:\\\\php.net'),
(787, 178, '_navyk_link', 'field_605c3952f1072'),
(788, 178, 'navyk_icon', 'icon-wordpress text-white'),
(789, 178, '_navyk_icon', 'field_6086a6c64020d'),
(792, 179, 'navyk_title', 'PHP'),
(793, 179, '_navyk_title', 'field_605b2192827d0'),
(794, 179, 'navyk_description', 'С языком программирования PHP я начал знакомиться еще в 2014 году, но это были эпизодические задачи для собственного развития.\r\nСерьезно я взялся за изучение этого языка в 2018 году, когда передо мной встала задача разработать вебприложение для тестирования сотрудников.\r\nЦелых два года я перебирал различные PHP фреймворки (Yii 2, CakePHP, Laravel) и различные CMS (Drupal, Joomla, WordPress).\r\nВообще работа с фреймворками, а тем более с CMS, не способствует глубокому изучению языка, поэтому мои знания PHP находятся на уровне достаточным для работы с фреймворками или CMS. '),
(795, 179, '_navyk_description', 'field_605b222d827d1'),
(796, 179, 'navyk_img', '85'),
(797, 179, '_navyk_img', 'field_605b2257827d2'),
(798, 179, 'navyk_link', 'http:\\\\php.net'),
(799, 179, '_navyk_link', 'field_605c3952f1072'),
(800, 179, 'navyk_icon', 'icon-wordpress text-white'),
(801, 179, '_navyk_icon', 'field_6086a6c64020d'),
(805, 181, '_menu_item_type', 'post_type'),
(806, 181, '_menu_item_menu_item_parent', '0'),
(807, 181, '_menu_item_object_id', '91'),
(808, 181, '_menu_item_object', 'page'),
(809, 181, '_menu_item_target', ''),
(810, 181, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(811, 181, '_menu_item_xfn', ''),
(812, 181, '_menu_item_url', ''),
(814, 182, '_menu_item_type', 'custom'),
(815, 182, '_menu_item_menu_item_parent', '0'),
(816, 182, '_menu_item_object_id', '182'),
(817, 182, '_menu_item_object', 'custom'),
(818, 182, '_menu_item_target', ''),
(819, 182, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(820, 182, '_menu_item_xfn', ''),
(821, 182, '_menu_item_url', 'http://self-made-programmer.loc'),
(823, 183, '_menu_item_type', 'custom'),
(824, 183, '_menu_item_menu_item_parent', '0'),
(825, 183, '_menu_item_object_id', '183'),
(826, 183, '_menu_item_object', 'custom'),
(827, 183, '_menu_item_target', ''),
(828, 183, '_menu_item_classes', 'a:1:{i:0;s:13:"icon-telegram";}'),
(829, 183, '_menu_item_xfn', ''),
(830, 183, '_menu_item_url', 'https://telegramm.io'),
(832, 184, '_menu_item_type', 'custom'),
(833, 184, '_menu_item_menu_item_parent', '0'),
(834, 184, '_menu_item_object_id', '184'),
(835, 184, '_menu_item_object', 'custom'),
(836, 184, '_menu_item_target', ''),
(837, 184, '_menu_item_classes', 'a:1:{i:0;s:7:"icon-vk";}'),
(838, 184, '_menu_item_xfn', ''),
(839, 184, '_menu_item_url', 'https://vk.com'),
(841, 185, '_menu_item_type', 'post_type'),
(842, 185, '_menu_item_menu_item_parent', '181'),
(843, 185, '_menu_item_object_id', '62'),
(844, 185, '_menu_item_object', 'post'),
(845, 185, '_menu_item_target', ''),
(846, 185, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(847, 185, '_menu_item_xfn', ''),
(848, 185, '_menu_item_url', ''),
(850, 186, '_menu_item_type', 'post_type'),
(851, 186, '_menu_item_menu_item_parent', '181'),
(852, 186, '_menu_item_object_id', '60'),
(853, 186, '_menu_item_object', 'post'),
(854, 186, '_menu_item_target', ''),
(855, 186, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(856, 186, '_menu_item_xfn', ''),
(857, 186, '_menu_item_url', ''),
(859, 187, '_menu_item_type', 'post_type'),
(860, 187, '_menu_item_menu_item_parent', '181'),
(861, 187, '_menu_item_object_id', '58'),
(862, 187, '_menu_item_object', 'post'),
(863, 187, '_menu_item_target', ''),
(864, 187, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(865, 187, '_menu_item_xfn', ''),
(866, 187, '_menu_item_url', ''),
(868, 188, '_wp_trash_meta_status', 'publish'),
(869, 188, '_wp_trash_meta_time', '1619610878'),
(870, 189, '_wp_trash_meta_status', 'publish'),
(871, 189, '_wp_trash_meta_time', '1619610889'),
(875, 190, 'slider_img', '72'),
(876, 190, '_slider_img', 'field_605c3079460c7'),
(877, 190, 'slider_color', 'dark'),
(878, 190, '_slider_color', 'field_605c30bf460c8'),
(879, 190, 'slider_btn', 'off'),
(880, 190, '_slider_btn', 'field_605c3107460c9'),
(881, 190, 'slider_link', 'http:\\\\wordpress.org'),
(882, 190, '_slider_link', 'field_605c3123460ca'),
(885, 191, 'slider_img', '74'),
(886, 191, '_slider_img', 'field_605c3079460c7'),
(887, 191, 'slider_color', 'white'),
(888, 191, '_slider_color', 'field_605c30bf460c8'),
(889, 191, 'slider_btn', 'off'),
(890, 191, '_slider_btn', 'field_605c3107460c9'),
(891, 191, 'slider_link', 'http:\\\\drupal.org'),
(892, 191, '_slider_link', 'field_605c3123460ca'),
(895, 192, 'slider_img', '76'),
(896, 192, '_slider_img', 'field_605c3079460c7'),
(897, 192, 'slider_color', 'white'),
(898, 192, '_slider_color', 'field_605c30bf460c8'),
(899, 192, 'slider_btn', 'off'),
(900, 192, '_slider_btn', 'field_605c3107460c9'),
(901, 192, 'slider_link', 'http:\\\\cakephp.org'),
(902, 192, '_slider_link', 'field_605c3123460ca'),
(903, 193, '_wp_trash_meta_status', 'publish'),
(904, 193, '_wp_trash_meta_time', '1619686745'),
(905, 194, '_wp_trash_meta_status', 'publish'),
(906, 194, '_wp_trash_meta_time', '1619693909'),
(907, 195, '_edit_lock', '1619694070:1'),
(908, 195, '_wp_trash_meta_status', 'publish'),
(909, 195, '_wp_trash_meta_time', '1619694080'),
(910, 196, '_wp_trash_meta_status', 'publish'),
(911, 196, '_wp_trash_meta_time', '1619694097'),
(912, 197, '_wp_trash_meta_status', 'publish'),
(913, 197, '_wp_trash_meta_time', '1619695962'),
(914, 198, '_wp_trash_meta_status', 'publish'),
(915, 198, '_wp_trash_meta_time', '1619696290'),
(916, 199, '_wp_trash_meta_status', 'publish'),
(917, 199, '_wp_trash_meta_time', '1619696395');

-- 
-- Вывод данных для таблицы wp_posts
--
INSERT INTO wp_posts VALUES
(1, 1, '2021-03-21 22:32:36', '2021-03-21 19:32:36', '', 'Я учусь создавать сайты на WordPress', '', 'publish', 'open', 'open', '', 'ya-uchus-sozdavat-sajty-na-wordpress', '', '', '2021-04-28 15:02:41', '2021-04-28 12:02:41', '', 0, 'http://portfolio.loc/?p=1', 0, 'post', '', 1),
(2, 1, '2021-03-21 22:32:36', '2021-03-21 19:32:36', '<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2021-04-24 07:28:53', '2021-04-24 04:28:53', '', 0, 'http://portfolio.loc/?page_id=2', 0, 'page', '', 0),
(17, 1, '2021-03-21 16:12:05', '2021-03-21 13:12:05', '', 'Логотип', '', 'inherit', 'open', 'closed', '', 'images-1', '', '', '2021-03-21 16:12:37', '2021-03-21 13:12:37', '', 0, 'http://portfolio.loc/wp-content/uploads/2021/03/images-1.png', 0, 'attachment', 'image/png', 0),
(18, 1, '2021-03-21 16:12:42', '2021-03-21 13:12:42', 'http://portfolio.loc/wp-content/uploads/2021/03/cropped-images-1.png', 'cropped-images-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-images-1-png', '', '', '2021-03-21 16:12:42', '2021-03-21 13:12:42', '', 0, 'http://portfolio.loc/wp-content/uploads/2021/03/cropped-images-1.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2021-03-21 16:24:57', '2021-03-21 13:24:57', '', 'logoDelphiRGB', '', 'inherit', 'open', 'closed', '', 'logodelphirgb', '', '', '2021-03-21 16:24:57', '2021-03-21 13:24:57', '', 0, 'http://portfolio.loc/wp-content/uploads/2021/03/logodelphirgb.png', 0, 'attachment', 'image/png', 0),
(22, 1, '2021-03-24 14:32:23', '2021-03-24 11:32:23', 'a:7:{s:8:"location";a:2:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"91";}}i:1;a:1:{i:0;a:3:{s:5:"param";s:13:"post_category";s:8:"operator";s:2:"==";s:5:"value";s:14:"category:navyk";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Мои навыки', 'moi-navyki', 'publish', 'closed', 'closed', '', 'group_605b21448a1db', '', '', '2021-04-26 16:32:29', '2021-04-26 13:32:29', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=22', 0, 'acf-field-group', '', 0),
(23, 1, '2021-03-24 14:32:23', '2021-03-24 11:32:23', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:46:"Укажите заголовок навыка";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Заголовок в описании навыка', 'navyk_title', 'publish', 'closed', 'closed', '', 'field_605b2192827d0', '', '', '2021-03-24 14:32:23', '2021-03-24 11:32:23', '', 22, 'http://portfolio.loc/?post_type=acf-field&p=23', 0, 'acf-field', '', 0),
(24, 1, '2021-03-24 14:32:23', '2021-03-24 11:32:23', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:44:"Укажите описание навыка";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:2:"br";}', 'Описание навыка', 'navyk_description', 'publish', 'closed', 'closed', '', 'field_605b222d827d1', '', '', '2021-03-24 14:32:23', '2021-03-24 11:32:23', '', 22, 'http://portfolio.loc/?post_type=acf-field&p=24', 1, 'acf-field', '', 0),
(25, 1, '2021-03-24 14:32:23', '2021-03-24 11:32:23', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:52:"Картинка обозначающая навык";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:3:"url";s:12:"preview_size";s:4:"full";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Изображение навыка', 'navyk_img', 'publish', 'closed', 'closed', '', 'field_605b2257827d2', '', '', '2021-03-24 14:32:23', '2021-03-24 11:32:23', '', 22, 'http://portfolio.loc/?post_type=acf-field&p=25', 2, 'acf-field', '', 0),
(27, 1, '2021-03-24 14:35:14', '2021-03-24 11:35:14', '', 'rad-studio-02', '', 'inherit', 'open', 'closed', '', 'rad-studio-02', '', '', '2021-03-24 14:35:39', '2021-03-24 11:35:39', '', 2, 'http://portfolio.loc/wp-content/uploads/2021/03/rad-studio-02.png', 0, 'attachment', 'image/png', 0),
(28, 1, '2021-03-24 15:32:58', '2021-03-24 12:32:58', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 15:32:58', '2021-03-24 12:32:58', '', 2, 'http://portfolio.loc/?p=28', 0, 'revision', '', 0),
(29, 1, '2021-03-24 15:33:00', '2021-03-24 12:33:00', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 15:33:00', '2021-03-24 12:33:00', '', 2, 'http://portfolio.loc/?p=29', 0, 'revision', '', 0),
(30, 1, '2021-03-24 15:43:27', '2021-03-24 12:43:27', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"89";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Обо мне', 'obo-mne', 'publish', 'closed', 'closed', '', 'group_605b3344cf595', '', '', '2021-04-09 15:53:42', '2021-04-09 12:53:42', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=30', 0, 'acf-field-group', '', 0),
(31, 1, '2021-03-24 15:43:27', '2021-03-24 12:43:27', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:43:"Укажите заголовок о Вас";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Заголовок', 'about_title', 'publish', 'closed', 'closed', '', 'field_605b335f43d5e', '', '', '2021-03-24 16:11:14', '2021-03-24 13:11:14', '', 30, 'http://portfolio.loc/?post_type=acf-field&#038;p=31', 0, 'acf-field', '', 0),
(32, 1, '2021-03-24 15:43:27', '2021-03-24 12:43:27', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:40:"Введите описание себя";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:2:"br";}', 'Описание', 'about_description', 'publish', 'closed', 'closed', '', 'field_605b338843d5f', '', '', '2021-03-24 16:11:14', '2021-03-24 13:11:14', '', 30, 'http://portfolio.loc/?post_type=acf-field&#038;p=32', 1, 'acf-field', '', 0),
(33, 1, '2021-03-24 15:43:28', '2021-03-24 12:43:28', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:55:"Выберите изображение для себя";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:4:"full";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Изображение', 'about_img', 'publish', 'closed', 'closed', '', 'field_605b33ba43d60', '', '', '2021-04-09 15:53:42', '2021-04-09 12:53:42', '', 30, 'http://portfolio.loc/?post_type=acf-field&#038;p=33', 2, 'acf-field', '', 0),
(34, 1, '2021-03-24 15:46:11', '2021-03-24 12:46:11', '', 'community-reverse', '', 'inherit', 'open', 'closed', '', 'community-reverse', '', '', '2021-03-24 15:46:23', '2021-03-24 12:46:23', '', 2, 'http://portfolio.loc/wp-content/uploads/2021/03/community-reverse.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2021-03-24 15:46:29', '2021-03-24 12:46:29', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 15:46:29', '2021-03-24 12:46:29', '', 2, 'http://portfolio.loc/?p=35', 0, 'revision', '', 0),
(39, 1, '2021-03-24 16:13:04', '2021-03-24 13:13:04', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:1:"2";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Общая информация по сайту', 'obshhaya-informacziya-po-sajtu', 'publish', 'closed', 'closed', '', 'group_605b3a7d4edd4', '', '', '2021-04-28 09:28:02', '2021-04-28 06:28:02', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=39', 0, 'acf-field-group', '', 0),
(40, 1, '2021-03-24 16:13:04', '2021-03-24 13:13:04', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Почта', 'mail', 'publish', 'closed', 'closed', '', 'field_605b3a97f0902', '', '', '2021-03-24 16:13:04', '2021-03-24 13:13:04', '', 39, 'http://portfolio.loc/?post_type=acf-field&p=40', 0, 'acf-field', '', 0),
(41, 1, '2021-03-24 16:14:25', '2021-03-24 13:14:25', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 16:14:25', '2021-03-24 13:14:25', '', 2, 'http://portfolio.loc/?p=41', 0, 'revision', '', 0),
(42, 1, '2021-03-24 16:19:50', '2021-03-24 13:19:50', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:50:"Введите контактный телефон";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Телефон', 'phone', 'publish', 'closed', 'closed', '', 'field_605b3c2ea285c', '', '', '2021-03-24 16:19:50', '2021-03-24 13:19:50', '', 39, 'http://portfolio.loc/?post_type=acf-field&p=42', 1, 'acf-field', '', 0),
(43, 1, '2021-03-24 16:19:50', '2021-03-24 13:19:50', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:34:"Введите свой адрес";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Адрес', 'adress', 'publish', 'closed', 'closed', '', 'field_605b3c60a285d', '', '', '2021-03-24 16:19:50', '2021-03-24 13:19:50', '', 39, 'http://portfolio.loc/?post_type=acf-field&p=43', 2, 'acf-field', '', 0),
(44, 1, '2021-03-24 16:20:57', '2021-03-24 13:20:57', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 16:20:57', '2021-03-24 13:20:57', '', 2, 'http://portfolio.loc/?p=44', 0, 'revision', '', 0),
(45, 1, '2021-03-24 16:23:11', '2021-03-24 13:23:11', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-24 16:23:11', '2021-03-24 13:23:11', '', 2, 'http://portfolio.loc/?p=45', 0, 'revision', '', 0),
(46, 1, '2021-03-25 08:34:28', '2021-03-25 05:34:28', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:13:"post_category";s:8:"operator";s:2:"==";s:5:"value";s:22:"category:moya-istoriya";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Моя история', 'moya-istoriya', 'publish', 'closed', 'closed', '', 'group_605c202e8de3b', '', '', '2021-04-09 15:53:05', '2021-04-09 12:53:05', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=46', 0, 'acf-field-group', '', 0),
(47, 1, '2021-03-25 08:34:28', '2021-03-25 05:34:28', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:33:"Введите заголовок";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Заголовок', 'history_title', 'publish', 'closed', 'closed', '', 'field_605c207638aba', '', '', '2021-04-09 15:53:05', '2021-04-09 12:53:05', '', 46, 'http://portfolio.loc/?post_type=acf-field&#038;p=47', 0, 'acf-field', '', 0),
(48, 1, '2021-03-25 08:34:28', '2021-03-25 05:34:28', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:31:"Введите описание";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:2:"br";}', 'Описание', 'history_description', 'publish', 'closed', 'closed', '', 'field_605c209738abb', '', '', '2021-03-25 08:34:28', '2021-03-25 05:34:28', '', 46, 'http://portfolio.loc/?post_type=acf-field&p=48', 1, 'acf-field', '', 0),
(49, 1, '2021-03-25 08:34:29', '2021-03-25 05:34:29', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:4:"full";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Изображение', 'history_img', 'publish', 'closed', 'closed', '', 'field_605c20c338abc', '', '', '2021-04-09 15:53:05', '2021-04-09 12:53:05', '', 46, 'http://portfolio.loc/?post_type=acf-field&#038;p=49', 2, 'acf-field', '', 0),
(50, 1, '2021-03-25 08:41:15', '2021-03-25 05:41:15', '', 'course_2', '', 'inherit', 'open', 'closed', '', 'course_2', '', '', '2021-03-25 08:41:28', '2021-03-25 05:41:28', '', 2, 'http://portfolio.loc/wp-content/uploads/2021/03/course_2.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2021-03-25 08:41:36', '2021-03-25 05:41:36', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-03-25 08:41:36', '2021-03-25 05:41:36', '', 2, 'http://portfolio.loc/?p=51', 0, 'revision', '', 0),
(53, 1, '2021-03-25 08:52:51', '2021-03-25 05:52:51', '', 'Я учусь создавать сайты на WordPress', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2021-03-25 08:52:51', '2021-03-25 05:52:51', '', 1, 'http://portfolio.loc/?p=53', 0, 'revision', '', 0),
(54, 1, '2021-03-25 08:54:10', '2021-03-25 05:54:10', '', 'Я уже кое что умею делать на WordPress', '', 'publish', 'open', 'open', '', 'ya-uzhe-koe-chto-umeyu-delat-na-wordpress', '', '', '2021-04-28 15:01:56', '2021-04-28 12:01:56', '', 0, 'http://portfolio.loc/?p=54', 0, 'post', '', 0),
(55, 1, '2021-03-25 08:54:10', '2021-03-25 05:54:10', '', 'Я уже кое что умею делать на WordPress', '', 'inherit', 'closed', 'closed', '', '54-revision-v1', '', '', '2021-03-25 08:54:10', '2021-03-25 05:54:10', '', 54, 'http://portfolio.loc/?p=55', 0, 'revision', '', 0),
(56, 1, '2021-03-25 08:56:17', '2021-03-25 05:56:17', '', 'Мои планы на будущее', '', 'publish', 'open', 'open', '', 'moi-plany-na-budushhee', '', '', '2021-04-28 15:01:14', '2021-04-28 12:01:14', '', 0, 'http://portfolio.loc/?p=56', 0, 'post', '', 0),
(57, 1, '2021-03-25 08:56:17', '2021-03-25 05:56:17', '', 'Мои планы на будущее', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2021-03-25 08:56:17', '2021-03-25 05:56:17', '', 56, 'http://portfolio.loc/?p=57', 0, 'revision', '', 0),
(58, 1, '2021-03-25 09:00:29', '2021-03-25 06:00:29', '<!-- wp:image {"align":"center","id":102,"width":624,"height":390,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large is-resized"><img src="https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash-1024x641.png" alt="" class="wp-image-102" width="624" height="390"/><figcaption>Delphi 10.2.3</figcaption></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p class="has-text-align-center">Все что здесь написано добавлено через админку в Gutenberg</p>\n<!-- /wp:paragraph -->', 'Delphi', '', 'publish', 'open', 'open', '', 'delphi', '', '', '2021-04-26 16:41:25', '2021-04-26 13:41:25', '', 0, 'http://portfolio.loc/?p=58', 0, 'post', '', 0),
(59, 1, '2021-03-25 09:00:29', '2021-03-25 06:00:29', '', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-03-25 09:00:29', '2021-03-25 06:00:29', '', 58, 'http://portfolio.loc/?p=59', 0, 'revision', '', 0),
(60, 1, '2021-03-25 09:00:57', '2021-03-25 06:00:57', '', 'PHP', '', 'publish', 'closed', 'closed', '', 'php', '', '', '2021-04-27 11:06:41', '2021-04-27 08:06:41', '', 0, 'http://portfolio.loc/?p=60', 0, 'post', '', 0),
(61, 1, '2021-03-25 09:00:57', '2021-03-25 06:00:57', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-03-25 09:00:57', '2021-03-25 06:00:57', '', 60, 'http://portfolio.loc/?p=61', 0, 'revision', '', 0),
(62, 1, '2021-03-25 09:01:21', '2021-03-25 06:01:21', '', 'MySQL', '', 'publish', 'open', 'open', '', 'mysql', '', '', '2021-04-26 16:46:36', '2021-04-26 13:46:36', '', 0, 'http://portfolio.loc/?p=62', 0, 'post', '', 0),
(63, 1, '2021-03-25 09:01:21', '2021-03-25 06:01:21', '', 'MySQL', '', 'inherit', 'closed', 'closed', '', '62-revision-v1', '', '', '2021-03-25 09:01:21', '2021-03-25 06:01:21', '', 62, 'http://portfolio.loc/?p=63', 0, 'revision', '', 0),
(64, 1, '2021-03-25 09:01:52', '2021-03-25 06:01:52', '', 'FireBird', '', 'publish', 'open', 'open', '', 'firebird', '', '', '2021-03-25 10:34:38', '2021-03-25 07:34:38', '', 0, 'http://portfolio.loc/?p=64', 0, 'post', '', 0),
(65, 1, '2021-03-25 09:01:52', '2021-03-25 06:01:52', '', 'FireBird', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2021-03-25 09:01:52', '2021-03-25 06:01:52', '', 64, 'http://portfolio.loc/?p=65', 0, 'revision', '', 0),
(67, 1, '2021-03-25 09:44:58', '2021-03-25 06:44:58', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:13:"post_category";s:8:"operator";s:2:"==";s:5:"value";s:15:"category:slider";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Слайдер', 'slajder', 'publish', 'closed', 'closed', '', 'group_605c305d868e7', '', '', '2021-03-25 09:44:59', '2021-03-25 06:44:59', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=67', 0, 'acf-field-group', '', 0),
(68, 1, '2021-03-25 09:44:58', '2021-03-25 06:44:58', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:3:"url";s:12:"preview_size";s:4:"full";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Изображение', 'slider_img', 'publish', 'closed', 'closed', '', 'field_605c3079460c7', '', '', '2021-03-25 09:44:58', '2021-03-25 06:44:58', '', 67, 'http://portfolio.loc/?post_type=acf-field&p=68', 0, 'acf-field', '', 0),
(69, 1, '2021-03-25 09:44:58', '2021-03-25 06:44:58', 'a:12:{s:4:"type";s:5:"radio";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:2:{s:5:"white";s:5:"white";s:4:"dark";s:4:"dark";}s:10:"allow_null";i:0;s:12:"other_choice";i:0;s:13:"default_value";s:0:"";s:6:"layout";s:8:"vertical";s:13:"return_format";s:5:"value";s:17:"save_other_choice";i:0;}', 'Цвет текста', 'slider_color', 'publish', 'closed', 'closed', '', 'field_605c30bf460c8', '', '', '2021-03-25 09:44:58', '2021-03-25 06:44:58', '', 67, 'http://portfolio.loc/?post_type=acf-field&p=69', 1, 'acf-field', '', 0),
(70, 1, '2021-03-25 09:44:59', '2021-03-25 06:44:59', 'a:12:{s:4:"type";s:5:"radio";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:2:{s:2:"on";s:2:"on";s:3:"off";s:3:"off";}s:10:"allow_null";i:0;s:12:"other_choice";i:0;s:13:"default_value";s:0:"";s:6:"layout";s:8:"vertical";s:13:"return_format";s:5:"value";s:17:"save_other_choice";i:0;}', 'Кнопка', 'slider_btn', 'publish', 'closed', 'closed', '', 'field_605c3107460c9', '', '', '2021-03-25 09:44:59', '2021-03-25 06:44:59', '', 67, 'http://portfolio.loc/?post_type=acf-field&p=70', 2, 'acf-field', '', 0),
(71, 1, '2021-03-25 09:44:59', '2021-03-25 06:44:59', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_605c3107460c9";s:8:"operator";s:2:"==";s:5:"value";s:2:"on";}}}s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Ссылка на ресурс', 'slider_link', 'publish', 'closed', 'closed', '', 'field_605c3123460ca', '', '', '2021-03-25 09:44:59', '2021-03-25 06:44:59', '', 67, 'http://portfolio.loc/?post_type=acf-field&p=71', 3, 'acf-field', '', 0),
(72, 1, '2021-03-25 09:51:48', '2021-03-25 06:51:48', '', 'blog_1', '', 'inherit', 'open', 'closed', '', 'blog_1', '', '', '2021-03-25 09:51:48', '2021-03-25 06:51:48', '', 56, 'http://portfolio.loc/wp-content/uploads/2021/03/blog_1.jpg', 0, 'attachment', 'image/jpeg', 0),
(73, 1, '2021-03-25 09:52:28', '2021-03-25 06:52:28', '', 'Мои планы на будущее', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2021-03-25 09:52:28', '2021-03-25 06:52:28', '', 56, 'http://portfolio.loc/?p=73', 0, 'revision', '', 0),
(74, 1, '2021-03-25 09:52:57', '2021-03-25 06:52:57', '', 'bg_1', '', 'inherit', 'open', 'closed', '', 'bg_1', '', '', '2021-03-25 09:53:14', '2021-03-25 06:53:14', '', 54, 'http://portfolio.loc/wp-content/uploads/2021/03/bg_1.jpg', 0, 'attachment', 'image/jpeg', 0),
(75, 1, '2021-03-25 09:53:43', '2021-03-25 06:53:43', '', 'Я уже кое что умею делать на WordPress', '', 'inherit', 'closed', 'closed', '', '54-revision-v1', '', '', '2021-03-25 09:53:43', '2021-03-25 06:53:43', '', 54, 'http://portfolio.loc/?p=75', 0, 'revision', '', 0),
(76, 1, '2021-03-25 09:54:28', '2021-03-25 06:54:28', '', 'bg_2', '', 'inherit', 'open', 'closed', '', 'bg_2', '', '', '2021-03-25 09:54:51', '2021-03-25 06:54:51', '', 1, 'http://portfolio.loc/wp-content/uploads/2021/03/bg_2.jpg', 0, 'attachment', 'image/jpeg', 0),
(78, 1, '2021-03-25 09:55:29', '2021-03-25 06:55:29', '', 'Я учусь создавать сайты на WordPress', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2021-03-25 09:55:29', '2021-03-25 06:55:29', '', 1, 'http://portfolio.loc/?p=78', 0, 'revision', '', 0),
(80, 1, '2021-03-25 10:19:21', '2021-03-25 07:19:21', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Ссылка на ресурс', 'navyk_link', 'publish', 'closed', 'closed', '', 'field_605c3952f1072', '', '', '2021-03-25 10:19:21', '2021-03-25 07:19:21', '', 22, 'http://portfolio.loc/?post_type=acf-field&p=80', 3, 'acf-field', '', 0),
(81, 1, '2021-03-25 10:32:33', '2021-03-25 07:32:33', '', 'Без названия', '', 'inherit', 'open', 'closed', '', 'bez-nazvaniya', '', '', '2021-03-25 10:32:42', '2021-03-25 07:32:42', '', 64, 'http://portfolio.loc/wp-content/uploads/2021/03/bez-nazvaniya.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2021-03-25 10:34:38', '2021-03-25 07:34:38', '', 'FireBird', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2021-03-25 10:34:38', '2021-03-25 07:34:38', '', 64, 'http://portfolio.loc/?p=82', 0, 'revision', '', 0),
(83, 1, '2021-03-25 10:35:09', '2021-03-25 07:35:09', '', 'Без названия', '', 'inherit', 'open', 'closed', '', 'bez-nazvaniya-2', '', '', '2021-03-25 10:35:17', '2021-03-25 07:35:17', '', 62, 'http://portfolio.loc/wp-content/uploads/2021/03/bez-nazvaniya.png', 0, 'attachment', 'image/png', 0),
(84, 1, '2021-03-25 10:36:52', '2021-03-25 07:36:52', '', 'MySQL', '', 'inherit', 'closed', 'closed', '', '62-revision-v1', '', '', '2021-03-25 10:36:52', '2021-03-25 07:36:52', '', 62, 'http://portfolio.loc/?p=84', 0, 'revision', '', 0),
(85, 1, '2021-03-25 10:37:26', '2021-03-25 07:37:26', '', 'images (2)', '', 'inherit', 'open', 'closed', '', 'images-2', '', '', '2021-03-25 10:37:37', '2021-03-25 07:37:37', '', 60, 'http://portfolio.loc/wp-content/uploads/2021/03/images-2.png', 0, 'attachment', 'image/png', 0),
(86, 1, '2021-03-25 10:44:17', '2021-03-25 07:44:17', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-03-25 10:44:17', '2021-03-25 07:44:17', '', 60, 'http://portfolio.loc/?p=86', 0, 'revision', '', 0),
(87, 1, '2021-03-25 10:45:06', '2021-03-25 07:45:06', '', 'delphi10.4', '', 'inherit', 'open', 'closed', '', 'delphi10-4', '', '', '2021-03-25 10:45:14', '2021-03-25 07:45:14', '', 58, 'http://portfolio.loc/wp-content/uploads/2021/03/delphi10.4.png', 0, 'attachment', 'image/png', 0),
(88, 1, '2021-03-25 10:47:03', '2021-03-25 07:47:03', '', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-03-25 10:47:03', '2021-03-25 07:47:03', '', 58, 'http://portfolio.loc/?p=88', 0, 'revision', '', 0),
(89, 1, '2021-03-29 09:57:39', '2021-03-29 06:57:39', '', 'Обо мне', '', 'publish', 'closed', 'closed', '', 'obo-mne', '', '', '2021-03-29 09:59:17', '2021-03-29 06:59:17', '', 0, 'http://portfolio.loc/?page_id=89', 0, 'page', '', 0),
(90, 1, '2021-03-29 09:57:39', '2021-03-29 06:57:39', '', 'Обо мне', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2021-03-29 09:57:39', '2021-03-29 06:57:39', '', 89, 'http://portfolio.loc/?p=90', 0, 'revision', '', 0),
(91, 1, '2021-03-29 09:59:43', '2021-03-29 06:59:43', '', 'Навыки', '', 'publish', 'closed', 'closed', '', 'navyki', '', '', '2021-03-29 09:59:43', '2021-03-29 06:59:43', '', 0, 'http://portfolio.loc/?page_id=91', 0, 'page', '', 0),
(92, 1, '2021-03-29 09:59:43', '2021-03-29 06:59:43', '', 'Навыки', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2021-03-29 09:59:43', '2021-03-29 06:59:43', '', 91, 'http://portfolio.loc/?p=92', 0, 'revision', '', 0),
(93, 1, '2021-03-29 10:00:08', '2021-03-29 07:00:08', '', 'Контакты', '', 'draft', 'closed', 'closed', '', 'kontakty', '', '', '2021-04-05 10:15:13', '2021-04-05 07:15:13', '', 0, 'http://portfolio.loc/?page_id=93', 0, 'page', '', 0),
(94, 1, '2021-03-29 10:00:08', '2021-03-29 07:00:08', '', 'Контакты', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2021-03-29 10:00:08', '2021-03-29 07:00:08', '', 93, 'http://portfolio.loc/?p=94', 0, 'revision', '', 0),
(95, 1, '2021-03-29 10:00:31', '2021-03-29 07:00:31', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Моя история', '', 'publish', 'closed', 'closed', '', 'moya-istoriya', '', '', '2021-04-04 21:23:16', '2021-04-04 18:23:16', '', 0, 'http://portfolio.loc/?page_id=95', 0, 'page', '', 0),
(96, 1, '2021-03-29 10:00:31', '2021-03-29 07:00:31', '', 'Моя история', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2021-03-29 10:00:31', '2021-03-29 07:00:31', '', 95, 'http://portfolio.loc/?p=96', 0, 'revision', '', 0),
(97, 1, '2021-03-29 10:37:43', '2021-03-29 07:37:43', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"93";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Контакты', 'kontakty', 'publish', 'closed', 'closed', '', 'group_60617b2aa0bc1', '', '', '2021-04-09 15:56:17', '2021-04-09 12:56:17', '', 0, 'http://portfolio.loc/?post_type=acf-field-group&#038;p=97', 0, 'acf-field-group', '', 0),
(98, 1, '2021-03-29 10:37:44', '2021-03-29 07:37:44', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:50:"Введите контактный телефон";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Телефон', 'contact_telefon', 'publish', 'closed', 'closed', '', 'field_60617b4bd2943', '', '', '2021-04-09 15:55:37', '2021-04-09 12:55:37', '', 97, 'http://portfolio.loc/?post_type=acf-field&#038;p=98', 0, 'acf-field', '', 0),
(99, 1, '2021-03-29 10:37:44', '2021-03-29 07:37:44', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:59:"Введите адрес электронной почты";s:8:"required";i:1;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Электронная почта', 'contact_email', 'publish', 'closed', 'closed', '', 'field_60617b6ed2944', '', '', '2021-04-09 15:55:37', '2021-04-09 12:55:37', '', 97, 'http://portfolio.loc/?post_type=acf-field&#038;p=99', 1, 'acf-field', '', 0),
(100, 1, '2021-03-30 09:59:42', '2021-03-30 06:59:42', '', '69', '', 'inherit', 'open', 'closed', '', '69', '', '', '2021-03-30 09:59:42', '2021-03-30 06:59:42', '', 0, 'https://portfolio.loc/wp-content/uploads/2021/03/69.png', 0, 'attachment', 'image/png', 0),
(101, 1, '2021-03-30 09:59:47', '2021-03-30 06:59:47', '', 'D9QXnvLXYAEbY-S', '', 'inherit', 'open', 'closed', '', 'd9qxnvlxyaeby-s', '', '', '2021-03-30 09:59:47', '2021-03-30 06:59:47', '', 0, 'https://portfolio.loc/wp-content/uploads/2021/03/d9qxnvlxyaeby-s.png', 0, 'attachment', 'image/png', 0),
(102, 1, '2021-03-30 09:59:53', '2021-03-30 06:59:53', '', 'Delphi_10.2.3_CE_Splash', '', 'inherit', 'open', 'closed', '', 'delphi_10-2-3_ce_splash', '', '', '2021-03-31 12:05:06', '2021-03-31 09:05:06', '', 95, 'https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash.png', 0, 'attachment', 'image/png', 0),
(103, 1, '2021-03-30 09:59:59', '2021-03-30 06:59:59', '', 'hands', '', 'inherit', 'open', 'closed', '', 'hands', '', '', '2021-03-30 09:59:59', '2021-03-30 06:59:59', '', 0, 'https://portfolio.loc/wp-content/uploads/2021/03/hands.jpg', 0, 'attachment', 'image/jpeg', 0),
(104, 1, '2021-03-30 10:00:03', '2021-03-30 07:00:03', '', 'konsol_wordpress', '', 'inherit', 'open', 'closed', '', 'konsol_wordpress', '', '', '2021-03-30 10:00:03', '2021-03-30 07:00:03', '', 0, 'https://portfolio.loc/wp-content/uploads/2021/03/konsol_wordpress.jpg', 0, 'attachment', 'image/jpeg', 0),
(106, 1, '2021-03-30 10:02:15', '2021-03-30 07:02:15', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit "Submit"]\n[_site_title] "[your-subject]"\n[_site_title] <admin@portfolio.loc>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] "[your-subject]"\n[_site_title] <admin@portfolio.loc>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2021-03-30 10:02:15', '2021-03-30 07:02:15', '', 0, 'https://portfolio.loc/?post_type=wpcf7_contact_form&p=106', 0, 'wpcf7_contact_form', '', 0),
(108, 1, '2021-03-30 13:47:55', '2021-03-30 10:47:55', '{\n    "nav_menu[-767294467]": {\n        "value": {\n            "name": "Main",\n            "description": "",\n            "parent": 0,\n            "auto_add": true\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    },\n    "nav_menu_item[-1415445877]": {\n        "value": {\n            "object_id": 2,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "post_type",\n            "title": "\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f",\n            "url": "https://portfolio.loc/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f",\n            "nav_menu_term_id": -767294467,\n            "_invalid": false,\n            "type_label": "\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    },\n    "nav_menu_item[-1919545136]": {\n        "value": {\n            "object_id": 95,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "\\u041c\\u043e\\u044f \\u0438\\u0441\\u0442\\u043e\\u0440\\u0438\\u044f",\n            "url": "https://portfolio.loc/moya-istoriya/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u041c\\u043e\\u044f \\u0438\\u0441\\u0442\\u043e\\u0440\\u0438\\u044f",\n            "nav_menu_term_id": -767294467,\n            "_invalid": false,\n            "type_label": "\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    },\n    "nav_menu_item[-1077082722]": {\n        "value": {\n            "object_id": 93,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 5,\n            "type": "post_type",\n            "title": "\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b",\n            "url": "https://portfolio.loc/kontakty/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b",\n            "nav_menu_term_id": -767294467,\n            "_invalid": false,\n            "type_label": "\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    },\n    "nav_menu_item[-922198158]": {\n        "value": {\n            "object_id": 91,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "post_type",\n            "title": "\\u041d\\u0430\\u0432\\u044b\\u043a\\u0438",\n            "url": "https://portfolio.loc/navyki/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u041d\\u0430\\u0432\\u044b\\u043a\\u0438",\n            "nav_menu_term_id": -767294467,\n            "_invalid": false,\n            "type_label": "\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    },\n    "nav_menu_item[-1171170573]": {\n        "value": {\n            "object_id": 89,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "\\u041e\\u0431\\u043e \\u043c\\u043d\\u0435",\n            "url": "https://portfolio.loc/obo-mne/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "\\u041e\\u0431\\u043e \\u043c\\u043d\\u0435",\n            "nav_menu_term_id": -767294467,\n            "_invalid": false,\n            "type_label": "\\u0421\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-03-30 10:47:55"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '47b920a1-28f3-4c72-b7df-acea42220748', '', '', '2021-03-30 13:47:55', '2021-03-30 10:47:55', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/47b920a1-28f3-4c72-b7df-acea42220748/', 0, 'customize_changeset', '', 0),
(109, 1, '2021-04-09 16:02:42', '2021-03-30 10:47:56', 'D', '', 'Title_Main_Menu', 'publish', 'closed', 'closed', '', '109', '', '', '2021-04-09 16:02:42', '2021-04-09 13:02:42', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/109/', 1, 'nav_menu_item', '', 0),
(110, 1, '2021-04-09 16:02:42', '2021-03-30 10:47:56', ' ', '', '', 'publish', 'closed', 'closed', '', '110', '', '', '2021-04-09 16:02:42', '2021-04-09 13:02:42', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/110/', 2, 'nav_menu_item', '', 0),
(111, 1, '2021-04-09 16:02:43', '2021-03-30 10:47:57', ' ', '', '', 'publish', 'closed', 'closed', '', '111', '', '', '2021-04-09 16:02:43', '2021-04-09 13:02:43', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/111/', 4, 'nav_menu_item', '', 0),
(112, 1, '2021-04-09 16:02:43', '2021-03-30 10:47:57', 'Навыки', '', 'Навыки', 'publish', 'closed', 'closed', '', '112', '', '', '2021-04-09 16:02:43', '2021-04-09 13:02:43', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/112/', 3, 'nav_menu_item', '', 0),
(116, 1, '2021-03-31 12:05:04', '2021-03-31 09:05:04', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Моя история', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2021-03-31 12:05:04', '2021-03-31 09:05:04', '', 95, 'https://portfolio.loc/?p=116', 0, 'revision', '', 0),
(117, 1, '2021-03-31 12:05:06', '2021-03-31 09:05:06', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Моя история', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2021-03-31 12:05:06', '2021-03-31 09:05:06', '', 95, 'https://portfolio.loc/?p=117', 0, 'revision', '', 0),
(118, 1, '2021-03-31 12:19:51', '2021-03-31 09:19:51', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Мероприятия', '', 'draft', 'closed', 'closed', '', 'meropriyatiya', '', '', '2021-04-09 15:58:46', '2021-04-09 12:58:46', '', 0, 'https://portfolio.loc/?page_id=118', 0, 'page', '', 0),
(120, 1, '2021-03-31 12:19:51', '2021-03-31 09:19:51', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Мероприятия', '', 'inherit', 'closed', 'closed', '', '118-revision-v1', '', '', '2021-03-31 12:19:51', '2021-03-31 09:19:51', '', 118, 'https://portfolio.loc/?p=120', 0, 'revision', '', 0),
(122, 1, '2021-03-31 16:38:10', '2021-03-31 13:38:10', '<!-- wp:paragraph -->\n<p>aglksdlksakjdfkjsdkf sdkfklsjdf kjsdkljf ksdfkl sdfsdfs dsd fsdf sdfsdf </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"id":85,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://portfolio.loc/wp-content/uploads/2021/03/images-2.png" alt="PHP" class="wp-image-85"/></figure>\n<!-- /wp:image -->', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-03-31 16:38:10', '2021-03-31 13:38:10', '', 60, 'https://portfolio.loc/?p=122', 0, 'revision', '', 0),
(123, 1, '2021-03-31 16:41:34', '2021-03-31 13:41:34', '<!-- wp:paragraph {"align":"center"} -->\n<p class="has-text-align-center">aglksdlksakjdfkjsdkf sdkfklsjdf kjsdkljf ksdfkl sdfsdfs dsd fsdf sdfsdf </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"align":"center","id":85,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large"><img src="https://portfolio.loc/wp-content/uploads/2021/03/images-2.png" alt="PHP" class="wp-image-85"/></figure></div>\n<!-- /wp:image -->', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-03-31 16:41:34', '2021-03-31 13:41:34', '', 60, 'https://portfolio.loc/?p=123', 0, 'revision', '', 0),
(124, 1, '2021-03-31 23:41:18', '2021-03-31 20:41:18', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2021-03-31 23:41:18', '2021-03-31 20:41:18', '', 0, 'https://portfolio.loc/wp-content/uploads/2021/03/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(133, 1, '2021-04-02 08:41:01', '2021-04-02 05:41:01', '{\n    "nav_menu_item[126]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-02 05:41:01"\n    },\n    "nav_menu_item[128]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-02 05:41:01"\n    },\n    "nav_menu_item[130]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-02 05:41:01"\n    },\n    "nav_menu_item[132]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-02 05:41:01"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9897c0e9-94af-4b23-8a19-97b0b8acb7f5', '', '', '2021-04-02 08:41:01', '2021-04-02 05:41:01', '', 0, 'https://portfolio.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/9897c0e9-94af-4b23-8a19-97b0b8acb7f5/', 0, 'customize_changeset', '', 0),
(134, 1, '2021-04-02 11:37:26', '2021-04-02 08:37:26', 'dfgdfgdfgdfdfa df dfg dafg dfg adfgdfag dfgdf', 'sdfgfdsgdfg', '', 'publish', 'open', 'closed', '', 'sdfgfdsgdfg', '', '', '2021-04-02 11:37:26', '2021-04-02 08:37:26', '', 0, 'https://portfolio.loc/event/sdfgfdsgdfg/', 0, 'event', '', 0),
(135, 1, '2021-04-02 11:50:32', '2021-04-02 08:50:32', 'ghdfgdfg', 'fdsgdfg', '', 'publish', 'open', 'closed', '', 'fdsgdfg', '', '', '2021-04-02 11:50:32', '2021-04-02 08:50:32', '', 0, 'https://portfolio.loc/event/fdsgdfg/', 0, 'event', '', 0),
(136, 1, '2021-04-02 16:18:08', '2021-04-02 13:18:08', '<p>ghdfgdfg</p>\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'fdsgdfg', '', 'inherit', 'closed', 'closed', '', '135-autosave-v1', '', '', '2021-04-02 16:18:08', '2021-04-02 13:18:08', '', 135, 'https://portfolio.loc/?p=136', 0, 'revision', '', 0),
(137, 1, '2021-04-02 16:19:37', '2021-04-02 13:19:37', 'Описание', 'Мероприятие 1', '', 'publish', 'open', 'closed', '', 'meropriyatie-1', '', '', '2021-04-02 16:23:23', '2021-04-02 13:23:23', '', 0, 'https://portfolio.loc/event/meropriyatie-1/', 0, 'event', '', 0),
(138, 1, '2021-04-02 16:19:37', '2021-04-02 13:19:37', '', 'alarmclock_stop', '', 'inherit', 'open', 'closed', '', 'alarmclock_stop', '', '', '2021-04-02 16:19:37', '2021-04-02 13:19:37', '', 137, 'https://portfolio.loc/wp-content/uploads/2021/04/alarmclock_stop.png', 0, 'attachment', 'image/png', 0),
(141, 1, '2021-04-04 21:23:16', '2021-04-04 18:23:16', '<!-- wp:shortcode -->\n[afcp-form]\n<!-- /wp:shortcode -->', 'Моя история', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2021-04-04 21:23:16', '2021-04-04 18:23:16', '', 95, 'https://portfolio.loc/?p=141', 0, 'revision', '', 0),
(146, 1, '2021-04-05 11:08:33', '2021-04-05 08:08:33', '<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-04-05 11:08:33', '2021-04-05 08:08:33', '', 2, 'https://portfolio.loc/?p=146', 0, 'revision', '', 0),
(148, 1, '2021-04-05 11:56:45', '2021-04-05 08:56:45', '<!-- wp:image {"id":102,"sizeSlug":"large","linkDestination":"none"} -->\n<figure class="wp-block-image size-large"><img src="https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash-1024x641.png" alt="" class="wp-image-102"/><figcaption>Delphi 10.2.3</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Все что здесь написано добавлено через админку в Gutenberg</p>\n<!-- /wp:paragraph -->', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-04-05 11:56:45', '2021-04-05 08:56:45', '', 58, 'https://portfolio.loc/?p=148', 0, 'revision', '', 0),
(150, 1, '2021-04-05 11:58:04', '2021-04-05 08:58:04', '<!-- wp:image {"align":"center","id":102,"width":624,"height":390,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large is-resized"><img src="https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash-1024x641.png" alt="" class="wp-image-102" width="624" height="390"/><figcaption>Delphi 10.2.3</figcaption></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Все что здесь написано добавлено через админку в Gutenberg</p>\n<!-- /wp:paragraph -->', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-04-05 11:58:04', '2021-04-05 08:58:04', '', 58, 'https://portfolio.loc/?p=150', 0, 'revision', '', 0),
(151, 1, '2021-04-05 15:13:03', '2021-04-05 12:13:03', '<!-- wp:image {"align":"center","id":102,"width":624,"height":390,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large is-resized"><img src="https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash-1024x641.png" alt="" class="wp-image-102" width="624" height="390"/><figcaption>Delphi 10.2.3</figcaption></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p class="has-text-align-center">Все что здесь написано добавлено через админку в Gutenberg</p>\n<!-- /wp:paragraph -->', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-04-05 15:13:03', '2021-04-05 12:13:03', '', 58, 'https://portfolio.loc/?p=151', 0, 'revision', '', 0),
(153, 1, '2021-04-09 15:52:10', '2021-04-09 12:52:10', '', 'Начало программирования', '', 'publish', 'open', 'open', '', 'nachalo-programmirovaniya', '', '', '2021-04-09 15:52:14', '2021-04-09 12:52:14', '', 0, 'https://portfolio.loc/?p=153', 0, 'post', '', 0),
(154, 1, '2021-04-09 15:52:10', '2021-04-09 12:52:10', '', 'Начало программирования', '', 'inherit', 'closed', 'closed', '', '153-revision-v1', '', '', '2021-04-09 15:52:10', '2021-04-09 12:52:10', '', 153, 'https://portfolio.loc/?p=154', 0, 'revision', '', 0),
(155, 1, '2021-04-09 15:52:14', '2021-04-09 12:52:14', '', 'Начало программирования', '', 'inherit', 'closed', 'closed', '', '153-revision-v1', '', '', '2021-04-09 15:52:14', '2021-04-09 12:52:14', '', 153, 'https://portfolio.loc/?p=155', 0, 'revision', '', 0),
(156, 1, '2021-04-09 15:55:37', '2021-04-09 12:55:37', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:64:"Введите ссылку на канал Телеграмма";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Телеграмм', 'contact_telegramm', 'publish', 'closed', 'closed', '', 'field_60704e7705b95', '', '', '2021-04-09 15:55:37', '2021-04-09 12:55:37', '', 97, 'https://portfolio.loc/?post_type=acf-field&p=156', 2, 'acf-field', '', 0),
(157, 1, '2021-04-09 15:56:17', '2021-04-09 12:56:17', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:66:"Введите ссылку на профиль ВКонтакте";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'ВКонтакте', 'contact_vkontakte', 'publish', 'closed', 'closed', '', 'field_60704ed212a47', '', '', '2021-04-09 15:56:17', '2021-04-09 12:56:17', '', 97, 'https://portfolio.loc/?post_type=acf-field&p=157', 3, 'acf-field', '', 0),
(158, 1, '2021-04-22 23:10:15', '0000-00-00 00:00:00', '', 'Черновик', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-04-22 23:10:15', '0000-00-00 00:00:00', '', 0, 'https://portfolio.loc/?p=158', 0, 'post', '', 0),
(159, 1, '2021-04-23 14:26:15', '2021-04-23 11:26:15', '{\n    "twentytwentyone::background_image": {\n        "value": "http://self-made-programmer.loc/wp-content/uploads/2021/03/konsol_wordpress.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:26:15"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0d41496a-6337-4334-9fb8-7764bc114ecd', '', '', '2021-04-23 14:26:15', '2021-04-23 11:26:15', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/0d41496a-6337-4334-9fb8-7764bc114ecd/', 0, 'customize_changeset', '', 0),
(160, 1, '2021-04-23 14:26:34', '2021-04-23 11:26:34', '{\n    "twentytwentyone::background_preset": {\n        "value": "fill",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:26:34"\n    },\n    "twentytwentyone::background_size": {\n        "value": "cover",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:26:34"\n    },\n    "twentytwentyone::background_repeat": {\n        "value": "no-repeat",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:26:34"\n    },\n    "twentytwentyone::background_attachment": {\n        "value": "fixed",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:26:34"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'bc55cdcc-0a65-4487-bd48-d05567b186cb', '', '', '2021-04-23 14:26:34', '2021-04-23 11:26:34', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/bc55cdcc-0a65-4487-bd48-d05567b186cb/', 0, 'customize_changeset', '', 0),
(161, 1, '2021-04-23 14:32:17', '2021-04-23 11:32:17', '{\n    "academics::custom_logo": {\n        "value": 18,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:32:17"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '68d63f02-d2c9-4598-a29f-630b3775fb4c', '', '', '2021-04-23 14:32:17', '2021-04-23 11:32:17', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/68d63f02-d2c9-4598-a29f-630b3775fb4c/', 0, 'customize_changeset', '', 0),
(162, 1, '2021-04-23 14:32:54', '2021-04-23 11:32:54', '{\n    "academics::custom_logo": {\n        "value": 17,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:32:54"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f6964082-214b-4ce5-8734-749adef009b1', '', '', '2021-04-23 14:32:54', '2021-04-23 11:32:54', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/f6964082-214b-4ce5-8734-749adef009b1/', 0, 'customize_changeset', '', 0),
(163, 1, '2021-04-23 14:33:27', '2021-04-23 11:33:27', '{\n    "site_icon": {\n        "value": 18,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-23 11:33:27"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5e46858f-875a-465d-80c1-a0478b6be264', '', '', '2021-04-23 14:33:27', '2021-04-23 11:33:27', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/5e46858f-875a-465d-80c1-a0478b6be264/', 0, 'customize_changeset', '', 0),
(164, 1, '2021-04-24 07:28:53', '2021-04-24 04:28:53', '<!-- wp:paragraph -->\n<p>Перейдите <a href="http://portfolio.loc/wp-admin/">в консоль</a>, чтобы удалить эту страницу и создать новые. Успехов!</p>\n<!-- /wp:paragraph -->', 'Главная', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2021-04-24 07:28:53', '2021-04-24 04:28:53', '', 2, 'http://self-made-programmer.loc/?p=164', 0, 'revision', '', 0),
(165, 1, '2021-04-26 08:32:20', '2021-04-26 05:32:20', '', 'logoSMPText', '', 'inherit', 'open', 'closed', '', 'logosmptext', '', '', '2021-04-26 08:33:49', '2021-04-26 05:33:49', '', 0, 'http://self-made-programmer.loc/wp-content/uploads/2021/04/logosmptext.png', 0, 'attachment', 'image/png', 0),
(166, 1, '2021-04-26 08:33:15', '0000-00-00 00:00:00', '{\n    "academics::custom_logo": {\n        "value": 165,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-26 05:33:15"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '10181842-7656-4f53-a2e0-36c66c1936ec', '', '', '2021-04-26 08:33:15', '0000-00-00 00:00:00', '', 0, 'http://self-made-programmer.loc/?p=166', 0, 'customize_changeset', '', 0),
(167, 1, '2021-04-26 08:34:50', '2021-04-26 05:34:50', '{\n    "academics::custom_logo": {\n        "value": 165,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-26 05:34:50"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '95a94c6b-91b3-47cd-88b6-43cebd26765b', '', '', '2021-04-26 08:34:50', '2021-04-26 05:34:50', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/95a94c6b-91b3-47cd-88b6-43cebd26765b/', 0, 'customize_changeset', '', 0),
(168, 1, '2021-04-26 08:35:24', '2021-04-26 05:35:24', '{\n    "site_icon": {\n        "value": 165,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-26 05:35:24"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'be840b37-8dcd-49b1-b284-e74f4be838fb', '', '', '2021-04-26 08:35:24', '2021-04-26 05:35:24', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/be840b37-8dcd-49b1-b284-e74f4be838fb/', 0, 'customize_changeset', '', 0),
(169, 1, '2021-04-26 08:42:19', '2021-04-26 05:42:19', '', 'logoSMPTextFavicon', '', 'inherit', 'open', 'closed', '', 'logosmptextfavicon', '', '', '2021-04-26 08:42:19', '2021-04-26 05:42:19', '', 0, 'http://self-made-programmer.loc/wp-content/uploads/2021/04/logosmptextfavicon.png', 0, 'attachment', 'image/png', 0),
(170, 1, '2021-04-26 08:42:33', '2021-04-26 05:42:33', '{\n    "site_icon": {\n        "value": 169,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-26 05:42:33"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '90520382-d6fa-433b-b280-8d82945c6efc', '', '', '2021-04-26 08:42:33', '2021-04-26 05:42:33', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/90520382-d6fa-433b-b280-8d82945c6efc/', 0, 'customize_changeset', '', 0),
(171, 1, '2021-04-26 14:38:31', '2021-04-26 11:38:31', '<!-- wp:image {"align":"center","id":85,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large"><img src="https://portfolio.loc/wp-content/uploads/2021/03/images-2.png" alt="PHP" class="wp-image-85"/></figure></div>\n<!-- /wp:image -->', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-26 14:38:31', '2021-04-26 11:38:31', '', 60, 'http://self-made-programmer.loc/?p=171', 0, 'revision', '', 0),
(172, 1, '2021-04-26 14:38:58', '2021-04-26 11:38:58', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-26 14:38:58', '2021-04-26 11:38:58', '', 60, 'http://self-made-programmer.loc/?p=172', 0, 'revision', '', 0),
(173, 1, '2021-04-26 16:32:29', '2021-04-26 13:32:29', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:169:"Это текстовое поле куда прописывается нзвание иконки из наборов, например: flaticon-mortarboard text-white";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Иконка навыка', 'navyk_icon', 'publish', 'closed', 'closed', '', 'field_6086a6c64020d', '', '', '2021-04-26 16:32:29', '2021-04-26 13:32:29', '', 22, 'http://self-made-programmer.loc/?post_type=acf-field&p=173', 4, 'acf-field', '', 0),
(174, 1, '2021-04-26 16:39:44', '2021-04-26 13:39:44', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-26 16:39:44', '2021-04-26 13:39:44', '', 60, 'http://self-made-programmer.loc/?p=174', 0, 'revision', '', 0),
(175, 1, '2021-04-26 16:40:10', '2021-04-26 13:40:10', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-26 16:40:10', '2021-04-26 13:40:10', '', 60, 'http://self-made-programmer.loc/?p=175', 0, 'revision', '', 0),
(176, 1, '2021-04-26 16:41:25', '2021-04-26 13:41:25', '<!-- wp:image {"align":"center","id":102,"width":624,"height":390,"sizeSlug":"large","linkDestination":"none"} -->\n<div class="wp-block-image"><figure class="aligncenter size-large is-resized"><img src="https://portfolio.loc/wp-content/uploads/2021/03/delphi_10.2.3_ce_splash-1024x641.png" alt="" class="wp-image-102" width="624" height="390"/><figcaption>Delphi 10.2.3</figcaption></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p class="has-text-align-center">Все что здесь написано добавлено через админку в Gutenberg</p>\n<!-- /wp:paragraph -->', 'Delphi', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2021-04-26 16:41:25', '2021-04-26 13:41:25', '', 58, 'http://self-made-programmer.loc/?p=176', 0, 'revision', '', 0),
(177, 1, '2021-04-26 16:46:36', '2021-04-26 13:46:36', '', 'MySQL', '', 'inherit', 'closed', 'closed', '', '62-revision-v1', '', '', '2021-04-26 16:46:36', '2021-04-26 13:46:36', '', 62, 'http://self-made-programmer.loc/?p=177', 0, 'revision', '', 0),
(178, 1, '2021-04-27 11:06:02', '2021-04-27 08:06:02', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-27 11:06:02', '2021-04-27 08:06:02', '', 60, 'http://self-made-programmer.loc/?p=178', 0, 'revision', '', 0),
(179, 1, '2021-04-27 11:06:41', '2021-04-27 08:06:41', '', 'PHP', '', 'inherit', 'closed', 'closed', '', '60-revision-v1', '', '', '2021-04-27 11:06:41', '2021-04-27 08:06:41', '', 60, 'http://self-made-programmer.loc/?p=179', 0, 'revision', '', 0),
(181, 1, '2021-04-28 11:24:29', '2021-04-28 07:23:04', ' ', '', '', 'publish', 'closed', 'closed', '', '181', '', '', '2021-04-28 11:24:29', '2021-04-28 08:24:29', '', 0, 'http://self-made-programmer.loc/?p=181', 2, 'nav_menu_item', '', 0),
(182, 1, '2021-04-28 11:24:29', '2021-04-28 07:23:03', '', 'Главная', '', 'publish', 'closed', 'closed', '', 'glavnaya', '', '', '2021-04-28 11:24:29', '2021-04-28 08:24:29', '', 0, 'http://self-made-programmer.loc/?p=182', 1, 'nav_menu_item', '', 0),
(183, 1, '2021-04-28 14:54:37', '2021-04-28 07:26:36', '', '', 'Телеграмм', 'publish', 'closed', 'closed', '', 'telegramm', '', '', '2021-04-28 14:54:37', '2021-04-28 11:54:37', '', 0, 'http://self-made-programmer.loc/?p=183', 1, 'nav_menu_item', '', 0),
(184, 1, '2021-04-28 14:54:49', '2021-04-28 07:26:36', '', '', 'ВКонтакте', 'publish', 'closed', 'closed', '', 'vkontakte', '', '', '2021-04-28 14:54:49', '2021-04-28 11:54:49', '', 0, 'http://self-made-programmer.loc/?p=184', 2, 'nav_menu_item', '', 0),
(185, 1, '2021-04-28 11:24:29', '2021-04-28 08:24:29', ' ', '', '', 'publish', 'closed', 'closed', '', '185', '', '', '2021-04-28 11:24:29', '2021-04-28 08:24:29', '', 0, 'http://self-made-programmer.loc/?p=185', 3, 'nav_menu_item', '', 0),
(186, 1, '2021-04-28 11:24:30', '2021-04-28 08:24:30', ' ', '', '', 'publish', 'closed', 'closed', '', '186', '', '', '2021-04-28 11:24:30', '2021-04-28 08:24:30', '', 0, 'http://self-made-programmer.loc/?p=186', 4, 'nav_menu_item', '', 0),
(187, 1, '2021-04-28 11:24:30', '2021-04-28 08:24:30', ' ', '', '', 'publish', 'closed', 'closed', '', '187', '', '', '2021-04-28 11:24:30', '2021-04-28 08:24:30', '', 0, 'http://self-made-programmer.loc/?p=187', 5, 'nav_menu_item', '', 0),
(188, 1, '2021-04-28 14:54:37', '2021-04-28 11:54:37', '{\n    "nav_menu_item[183]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 183,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430",\n            "title": "",\n            "url": "https://telegramm.io",\n            "target": "",\n            "attr_title": "\\u0422\\u0435\\u043b\\u0435\\u0433\\u0440\\u0430\\u043c\\u043c",\n            "description": "",\n            "classes": "icon-telegram",\n            "xfn": "",\n            "nav_menu_term_id": 30,\n            "position": 1,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-28 11:54:37"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '97dbd040-b106-4da4-9cce-b9b0ff539ac7', '', '', '2021-04-28 14:54:37', '2021-04-28 11:54:37', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/97dbd040-b106-4da4-9cce-b9b0ff539ac7/', 0, 'customize_changeset', '', 0),
(189, 1, '2021-04-28 14:54:49', '2021-04-28 11:54:49', '{\n    "nav_menu_item[184]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 184,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "\\u041f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0441\\u044b\\u043b\\u043a\\u0430",\n            "title": "",\n            "url": "https://vk.com",\n            "target": "",\n            "attr_title": "\\u0412\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0435",\n            "description": "",\n            "classes": "icon-vk",\n            "xfn": "",\n            "nav_menu_term_id": 30,\n            "position": 2,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-28 11:54:49"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'bb7ee9bc-1706-495e-80b4-ffdfcb7c5839', '', '', '2021-04-28 14:54:49', '2021-04-28 11:54:49', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/bb7ee9bc-1706-495e-80b4-ffdfcb7c5839/', 0, 'customize_changeset', '', 0),
(190, 1, '2021-04-28 15:01:14', '2021-04-28 12:01:14', '', 'Мои планы на будущее', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2021-04-28 15:01:14', '2021-04-28 12:01:14', '', 56, 'http://self-made-programmer.loc/?p=190', 0, 'revision', '', 0),
(191, 1, '2021-04-28 15:01:56', '2021-04-28 12:01:56', '', 'Я уже кое что умею делать на WordPress', '', 'inherit', 'closed', 'closed', '', '54-revision-v1', '', '', '2021-04-28 15:01:56', '2021-04-28 12:01:56', '', 54, 'http://self-made-programmer.loc/?p=191', 0, 'revision', '', 0),
(192, 1, '2021-04-28 15:02:41', '2021-04-28 12:02:41', '', 'Я учусь создавать сайты на WordPress', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2021-04-28 15:02:41', '2021-04-28 12:02:41', '', 1, 'http://self-made-programmer.loc/?p=192', 0, 'revision', '', 0),
(193, 1, '2021-04-29 11:59:03', '2021-04-29 08:59:03', '{\n    "theme_contacttext": {\n        "value": "\\u0422\\u0435\\u043a\\u0441\\u0442 \\u0441 \\u043a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0430\\u043c\\u0438",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 08:59:03"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4ce8df93-74df-4b5f-ab98-8ebf78e8de9c', '', '', '2021-04-29 11:59:03', '2021-04-29 08:59:03', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/4ce8df93-74df-4b5f-ab98-8ebf78e8de9c/', 0, 'customize_changeset', '', 0),
(194, 1, '2021-04-29 13:58:28', '2021-04-29 10:58:28', '{\n    "theme_contact_mail_visible": {\n        "value": false,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 10:58:28"\n    },\n    "theme_contact_phone": {\n        "value": "+7(915) 452 - 72 - 51",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 10:58:28"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c10a276a-bb11-454d-bff8-a33a9fa11e25', '', '', '2021-04-29 13:58:28', '2021-04-29 10:58:28', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/c10a276a-bb11-454d-bff8-a33a9fa11e25/', 0, 'customize_changeset', '', 0),
(195, 1, '2021-04-29 14:01:19', '2021-04-29 11:01:19', '{\n    "theme_contact_mail_visible": {\n        "value": true,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:01:10"\n    },\n    "theme_contact_mail": {\n        "value": "request@self-made-programmer.ru",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:01:19"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'cc2a9f0d-0ed9-4ca2-8fd2-e12a2d53261b', '', '', '2021-04-29 14:01:19', '2021-04-29 11:01:19', '', 0, 'http://self-made-programmer.loc/?p=195', 0, 'customize_changeset', '', 0),
(196, 1, '2021-04-29 14:01:37', '2021-04-29 11:01:37', '{\n    "theme_contact_mail_visible": {\n        "value": false,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:01:37"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '6a70fdd4-b5a9-4349-8ba8-3cb84441d04f', '', '', '2021-04-29 14:01:37', '2021-04-29 11:01:37', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/6a70fdd4-b5a9-4349-8ba8-3cb84441d04f/', 0, 'customize_changeset', '', 0),
(197, 1, '2021-04-29 14:32:41', '2021-04-29 11:32:41', '{\n    "theme_contact_mail_visible": {\n        "value": true,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:32:41"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '340bc0b3-c133-4987-ab15-966d963ae6be', '', '', '2021-04-29 14:32:41', '2021-04-29 11:32:41', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/340bc0b3-c133-4987-ab15-966d963ae6be/', 0, 'customize_changeset', '', 0),
(198, 1, '2021-04-29 14:38:10', '2021-04-29 11:38:10', '{\n    "theme_contact_phone_visible": {\n        "value": false,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:38:10"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c2182f9e-bab3-40f7-95dd-292f2a13a6d3', '', '', '2021-04-29 14:38:10', '2021-04-29 11:38:10', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/c2182f9e-bab3-40f7-95dd-292f2a13a6d3/', 0, 'customize_changeset', '', 0),
(199, 1, '2021-04-29 14:39:55', '2021-04-29 11:39:55', '{\n    "theme_contact_phone_visible": {\n        "value": true,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-04-29 11:39:55"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '6fbe5f5c-d2e1-4054-84d0-2614dbed15d0', '', '', '2021-04-29 14:39:55', '2021-04-29 11:39:55', '', 0, 'http://self-made-programmer.loc/%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8/6fbe5f5c-d2e1-4054-84d0-2614dbed15d0/', 0, 'customize_changeset', '', 0);

-- 
-- Вывод данных для таблицы wp_term_relationships
--
INSERT INTO wp_term_relationships VALUES
(1, 2, 0),
(54, 2, 0),
(56, 2, 0),
(58, 3, 0),
(60, 3, 0),
(62, 3, 0),
(64, 3, 0),
(109, 5, 0),
(110, 5, 0),
(111, 5, 0),
(112, 5, 0),
(134, 21, 0),
(134, 23, 0),
(134, 25, 0),
(135, 21, 0),
(135, 26, 0),
(137, 21, 0),
(137, 23, 0),
(137, 27, 0),
(153, 28, 0),
(181, 29, 0),
(182, 29, 0),
(183, 30, 0),
(184, 30, 0),
(185, 29, 0),
(186, 29, 0),
(187, 29, 0);

-- 
-- Вывод данных для таблицы wp_term_taxonomy
--
INSERT INTO wp_term_taxonomy VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 3),
(3, 3, 'category', '', 0, 4),
(4, 4, 'category', '', 0, 0),
(5, 5, 'nav_menu', '', 0, 4),
(6, 6, 'product_type', '', 0, 0),
(7, 7, 'product_type', '', 0, 0),
(8, 8, 'product_type', '', 0, 0),
(9, 9, 'product_type', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_visibility', '', 0, 0),
(16, 16, 'product_visibility', '', 0, 0),
(17, 17, 'product_visibility', '', 0, 0),
(18, 18, 'product_visibility', '', 0, 0),
(19, 19, 'product_cat', '', 0, 0),
(20, 20, 'topics', '', 0, 0),
(21, 21, 'topics', '', 0, 3),
(22, 22, 'topics', '', 0, 0),
(23, 23, 'topics', '', 0, 2),
(24, 24, 'topics', '', 0, 0),
(25, 25, 'hashtags', '', 0, 1),
(26, 26, 'hashtags', '', 0, 1),
(27, 27, 'hashtags', '', 0, 1),
(28, 28, 'category', '', 0, 1),
(29, 29, 'nav_menu', '', 0, 5),
(30, 30, 'nav_menu', '', 0, 2);

-- 
-- Вывод данных для таблицы wp_termmeta
--

-- Таблица aleksamanatov_portfolio.wp_termmeta не содержит данных

-- 
-- Вывод данных для таблицы wp_terms
--
INSERT INTO wp_terms VALUES
(1, 'Без рубрики', '%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8', 0),
(2, 'Слайдер', 'slider', 0),
(3, 'Навыки', 'navyk', 0),
(4, 'Мои услуги', 'moi-uslugi', 0),
(5, 'Main', 'main', 0),
(6, 'simple', 'simple', 0),
(7, 'grouped', 'grouped', 0),
(8, 'variable', 'variable', 0),
(9, 'external', 'external', 0),
(10, 'exclude-from-search', 'exclude-from-search', 0),
(11, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(12, 'featured', 'featured', 0),
(13, 'outofstock', 'outofstock', 0),
(14, 'rated-1', 'rated-1', 0),
(15, 'rated-2', 'rated-2', 0),
(16, 'rated-3', 'rated-3', 0),
(17, 'rated-4', 'rated-4', 0),
(18, 'rated-5', 'rated-5', 0),
(19, 'Misc', 'misc', 0),
(20, 'Совещание', 'soveshhanie', 0),
(21, 'Праздник', 'prazdnik', 0),
(22, 'Свадьба', 'svadba', 0),
(23, 'Похороны', 'pohorony', 0),
(24, 'День рождения', 'den-rozhdeniya', 0),
(25, 'fdgdfg', 'fdgdfg', 0),
(26, 'dfgdfgdf', 'dfgdfgdf', 0),
(27, 'Метка 1 Метка2', 'metka-1-metka2', 0),
(28, 'Моя история', 'moya-istoriya', 0),
(29, 'Главное', 'glavnoe', 0),
(30, 'Социальное', 'soczialnoe', 0);

-- 
-- Вывод данных для таблицы wp_usermeta
--
INSERT INTO wp_usermeta VALUES
(1, 1, 'nickname', 'alphaadmin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:8:{s:64:"1bac5353aa494be33d704e0aee92ff70ad8758b470af8d63c2a2ae4515f5e993";a:4:{s:10:"expiration";i:1620333270;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:132:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171";s:5:"login";i:1619123670;}s:64:"6644eb715c923fbb277d85864d51b2d1c0d5f25d74c9d0ad71f295204cfbfb9f";a:4:{s:10:"expiration";i:1620333374;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:132:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36 OPR/75.0.3969.171";s:5:"login";i:1619123774;}s:64:"3ee61fb8fc8ebbe45376c055ab1ffd6de139e2a44e4874596566949ef1ec8e3e";a:4:{s:10:"expiration";i:1620375557;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";s:5:"login";i:1619165957;}s:64:"1b4f993de1f7bd6371d70a0f0d31c297e590b18e90ea950b544bc95e53d42eff";a:4:{s:10:"expiration";i:1620620651;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";s:5:"login";i:1619411051;}s:64:"57e2833c0c3ae4547b0d2ed7f7eb1fec9f5f18f3dbed794a2adf4d75693dd605";a:4:{s:10:"expiration";i:1620720308;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";s:5:"login";i:1619510708;}s:64:"968147c2fd5226d01f1dfdc1174a0de44b99f75c2b1fa40c5912e2e5c29d5241";a:4:{s:10:"expiration";i:1620768615;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:132:"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36 OPR/75.0.3969.218";s:5:"login";i:1619559015;}s:64:"ef0a2fc0006107e9c994826963f84bbaf584bb8c6a9616ac36588111f27519e8";a:4:{s:10:"expiration";i:1620798906;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";s:5:"login";i:1619589306;}s:64:"fad9092b5598f452a64e1d85eac342db56cda55966d4b7f443da366db542482e";a:4:{s:10:"expiration";i:1620888697;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";s:5:"login";i:1619679097;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '158'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:9:"127.0.0.0";}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1616497222'),
(21, 1, 'closedpostboxes_', 'a:0:{}'),
(22, 1, 'metaboxhidden_', 'a:0:{}'),
(23, 1, 'meta-box-order_', 'a:4:{s:6:"normal";s:47:"acf-group_605b21448a1db,acf-group_605b3344cf595";s:15:"acf_after_title";s:0:"";s:4:"side";s:0:"";s:8:"advanced";s:0:"";}'),
(24, 1, '_woocommerce_tracks_anon_id', 'woo:9RvJbVYoRclr/pYj1erwWXLo'),
(25, 1, 'last_update', '1617223326'),
(26, 1, 'woocommerce_admin_activity_panel_inbox_last_read', '1617223315734'),
(27, 1, 'wc_last_active', '1617235200'),
(28, 1, 'enable_custom_fields', '1'),
(29, 1, 'nav_menu_recently_edited', '29'),
(30, 1, 'managenav-menuscolumnshidden', 'a:0:{}'),
(31, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:19:"add-post-type-event";i:1;s:12:"add-post_tag";i:2;s:10:"add-topics";i:3;s:12:"add-hashtags";}');

-- 
-- Вывод данных для таблицы wp_users
--
INSERT INTO wp_users VALUES
(1, 'alphaadmin', '$P$Bb0XDYhol/LdvXxBFJutNRaBa8rUic.', 'alphaadmin', 'admin@portfolio.loc', 'http://portfolio.loc', '2021-03-21 19:32:36', '', 0, 'alphaadmin');

-- 
-- Вывод данных для таблицы wp_wc_admin_note_actions
--
INSERT INTO wp_wc_admin_note_actions VALUES
(1, 1, 'connect', 'Подключить', '?page=wc-addons&section=helper', 'unactioned', 0, ''),
(2, 2, 'yes-please', 'Да, пожалуйста!', 'https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin', 'actioned', 0, ''),
(3, 3, 'open-marketing-hub', 'Открыть маркетинговый центр', 'https://portfolio.loc/wp-admin/admin.php?page=wc-admin&path=/marketing', 'actioned', 0, ''),
(19, 4, 'upgrade_now_facebook_pixel_api', 'Upgrade now', 'plugin-install.php?tab=plugin-information&plugin=&section=changelog', 'actioned', 1, ''),
(20, 5, 'learn_more_facebook_ec', 'Learn more', 'https://woocommerce.com/products/facebook/', 'unactioned', 1, ''),
(21, 6, 'set-up-concierge', 'Schedule free session', 'https://wordpress.com/me/concierge', 'actioned', 1, ''),
(22, 7, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox', 'unactioned', 1, ''),
(23, 8, 'learn-more-ecomm-unique-shopping-experience', 'Learn more', 'https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox', 'actioned', 1, ''),
(24, 9, 'watch-the-webinar', 'Watch the webinar', 'https://youtu.be/V_2XtCOyZ7o', 'actioned', 1, ''),
(25, 10, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox', 'actioned', 1, ''),
(26, 11, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales', 'actioned', 1, ''),
(27, 12, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business', 'actioned', 1, ''),
(28, 13, 'add-apple-pay', 'Add Apple Pay', '/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments', 'actioned', 1, ''),
(29, 13, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay', 'actioned', 1, ''),
(30, 14, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales', 'actioned', 1, ''),
(31, 15, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business', 'actioned', 1, ''),
(32, 16, 'optimizing-the-checkout-flow', 'Learn more', 'https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox', 'actioned', 1, ''),
(33, 17, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox', 'unactioned', 1, '');

-- 
-- Вывод данных для таблицы wp_wc_admin_notes
--
INSERT INTO wp_wc_admin_notes VALUES
(1, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Подключиться к WooCommerce.com', 'Подключайтесь, чтобы получать важные уведомления о товаре и обновления.', '{}', 'unactioned', 'woocommerce-admin', '2021-03-31 20:41:31', NULL, 0, 'plain', '', 0, 'info'),
(2, 'wc-admin-onboarding-email-marketing', 'info', 'en_US', 'Зарегистрируйтесь, чтобы получать советы, информацию об обновлениях товаров и новые идеи', 'Мы рады помогать вам — получайте советы, информацию об обновлении товаров и вдохновляющие идеи прямо на почту.', '{}', 'unactioned', 'woocommerce-admin', '2021-03-31 20:41:34', NULL, 0, 'plain', '', 0, 'info'),
(3, 'wc-admin-marketing-intro', 'info', 'en_US', 'Найдите свою аудиторию', 'Расширяйте базу заказчиков и увеличивайте продажи с помощью маркетинговых инструментов для WooCommerce.', '{}', 'unactioned', 'woocommerce-admin', '2021-03-31 20:41:34', NULL, 0, 'plain', '', 0, 'info'),
(4, 'facebook_pixel_api_2021', 'marketing', 'en_US', 'Improve the performance of your Facebook ads', 'Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved performance and measurement of your Facebook ad campaigns.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:35', NULL, 0, 'plain', '', 0, 'info'),
(5, 'facebook_ec_2021', 'marketing', 'en_US', 'Sync your product catalog with Facebook to help boost sales', 'A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:35', NULL, 0, 'plain', '', 0, 'info'),
(6, 'ecomm-need-help-setting-up-your-store', 'info', 'en_US', 'Need help setting up your Store?', 'Schedule a free 30-min <a href="https://wordpress.com/support/concierge-support/">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:35', NULL, 0, 'plain', '', 0, 'info'),
(7, 'woocommerce-services', 'info', 'en_US', 'WooCommerce Shipping & Tax', 'WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:36', NULL, 0, 'plain', '', 0, 'info'),
(8, 'ecomm-unique-shopping-experience', 'info', 'en_US', 'For a shopping experience as unique as your customers', 'Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:36', NULL, 0, 'plain', '', 0, 'info'),
(9, 'wc-admin-getting-started-in-ecommerce', 'info', 'en_US', 'Getting Started in eCommerce - webinar', 'We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:36', NULL, 0, 'plain', '', 0, 'info'),
(10, 'your-first-product', 'info', 'en_US', 'Your first product', 'That''s huge! You''re well on your way to building a successful online store — now it’s time to think about how you''ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href="https://href.li/?https://woocommerce.com/shipping" target="_blank">WooCommerce Shipping</a>.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:36', NULL, 0, 'plain', '', 0, 'info'),
(11, 'wc-square-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(12, 'wc-square-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with Square and Apple Pay ', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(13, 'wcpay-apple-pay-is-now-available', 'marketing', 'en_US', 'Apple Pay is now available with WooCommerce Payments!', 'Increase your conversion rate by offering a fast and secure checkout with <a href="https://woocommerce.com/apple-pay/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay" target="_blank">Apple Pay</a>®. It’s free to get started with <a href="https://woocommerce.com/payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay" target="_blank">WooCommerce Payments</a>.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(14, 'wcpay-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(15, 'wcpay-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with WooCommerce Payments and Apple Pay', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(16, 'wc-admin-optimizing-the-checkout-flow', 'info', 'en_US', 'Optimizing the checkout flow', 'It''s crucial to get your store''s checkout as smooth as possible to avoid losing sales. Let''s take a look at how you can optimize the checkout experience for your shoppers.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info'),
(17, 'wc-admin-first-five-things-to-customize', 'info', 'en_US', 'The first 5 things to customize in your store', 'Deciding what to start with first is tricky. To help you properly prioritize, we''ve put together this short list of the first few things you should customize in WooCommerce.', '{}', 'pending', 'woocommerce.com', '2021-03-31 17:41:37', NULL, 0, 'plain', '', 0, 'info');

-- 
-- Вывод данных для таблицы wp_wc_category_lookup
--
INSERT INTO wp_wc_category_lookup VALUES
(19, 19);

-- 
-- Вывод данных для таблицы wp_wc_customer_lookup
--

-- Таблица aleksamanatov_portfolio.wp_wc_customer_lookup не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_order_coupon_lookup
--

-- Таблица aleksamanatov_portfolio.wp_wc_order_coupon_lookup не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_order_product_lookup
--

-- Таблица aleksamanatov_portfolio.wp_wc_order_product_lookup не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_order_stats
--

-- Таблица aleksamanatov_portfolio.wp_wc_order_stats не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_order_tax_lookup
--

-- Таблица aleksamanatov_portfolio.wp_wc_order_tax_lookup не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_product_meta_lookup
--

-- Таблица aleksamanatov_portfolio.wp_wc_product_meta_lookup не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_reserved_stock
--

-- Таблица aleksamanatov_portfolio.wp_wc_reserved_stock не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_tax_rate_classes
--
INSERT INTO wp_wc_tax_rate_classes VALUES
(1, 'Пониженная ставка', 'ponizhennaya-stavka'),
(2, 'Нулевая ставка', 'nulevaya-stavka');

-- 
-- Вывод данных для таблицы wp_wc_webhooks
--

-- Таблица aleksamanatov_portfolio.wp_wc_webhooks не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_api_keys
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_api_keys не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_attribute_taxonomies
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_attribute_taxonomies не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_downloadable_product_permissions
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_downloadable_product_permissions не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_log
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_log не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_order_itemmeta
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_order_itemmeta не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_order_items
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_order_items не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_payment_tokenmeta
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_payment_tokenmeta не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_payment_tokens
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_payment_tokens не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_sessions
--
INSERT INTO wp_woocommerce_sessions VALUES
(1, '1', 'a:7:{s:4:"cart";s:6:"a:0:{}";s:11:"cart_totals";s:367:"a:15:{s:8:"subtotal";i:0;s:12:"subtotal_tax";i:0;s:14:"shipping_total";i:0;s:12:"shipping_tax";i:0;s:14:"shipping_taxes";a:0:{}s:14:"discount_total";i:0;s:12:"discount_tax";i:0;s:19:"cart_contents_total";i:0;s:17:"cart_contents_tax";i:0;s:19:"cart_contents_taxes";a:0:{}s:9:"fee_total";i:0;s:7:"fee_tax";i:0;s:9:"fee_taxes";a:0:{}s:5:"total";i:0;s:9:"total_tax";i:0;}";s:15:"applied_coupons";s:6:"a:0:{}";s:22:"coupon_discount_totals";s:6:"a:0:{}";s:26:"coupon_discount_tax_totals";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:8:"customer";s:733:"a:26:{s:2:"id";s:1:"1";s:13:"date_modified";s:25:"2021-03-31T20:42:06+00:00";s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:2:"GB";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:2:"GB";s:13:"is_vat_exempt";s:0:"";s:19:"calculated_shipping";s:0:"";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:19:"admin@portfolio.loc";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1617444299);

-- 
-- Вывод данных для таблицы wp_woocommerce_shipping_zone_locations
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_shipping_zone_locations не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_shipping_zone_methods
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_shipping_zone_methods не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_shipping_zones
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_shipping_zones не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_tax_rate_locations
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_tax_rate_locations не содержит данных

-- 
-- Вывод данных для таблицы wp_woocommerce_tax_rates
--

-- Таблица aleksamanatov_portfolio.wp_woocommerce_tax_rates не содержит данных

-- 
-- Вывод данных для таблицы wp_wc_download_log
--

-- Таблица aleksamanatov_portfolio.wp_wc_download_log не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;