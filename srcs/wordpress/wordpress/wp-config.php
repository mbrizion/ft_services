<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'user' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST', 'mysql' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'AUTH_KEY',         'bo;r&9bzrUsY+w67|ZM_*^Z-*wXyBMM^`CXbz HE$y~<w5QOC@go D<Nc~4dD$cG' );
define( 'SECURE_AUTH_KEY',  '@ag03ZPjZK.?z)e5b}:UW1H?*}qUSV]KN9.o05J=`~%%sV.t;rDGm ;d_P@G(Uuy' );
define( 'LOGGED_IN_KEY',    '9&|Z~pbB(4mI z`*i}0}1D_lD<wDL_=wJ-t29acWJcXx7?+dKcjB0Zp_Ldd<%2on' );
define( 'NONCE_KEY',        '4B1V@OT%Cn|-@G>|s|<9A8mK<f]?{rXL.L&FeAbUpZ]~W79Yn<}HYwsXR{j,rC[L' );
define( 'AUTH_SALT',        'ri]]qVXUH7%/IcE29X)]a(8wAFJN5QPZoD?tQQNvgx($,4WR.;3}YH1|;^uDTE[1' );
define( 'SECURE_AUTH_SALT', '6jheboL!X~=Tqc3!RI?1*ZZfO5yR;ufP[C9d O~mt%#XMrLQfD9g>td_FxTj.c9B' );
define( 'LOGGED_IN_SALT',   'm3iSYk-M3{u;hg,du4,P:~/>r=W`*Y?b>uMNECa[;KsA82.=X2HHWCjrw5]uJHXx' );
define( 'NONCE_SALT',       '%dB:Vl t*YPfRz`]#x~RTW6(8[^S<Dou]aeQnX+um<W7/m&`z)qtVIuLJ`QER3@y' );
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once( ABSPATH . 'wp-settings.php' );
