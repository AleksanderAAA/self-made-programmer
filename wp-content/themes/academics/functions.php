<?php
add_action('wp_enqueue_scripts', 'academicsselfmade_scripts');

function academicsselfmade_scripts(){
    wp_enqueue_style('academicsselfmade-style', get_stylesheet_uri());

    wp_enqueue_style('academicsselfmade-icomoon', get_template_directory_uri() . '/assets/fonts/icomoon/style.css');
    wp_enqueue_style('academicsselfmade-bootstrap', get_template_directory_uri() . '/assets/css/bootstrap.min.css');
    wp_enqueue_style('academicsselfmade-jqueryui', get_template_directory_uri() . '/assets/css/jquery-ui.css');
    wp_enqueue_style('academicsselfmade-owlcarouselcss', get_template_directory_uri() . '/assets/css/owl.carousel.min.css');
    wp_enqueue_style('academicsselfmade-owlthemedefaultcss', get_template_directory_uri() . '/assets/css/owl.theme.default.min.css');
    wp_enqueue_style('academicsselfmade-jqueryfancyboxcss', get_template_directory_uri() . '/assets/css/jquery.fancybox.min.css');
    wp_enqueue_style('academicsselfmade-bootstrap-datepickercss', get_template_directory_uri() . '/assets/css/bootstrap-datepicker.css');
    wp_enqueue_style('academicsselfmade-flaticoncss', get_template_directory_uri() . '/assets/fonts/flaticon/font/flaticon.css');   
    wp_enqueue_style('academicsselfmade-aoscss', get_template_directory_uri() . '/assets/css/aos.css');   
    wp_enqueue_style('academicsselfmade-jquerymbYTPlayercss', get_template_directory_uri() . '/assets/css/jquery.mb.YTPlayer.min.css');   
    wp_enqueue_style('academicsselfmade-stylecss', get_template_directory_uri() . '/assets/css/style.css');   

    wp_enqueue_script('academicsselfmade-jquery331js',  get_template_directory_uri() . '/assets/js/jquery-3.3.1.min.js', array(), null, true); 
    wp_enqueue_script('academicsselfmade-jquerymigrate301js',  get_template_directory_uri() . '/assets/js/jquery-migrate-3.0.1.min.js', array(), null, true); 
    wp_enqueue_script('academicsselfmade-jqueryuijs',  get_template_directory_uri() . '/assets/js/jquery-ui.js', array(), null, true); 
    wp_enqueue_script('academicsselfmade-popperminjs',  get_template_directory_uri() . '/assets/js/popper.min.js', array(), null, true); 
    wp_enqueue_script('academicsselfmade-bootstrapminjs',  get_template_directory_uri() . '/assets/js/bootstrap.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-owlcarouselminjs',  get_template_directory_uri() . '/assets/js/owl.carousel.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jquerystellarminjs',  get_template_directory_uri() . '/assets/js/jquery.stellar.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jquerycountdownminjs',  get_template_directory_uri() . '/assets/js/jquery.countdown.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-bootstrapdatepickerminjs',  get_template_directory_uri() . '/assets/js/bootstrap-datepicker.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jqueryeasing13minjs',  get_template_directory_uri() . '/assets/js/jquery.easing.1.3.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-aosjs',  get_template_directory_uri() . '/assets/js/aos.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jqueryfancyboxminjs',  get_template_directory_uri() . '/assets/js/jquery.fancybox.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jquerystickyminjs',  get_template_directory_uri() . '/assets/js/jquery.sticky.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-jquerymbYTPlayerminjs',  get_template_directory_uri() . '/assets/js/jquery.mb.YTPlayer.min.js', array(), null, true);
    wp_enqueue_script('academicsselfmade-mainjs',  get_template_directory_uri() . '/assets/js/main.js', array(), null, true);
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