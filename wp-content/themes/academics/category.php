<?php
/**
 * Этот шаблон показывает состав одной категории
 *
 * 
 *
 * @package WordPress
 * @subpackage Academics Self Made
 * @since Academics Self Made 1.0
 */

get_header();

$description = get_the_archive_description(); // Это выводит описание рубрики
$thisCat = get_category( get_query_var('cat') ); // А это полностью все настройки текущей рубрики


?>

<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('images/bg_1.jpg')">
        <div class="container">
          <div class="row align-items-end">
            <div class="col-lg-7">
              <h2 class="mb-0"><?php echo $thisCat->name; ?></h2>
              <p><?php echo $thisCat->description; ?></p>
            </div>
          </div>
        </div>
      </div> 
    
<?php 
print_r( $thisCat );?>

    <div class="custom-breadcrumns border-bottom">
      <div class="container">
        <a href="<?php echo esc_html(home_url('/'))?>">Главная</a>
        <span class="mx-3 icon-keyboard_arrow_right"></span>
        <span class="current"><?php echo $thisCat->name; ?></span>
      </div>
    </div>

	<div class="site-section">
        <div class="container">
            <div class="row">

<?php if ( have_posts() ) : ?>

	

	<?php while ( have_posts() ) : ?>
		<?php the_post(); ?>
		<?php 
		   $catt = get_the_category();  		   
		   get_template_part( 'template-parts/content/category/category-' . $catt[0]->slug); 
		?>
	<?php endwhile; ?>

	<?php //twenty_twenty_one_the_posts_navigation(); ?>

<?php else : ?>
	<?php get_template_part( 'template-parts/content/content-none' ); ?>
<?php endif; ?>

			</div>
			</div>
			</div>

<?php get_footer(); ?>
