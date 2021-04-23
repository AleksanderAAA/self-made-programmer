<?php
/**
 * 
 * Template Name: Моя история
 * 
 * 
 */

?>

<?php
  get_header();
?>
<div class="aboutus" id="aboutus">
    <div class="container">
        <h1 class="title">Моя история</h1>
        <div class="row">
            <div class="col-lg-6">
            <?php 
              $posts = get_posts(array(
                          'numberposts' => -1,
                          'category_name' => 'moya-istoriya',
                          'orderby' => 'date',
                          'order' => 'ASC',
                          'post_type' => 'post',
                          'suppress_filters' => true
                       ));
              foreach($posts as $post){
                  setup_postdata($post);
                  ?>
                <div class="subtitle">
                         <?php the_title();?>
                </div>
                <div class="aboutus__text">
                    <?php the_field('history_description');?>
                    <a href="<?php echo get_permalink(); ?>" class="minibutton">Подробнее</a>
                </div>
                <div class="col-lg-6">
                    <img class="aboutus__img" src="<?php 
                                            if(has_post_thumbnail()){
                                                the_post_thumbnail_url();          
                                            }
                                            else{
                                                echo get_template_directory_uri() . '/assets/img/not-found.jpg';
                                            }
                                            ?>)"
                        alt="<?php the_title();?>">
                </div>
            
                        
            </div>
            </div>
            <?php
              }         
              wp_reset_postdata();
        ?>         

               
</div>
            </div>








<?php
  get_footer();
?>