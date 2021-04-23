<?php
add_action('wp_enqueue_scripts', 'childhood_scripts');

function childhood_scripts(){
    wp_enqueue_style('childhood-style', get_stylesheet_uri());
    wp_enqueue_style('childhood-header-style', get_template_directory_uri() . '/assets/styles/main.min.css');

    wp_enqueue_script('childhood-script', get_template_directory_uri() . '/assets/js/main.min.js', array(), null, true);
}

add_theme_support('custom-logo');
add_theme_support('post-thumbnails');
add_theme_support('menus');

add_filter('nav_menu_link_attributes', 'filter_nav_link_attributes', 10, 3);

function filter_nav_link_attributes($atts, $item, $args){
    if($args->menu === 'Main'){
        $atts['class'] = 'header__nav-item';

        if($item->current){
            $atts['class'] .= ' header__nav-item-active';
        }
        error_log(print_r('НАЧАЛО ВЫВОДА МЕНЮ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++', 1));
        error_log(print_r($item, 1));
        error_log(print_r('КОНЕЦ ВЫВОДА МЕНЮ ---------------------------------------------------------------------------------------------', 1));
        

        //if($item->ID === 112 && in_category('navyk')){
            if($item->title === 'Навыки' && in_category('navyk')){    
            $atts['class'] .= ' header__nav-item-active';
        }
    }

    return $atts;
} 
?>