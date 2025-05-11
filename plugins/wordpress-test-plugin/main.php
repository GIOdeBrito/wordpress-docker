<?php

/*
Plugin Name:	Wordpress Test Plugin
Plugin URI:
Description:	A test plugin for Wordpress.
Version:		1.0
Author:			Giordano de Brito
Author URI:
License:		GPL2
License URI:	https://www.gnu.org/licenses/gpl-2.0.html
*/

function main ()
{
	echo "Plugin folder volume...";
	echo "<br>";
	echo "Is binded!"
}

add_filter('wp_head', 'main');

?>
