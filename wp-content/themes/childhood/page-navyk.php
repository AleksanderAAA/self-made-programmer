<?php
/**
 * 
 * Template Name: Навыки
 * 
 * 
 */

?>

<?php
  get_header();
?>
<div class="toys" id="toys">
    <div class="container">
        <h2 class="subtitle">Мои навыки</h2>
        <div class="toys__wrapper">
        <?php 
              $posts = get_posts(array(
                          'numberposts' => -1,
                          'category_name' => 'navyk',
                          'orderby' => 'date',
                          'order' => 'ASC',
                          'post_type' => 'post',
                          'suppress_filters' => true
                       ));
              foreach($posts as $post){
                  setup_postdata($post);
                  ?>
                        <div class="toys__item"
                            style="background-image: url(<?php 
                                        if(has_post_thumbnail()){
                                            the_post_thumbnail_url();          
                                        }
                                        else{
                                            echo get_template_directory_uri() . '/assets/img/not-found.jpg';
                                        }
                                        ?>)">
                            <div class="toys__item-info">
                    <div class="toys__item-title"><?php the_title();?></div>
                    <div class="toys__item-descr">
                    <?php the_field('navyk_description');?>
                    </div>
                    <a href="<?php echo get_permalink(); ?>" class="minibutton toys__trigger">Подробнее</a>
                </div>
            </div>
            <?php
              }         
              wp_reset_postdata();
        ?>     

           
        </div>     
        
    </div>
</div>


<?php
  get_footer();
?>