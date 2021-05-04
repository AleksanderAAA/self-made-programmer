<?php

?>




<div class="site-section">
	<h2 class="subtitle"><?php the_title(); ?></h2>


<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>


	<div class="container">
		
<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
          <div class="row align-items-end">
            <div class="col-lg-7">
              <h2 class="mb-0"><?php the_title(); ?></h2>              
            </div>
          </div>
        </div>
      </div> 
    

    <div class="custom-breadcrumns border-bottom">
      <div class="container">
        <a href="/">Главная</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current">Услуги</span>
      </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-9 mb-4">
                    <!-- <p class="mb-5">              <img src="<?php  the_field('navyk_img'); ?>" alt="Image" class="img-fluid">         </p> -->
                    <p><?php the_field('uslugi_description');?></p>
                    <p><?php the_field('uslugi_polnoe_opisanie');?>             </p>
                    <p><?php the_field('uslugi_page_count');?>             </p>
                    <p><?php the_field('uslugi_work_days');?>             </p>
                    <p><?php the_field('uslugi_website_cost');?>             </p>
                    <p><?php the_field('uslugi_has_content');?>             </p>
                    <p><?php the_field('uslugi_theme_made');?>             </p>
                    <p><?php the_field('uslugi_programm_type');?>             </p>
                    <p><?php the_field('uslugi_content_develop');?>             </p>
                    <p class="post-date">Дата публикации: <?php
                  // Выводим дату публикации и автора
                  the_date('l d F Y');
              ?> в <?php the_time('G:i');?>, автор <?php the_author();?></p>
                </div>
                
            </div>
        </div>
    </div>

	</div><!-- .entry-content -->


</article><!-- #post-<?php the_ID(); ?> -->
</div>