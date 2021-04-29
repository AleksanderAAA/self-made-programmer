<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <title><?php the_title();?></title> -->
    <!-- <title><?php bloginfo('name'); echo "|"; bloginfo('description');?></title> -->
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <?php wp_head(); ?>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

    <div class="site-wrap">

        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>


        <div class="py-2 bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-9 d-none d-lg-block">
                        <a href="#" class="small mr-3"><span class="icon-question-circle-o mr-2"></span> Есть вопросы?</a>
                        <?php  $phv = get_option('theme_contact_phone_visible');  
                             if($phv){ ?>
                               <a href="tel:<?php echo get_option('theme_contact_phone');?>" class="small mr-3"><span class="icon-phone2 mr-2"></span> <?php echo get_option('theme_contact_phone');?></a>
                        <?php }
                             if(get_option('theme_contact_mail_visible')){ ?>
                              <a href="mailto:<?php echo get_option('theme_contact_mail');?>" class="small mr-3"><span class="icon-envelope-o mr-2"></span> <?php echo get_option('theme_contact_mail');?></a>
                         <?php } ?>
                    </div>
                    <!-- Пока закомментирую т.к. нет никакой регистрации на сайте 
                        <div class="col-lg-3 text-right">
                        <a href="login.html" class="small mr-3"><span class="icon-unlock-alt"></span> Log In</a>
                        <a href="register.html" class="small btn btn-primary px-4 py-2 rounded-0"><span
                                class="icon-users"></span> Register</a>
                    </div> -->
                </div>
            </div>
        </div>
        <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

            <div class="container">
                <div class="d-flex align-items-center">
                    <div class="site-logo">
                    <?php the_custom_logo();?>
                        <!-- <a href="index.html" class="d-block">
                            <img src="images/logo.jpg" alt="Image" class="img-fluid">
                        </a> -->
                    </div>
                    <div class="mr-auto">
                        
                        
                        <nav class="site-navigation position-relative text-right" role="navigation">
                        <?php 
                                wp_nav_menu([
                                    'theme_location' => 'header_menu',
                                    'container' => false,
                                    'menu_class' => 'site-menu main-menu js-clone-nav mr-auto d-none d-lg-block',
                                    'echo' => true,
                                    'fallback_cb' => 'wp_page_menu',
                                    'items_wrap' => '<ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">%3$s</ul>',
                                    'depth' => 2,
                                    'walker' => new Academics_Self_Made_Walker_Nav_Menu  
                                ]);
                                ?>                          
                           
                        </nav>

                    </div>
                    <div class="ml-auto">
                        <div class="social-wrap">
                        
                              
                            <!-- <a href="#"><span class="icon-facebook"></span></a>
                            <a href="#"><span class="icon-twitter"></span></a>
                            <a href="#"><span class="icon-linkedin"></span></a> -->

                            <a href="#"
                                class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                                    class="icon-menu h3"></span></a>
                        </div>
                    </div>

                </div>
            </div>

        </header>