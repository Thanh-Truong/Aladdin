<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpressuser');

/** MySQL database password */
define('DB_PASSWORD', 'motnguoivimoinguoi34');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'n;MfWQp>+H:QwqA6M/p,O!krTm/H6`rNPV*.Cmh!y!})F0C9G97v@cLNX^SHz&9&');
define('SECURE_AUTH_KEY',  'EcRy1q7nB]|,rL~ZQTJw3[ SQnF$kPb]_+){K3Lu*ij?.^ >Cy?]6]`kM$P&=|1/');
define('LOGGED_IN_KEY',    '-GI(ka<i8W]&HE~mN_axc7{MEMLf[J|Q-R[:YeFez1p?*g;F7=84R@.%#P_,NXpT');
define('NONCE_KEY',        'Tdv}BCF7^3+{tUUIbc&<Mx `~BTD43?g%_?=|lo@0/LGb$sS.,[I?vn1{&y88HJF');
define('AUTH_SALT',        ',lmH)i60g2twC7YSc63n ,F>]B`y2o2D,PCeO(x9,+^Y w.<$-),N=?H%)JcvY!}');
define('SECURE_AUTH_SALT', 'YF!k-]cJt-ahW})TpJ+`LSP2lv+ZqsHz*51sC6#$+P3l+Zc<J/Me)cHB>T;B`(q`');
define('LOGGED_IN_SALT',   'ZJY?DddH@5d`jlLS@K@Fln,Rwzv}xZxIFG94n!u{xn+9Gq|7 ,?U_1i|+XxYJF60');
define('NONCE_SALT',       '+|Ev]z=p[~(6Y&w><9AkA<m[xkb! |LFtfDDFdy<Yf+O^0(@#DS}i<yO-5q+v2>7');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

define('FS_METHOD', 'direct');