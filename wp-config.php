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
define('DB_NAME', 'multragatan');

/** MySQL database username */
define('DB_USER', 'multragatan_zenda');

/** MySQL database password */
define('DB_PASSWORD', 'password');

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

define('AUTH_KEY',         'nDKuD++<v^H8DC V#fVR58@~A$[IR!5or>cx3nXm#++@Z*k;rr/Yf/cWAV9$Os(+');
define('SECURE_AUTH_KEY',  '+RG[15?NST&mWY+**L`H@#SV9p-%e|hh<,}Zf@`:y+FNi1A@]XUvi>nx4A,pM!!,');
define('LOGGED_IN_KEY',    '<k{IFx-0+hUP+^*-Qe)feD1!OE2(/d-3ZTvA?c6Fk-i}B5O[O}/z7&7.R)sNwyRK');
define('NONCE_KEY',        'YIz@lUsh?*It;I((vL3wZEvVL|e~C)j]|]gxI6VLsYi@5NQ=WHCV&YLK%3/Zt0eI');
define('AUTH_SALT',        'N9k11@-orC>r9[0gx4%CSkQJko3^JPYxV|B?M4+Ch>65]ux/5,O*0:(xWek^wvP?');
define('SECURE_AUTH_SALT', 'NY-BF<oLx5?Ra^|QPAK}]m8Hv84Ea+74/{fVE@DSrO.Vv/2wkNbK+R 0a3JMhG:d');
define('LOGGED_IN_SALT',   '6[AC)oa_-,nvv05~wl3x]l[Y;sUUIMZySr{Jt4.9-<4uGZ)mfQy;{_(`o?UqN6!7');
define('NONCE_SALT',       'J?@=!6]$]oCa6w@syR]c;e|cj&X,t)tQgoH6c*H+r<]R#~Jy? CG:fqvM5e/~rg+');

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
