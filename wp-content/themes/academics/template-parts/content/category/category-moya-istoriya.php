<div class="col-md-12 mb-4">
    <div class="course-1-item">
        <figure class="thumnail">
        <a href="<?php get_permalink();?>"><?php 
                       $image = get_field('history_img');
                       if(!empty($image)) : ?>
                    <img src="<?php echo $image['url'];?>" alt="<?php echo $image['alt'];?>" class="img-fluid">
                    <?php endif;
                    ?></a>
        </figure>
        
        <div class="course-1-content pb-4">
            <h2><?php the_field('history_title');?></h2>
            
                    <img class="img-fluid" src="<?php 
                                            if(has_post_thumbnail()){
                                                the_post_thumbnail_url();          
                                            }
                                            else{
                                                echo get_template_directory_uri() . '/assets/images/not-found.jpg';
                                            }
                                            ?>"
                        alt="<?php the_title();?>">
       

        
            <p class="desc mb-4"><?php the_field('history_description');?></p>
            <p class="post-date">Дата публикации: <?php
                    // Выводим дату публикации и автора
                    the_date('l d F Y');
                ?> в <?php the_time('G:i');?>, автор <?php the_author();?></p>
        </div>
    </div>
</div>