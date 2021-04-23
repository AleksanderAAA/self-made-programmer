<!DOCTYPE html>
<html lang="en">

<head>
    <!-- <title><?php the_title();?></title> -->
    <title><?php bloginfo('name'); echo "|"; bloginfo('description');?></title>
    
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
                    <?php error_log(print_r(the_field('contact_telefon')));?>
                        <a href="#" class="small mr-3"><span class="icon-question-circle-o mr-2"></span> Есть вопросы?</a>
                        <a href="tel:<?php the_field('contact_telefon')?>" class="small mr-3"><span class="icon-phone2 mr-2"></span> <?php the_field('contact_telefon')?></a>
                        <a href="mailto:<?php the_field('contact_email')?>" class="small mr-3"><span class="icon-envelope-o mr-2"></span> <?php the_field('contact_email')?></a>
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
                            <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                <li class="active">
                                    <a href="index.html" class="nav-link text-left">Home</a>
                                </li>
                                <li class="has-children">
                                    <a href="about.html" class="nav-link text-left">About Us</a>
                                    <ul class="dropdown">
                                        <li><a href="teachers.html">Our Teachers</a></li>
                                        <li><a href="about.html">Our School</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="admissions.html" class="nav-link text-left">Admissions</a>
                                </li>
                                <li>
                                    <a href="courses.html" class="nav-link text-left">Courses</a>
                                </li>
                                <li>
                                    <a href="contact.html" class="nav-link text-left">Contact</a>
                                </li>
                            </ul>
                            </ul>
                        </nav>

                    </div>
                    <div class="ml-auto">
                        <div class="social-wrap">
                            <a href="#"><span class="icon-facebook"></span></a>
                            <a href="#"><span class="icon-twitter"></span></a>
                            <a href="#"><span class="icon-linkedin"></span></a>

                            <a href="#"
                                class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                                    class="icon-menu h3"></span></a>
                        </div>
                    </div>

                </div>
            </div>

        </header>