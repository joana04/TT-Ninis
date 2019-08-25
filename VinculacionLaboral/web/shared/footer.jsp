<%-- 
    Document   : footer
    Created on : 16/02/2019, 09:34:15 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="col-12 footer font-small blue">
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">
        © 2019 Copyright: <a href="https://mdbootstrap.com/education/bootstrap/"> ESCOM </a>
    </div>
    <!-- scripts -->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/sweetalert2.js"></script>
    <script>
        $(window).scroll(function () {
            var top = $(document).scrollTop();
            $('.splash').css({
                'background-position': '0px -'+(top/3).toFixed(2)+'px'
            });
            if(top < 10)
                $('.navbar').removeClass('navbar-shadow');
            else
                $('.navbar').addClass('navbar-shadow');
        });
    </script>
</footer>