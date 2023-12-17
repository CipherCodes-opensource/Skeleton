START TRANSACTION;

CREATE TABLE `backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `backup_name` varchar(255) NOT NULL,
  `backup_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `backup_location` varchar(255) NOT NULL
);

CREATE TABLE `error_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `error_code` int(11) NOT NULL,
  `error_message` varchar(255) NOT NULL
);

CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timezone` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `original_location` varchar(255) NOT NULL,
  `optimized_location` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alt_tag` varchar(255) DEFAULT NULL
);

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL PRIMARY KEY,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  UNIQUE KEY `option_name` (`option_name`)
);

INSERT INTO `options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'siteurl', 'http://localhost/wp'),
(2, 'home', 'http://localhost/wp'),
(3, 'sitename', 'open source'),
(4, 'sitedescription', ''),
(5, 'users_can_register', '0'),
(6, 'admin_email', 'admin@gmail.com'),
(7, 'mailserver_url', 'mail.example.com'),
(8, 'mailserver_login', 'login@example.com'),
(9, 'mailserver_pass', 'password'),
(10, 'mailserver_port', '110'),
(11, 'date_format', 'F j, Y'),
(12, 'time_format', 'g:i a'),
(13, 'links_updated_date_format', 'F j, Y g:i a'),
(14, 'template', 'edschool'),
(15, 'software_version', '1.0'),
(16, 'upload_path', ''),
(17, 'optimize', 'enabled'),
(18, 'timezone_string', ''),
(19, 'auto_update_core', 'enabled'),
(20, 'debug_mode', 'enabled'),
(21, 'recaptcha_site_key', ''),
(22, 'recaptcha_secret_key', ''),
(23, 'recaptcha_v3_site_key', ''),
(24, 'recaptcha_v3_secret_key', ''),
(25, 'recaptcha_v3_threshold', '0.5'),
(26, 'site_logo', '1');

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `plugin_name` varchar(255) NOT NULL,
  `plugin_uri` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `version` varchar(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_uri` varchar(255) DEFAULT NULL,
  `plugin_path` varchar(255) NOT NULL,  
  `active` tinyint(1) NOT NULL,
  KEY `plugin_name` (`plugin_name`)
);

CREATE TABLE `redirections` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `original_url` varchar(255) NOT NULL,
  `redirect_url` varchar(255) NOT NULL
);

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `role_name` varchar(255) NOT NULL
);

CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `template_name` varchar(255) NOT NULL,
  `theme_uri` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_uri` varchar(255) DEFAULT NULL,
  `version` varchar(20) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `license_uri` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `theme_path` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  KEY `template_name` (`template_name`)
);

CREATE TABLE `usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
);

CREATE TABLE `users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL,
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `role_id` (`role_id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
