<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://ru.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'aleksamanatov_portfolio' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'aleksamanatov' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'qzbhxqA3ju%c' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'localhost' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', 'utf8_general_ci' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'o-$oSifnJw-vj/Iv}fpNB*LRMh&,QZ;U3`uV[mkB}V%$1&RG=46,c],|!Ua[;`G+' );
define( 'SECURE_AUTH_KEY',  'h:huAruyi)bPZ<g Wfn6GK//%HXwIL;U+l`>-TW khlV D^$d#|@mq6HDRj5RR7r' );
define( 'LOGGED_IN_KEY',    '-s;4.&o#W]MgAfu@)Tc+.T.5m!;+g![sj0ZH3[eI9ze8PquUjFZX_ddYa2 `.#2%' );
define( 'NONCE_KEY',        '%hz4L_fS~x%DT52eJbBmj9.njE@dWn=gl[D%2W9]TCcLet^i3gmjea52nkdiQG%`' );
define( 'AUTH_SALT',        'KGYjK[P8o$A.IsM|:FI)A.6[fxSR|cyzF-vdOAfNwIJ=Vd=kyvdL`ze[D}1.(#RA' );
define( 'SECURE_AUTH_SALT', ']tJKIgr CS`s::WADHPK6):q_qxu(p@rXlSJuW2AOcz#Z0~}q*jrXu!v[+j$cytW' );
define( 'LOGGED_IN_SALT',   '60O>*2uYixM%*+TTW$!@GzA*v$-B!]l:)O`4QxmTJ}mcoc5u eQ, Pn,8ri4[;q2' );
define( 'NONCE_SALT',       'x$Dj$Q)i(w./7PfD.t]>4|dF]YM[vc3vkD:$kJ{*~+WWk}wW2Ih8~4k#,2xUz1.L' );

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в документации.
 *
 * @link https://ru.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
define( 'SCRIPT_DEBUG', true );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';
