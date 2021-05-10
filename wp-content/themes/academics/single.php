<?php


get_header();
?>
    

	<!-- <div id="primary" class="content-area">
		<main id="main" class="site-main"> -->

			<?php

			// Start the Loop.
			while ( have_posts() ) :
				the_post();

              //  $cat = get_category(); 

				$catt = get_the_category();  
				if($catt[0]->slug == 'moi-uslugi'){
				    get_template_part( 'template-parts/content/content-moi-uslugi', get_post_type());				
				}
				elseif($catt[0]->slug == 'navyk'){
                    get_template_part( 'template-parts/content/content-navyk', get_post_type());			
				}
				elseif($catt[0]->slug == 'moya-istoriya'){
                    get_template_part( 'template-parts/content/content-moya-istoriya', get_post_type());			
				}
				else{
					get_template_part( 'template-parts/content/content', get_post_type());			
				}
				
				
			endwhile; // End the loop.
			?>

		<!-- </main>
	</div>      -->

<?php
get_footer();
?>




    
    
    
      

  