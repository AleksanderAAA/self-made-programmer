<?php

add_action('wp_enqueue_scripts', 'astrachild_styles');

function astrachild_styles(){
    wp_enqueue_style('parent-astra-style', get_template_directory_uri() . '/style.css');
    wp_enqueue_style('child-astra-style', get_stylesheet_directory_uri() . '/style.css');
}

add_shortcode('render-history-archive', 'shortcode_render_history_archive');

function shortcode_render_history_archive(){
    $result = '';
    $anonce = '';
    $posts = get_posts(array(
        'numberposts' => 3,
        'category_name' => 'navyk',
        'orderby' => 'date',
        'order' => 'ASC',
        'post_type' => 'post',
        'suppress_filters' => true
     ));
    foreach($posts as $post){
        setup_postdata($post);
        $anonce = '';
        $f = get_field('navyk_description');
        $g = wp_trim_words($f, 10, ' ...');
        $anonce = $g;  

        $result = $result .
                    '<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">' .
                    '<div class="feature-1 border navyk-row-item">' .
                    '<div class="icon-wrapper bg-primary">' .
                    '    <span class="' . the_field('navyk_icon') . '"></span>' .
                    '</div>' .
                    '<div class="feature-1-content">'.                        
                        '<h2>' . the_title() . '</h2>' .
                        '<p>' . $anonce . '</p>' . 
                        '<a href="' . get_permalink() . '" class="btn btn-primary px-4 rounded-0">Подробнее</a>' .
                    '</div> ' .
                    '</div>' . 
                    '</div>';

        wp_reset_postdata();
        
    }

    return $result;
}

?>