<%-- 
    Document   : datos
    Created on : 16/02/2019, 07:47:19 PM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <%@ include file="shared/header.jsp" %>
    </head>
    <body>
        <!-- Navbar -->
        <%@ include file="shared/navbar.jsp" %>

        <div class="container">
            <div class="row ">
                <div class="col-8 col-xs-12">
                    <div class="card border-info mb-3" >
                        <div class="card-header"> <h3>Alumnos por Carrera</h3> </div>
                        <div class="card-body">
                            <!--<h4 class="card-title">Alumno</h4>-->
                            <p class="card-text">Relación de alumnos que existen por carrera </p>
                            <canvas id="graphAlumnosPorCarrera">

                            </canvas>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- footer -->
        <%@ include file="shared/footer.jsp" %>
        <script src="assets/js/Chart.min.js"></script>
        <script>
            
            const ctx = $("#graphAlumnosPorCarrera");
            var datos = {};
            var config = {
                type: 'doughnut',
                data: {
                    datasets: [{
                            data: [
                                50,
                                110
                            ],
                            backgroundColor: [
                                '#3498DB','#F39C12', '#E74C3C', '#18BC9C', '#2C3E50',
                                '#0FF153','#F1C40F', '#0F3CF1', '#F10FAD',
                                '#E74C3C', '#82E73C', '#3CD7E7', '#A23CE7'
                            ],
                            label: 'Dataset 1'
                        }],
                    labels: [
                        'Red',
                        'Orange',
                    ]
                },
                options: {
                    responsive: true
                }
            };
            
            var myPieChart = new Chart(ctx, config);
            
            function getAlumnosCarrera() {
                $.ajax({
                    type:'GET',
                    url: 'MostrarAlumnosCarrera',
                    success: function (responseText) {
                        datos = JSON.parse(responseText);
                        config.data.datasets[0].data = datos.data;
                        config.data.labels = datos.labels;
                        myPieChart.update();
                    }
                });
            }
            
            getAlumnosCarrera();
            
        </script>
    </body>
</html>