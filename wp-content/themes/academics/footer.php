<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <!-- <p class="mb-4"><img src="images/logo.png" alt="Image" class="img-fluid"></p> -->
                <?php the_custom_logo();?>
                <p>История моего становления как программиста начинается с далекого 1995 года
                </p>
                <p><a href="<?php echo esc_url( home_url( '/category/history' ) ); ?>">Подробнее</a></p>
            </div>
            <div class="col-lg-3">
                <h3 class="footer-heading"><span>Our Campus</span></h3>
                <ul class="list-unstyled">
                    <li><a href="#">Acedemic</a></li>
                    <li><a href="#">News</a></li>
                    <li><a href="#">Our Interns</a></li>
                    <li><a href="#">Our Leadership</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Human Resources</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h3 class="footer-heading"><span>Our Courses</span></h3>
                <ul class="list-unstyled">
                    <li><a href="#">Math</a></li>
                    <li><a href="#">Science &amp; Engineering</a></li>
                    <li><a href="#">Arts &amp; Humanities</a></li>
                    <li><a href="#">Economics &amp; Finance</a></li>
                    <li><a href="#">Business Administration</a></li>
                    <li><a href="#">Computer Science</a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <h3 class="footer-heading"><span>Contact</span></h3>
                <ul class="list-unstyled">
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Support Community</a></li>
                    <li><a href="#">Press</a></li>
                    <li><a href="#">Share Your Story</a></li>
                    <li><a href="#">Our Supporters</a></li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="copyright">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>
                        document.write(new Date().getFullYear());
                        </script> Все права защищены | Эта тема сделана с <i class="icon-heart"
                            aria-hidden="true"></i> компанией <a href="https://colorlib.com" target="_blank">Colorlib</a> и адаптирована <a href="/">мной</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
<!-- .site-wrap -->


<!-- loader -->
<div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
            stroke="#51be78" />
    </svg></div>


<?php wp_footer(); ?>
</body>

</html>