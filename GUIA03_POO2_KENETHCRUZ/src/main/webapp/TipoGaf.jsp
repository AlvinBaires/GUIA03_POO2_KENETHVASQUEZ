<%-- 
    Document   : TipoGaf
    Created on : 08-24-2016, 05:46:03 PM
    Author     : Laboratorio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.sv.udb.controlador.TipoGafeCtrl"%>
<%@page import="com.sv.udb.modelo.TipoGafe"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display" %>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>GUIA DE POO2</title>
    
     <!-- Normalize CSS -->
	<link rel="stylesheet" href="css/normalize.css">
    
     <!-- Materialize CSS -->
	<link rel="stylesheet" href="css/materialize.min.css">
    
     <!-- Material Design Iconic Font CSS -->
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    
    <!-- Malihu jQuery custom content scroller CSS -->
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    
    <!-- Sweet Alert CSS -->
    <link rel="stylesheet" href="css/sweetalert.css">
    
    <!-- MaterialDark CSS -->
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Nav Lateral -->
    <section class="NavLateral full-width">
        <div class="NavLateral-FontMenu full-width ShowHideMenu"></div>
        <div class="NavLateral-content full-width">
            <header class="NavLateral-title full-width center-align">
                JAVA WEB <i class="zmdi zmdi-close NavLateral-title-btn ShowHideMenu"></i>
            </header>
            <figure class="full-width NavLateral-logo">
                <img src="assets/img/logo.png" alt="material-logo" class="responsive-img center-box">
                <figcaption class="center-align">Guia 03 de estudio</figcaption>
            </figure> 
            <div class="NavLateral-Nav">
                <ul class="full-width">
                    <li>
                        <a href="index.html" class="waves-effect waves-light"><i class="zmdi zmdi-view-web zmdi-hc-fw"></i> INICIO</a>
                    </li>
                    <li>
                        <a href="Lugar.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Lugar</a>
                    </li>
                    <li>
                        <a href="TipoDoc.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Tipo documento</a>
                    </li>
                    <li>
                        <a href="TipoGaf.jsp" class="waves-effect waves-light"><i class="zmdi zmdi-desktop-windows zmdi-hc-fw"></i>Tipo gafete</a>
                    </li>
                </ul>
            </div>  
        </div>  
    </section>

    <!-- Page content -->
    <section class="ContentPage full-width">
        <!-- Nav Info -->
        <div class="ContentPage-Nav full-width">
            <ul class="full-width">
                <li class="btn-MobileMenu ShowHideMenu"><a href="#" class="tooltipped waves-effect waves-light" data-position="bottom" data-delay="50" data-tooltip="Menu"><i class="zmdi zmdi-more-vert"></i></a></li>
                <li><figure><img src="assets/img/user.png" alt="UserImage"></figure></li>
                <li style="padding:0 5px;">Keneth Cruz</li>
                <li><a href="#" class="tooltipped waves-effect waves-light btn-ExitSystem" data-position="bottom" data-delay="50" data-tooltip="Cerrar sesion"><i class="zmdi zmdi-power"></i></a></li>
                <li><a href="#" class="tooltipped waves-effect waves-light btn-Search" data-position="bottom" data-delay="50" data-tooltip="Buscar"><i class="zmdi zmdi-search"></i></a></li>
               
            </ul>   
        </div>

        <!-- Notifications area -->
        <div class="container">
            <div class="row">
                <h2 class="center-align">Registros de tipos de gafetes</h2>
                <div class="input-field col s6">
                    <center><h5>Movimiento realizado:</h5></center>
                </div>
                <div class="input-field col s6">
                    <center><h5>${mensAler}</h5></center>
                </div>

                <br><br>
                <form class="col s12" role="form" action="TipoGafServ" method="post">
                    <input type="hidden" name="codiTipoGafe" value="${codiTipoGafe}"/>
      
                <div class="row">
                    <div class="input-field col s12">
                        <label for="nombTipoGafe">Nombre del tipo documento</label>
                        <br>
                        <input name="nombTipoGafe" type="text" class="validate" value="${nombTipoGafe}"/>
                        
                    </div>
                        <!--
                    <div class="input-field col s6">
                        <input type="checkbox" id="test5" value="" />
                        <label for="test5">Estado del lugar acceso</label>
                        
                    </div>-->
                </div>        
        
                        <br><br><br>
        <!--acciones-->
        <div class="container" style="margin-bottom: 128px;">
            <div class="row">
                
                <div class="col s12 center-align">
                     <input type="submit" class="waves-effect waves-light btn"  name="cursBton" value="Guardar"/>
                     <input type="submit" class="waves-effect waves-light btn"  name="cursBton" value="Modificar"/>
                     <input type="submit" class="waves-effect waves-light btn"  name="cursBton" value="Eliminar" onclick="return confirm('¿Estas seguro que deseas eliminar este registro?');"/>
                     
                    
                </div>
            </div>
        </div>
                </form>
        
        <!--registros consultados-->
        <form class="col s12" method="POST" name="Frm" action="TipoGafServ">
            <% request.setAttribute( "demoAttr", new TipoGafeCtrl().ConsTodo() ); %>
                <div class="container" style="margin-bottom: 128px;">
                <div class="row">
                    <h3 class="center-align">Lista de tipos de gafetes</h3>
                    <div class="col s12">
                        <div id = "TablaDatos">
                            <display:table id="TipoGaf" name="demoAttr" class="bordered highlight centered">
                                <display:column property="nombTipoGafe" title="Nombre tipo gafete"sortable="true"/>
                                <display:column property="fechAlta" title="Fecha alta" sortable="true"/>
                                <display:column  property="fechBaja" title="Fecha baja" sortable="true"/>
                                <display:column  title="Dar de baja" sortable="true">
                                    <div class="row">
                                        <div class="col s12 center-align">
                                            <input type="submit" class="waves-effect waves-light btn red"  name="cursBton" value="Degradar"/>
                                        </div>
                                    </div>                                            
                                    </display:column>
                                <display:column title="Selecione" sortable="true">
                                    <input type="radio" name="codiTipoGafe" id="${TipoGaf.codiTipoGafe}" value="${TipoGaf.codiTipoGafe}"/>
                                    <label for="${TipoGaf.codiTipoGafe}"></label>
                                </display:column>
                            </display:table>
                        </div>
                        <br>

                         <div class="container" style="margin-bottom: 128px;">
            <div class="row">
                
                <div class="col s12">
                    <div class="fixed-action-btn" style="bottom: 128px; right: 50px;">
                        <a class="btn-floating btn-large red">
                            <i class="large zmdi zmdi-toll"></i>
                        </a>
                        <ul>
                            
                            <li><a class="btn-floating red"><i class="zmdi zmdi-save" ></i></a></li>
                            <li><a class="btn-floating yellow darken-1"><i class="zmdi zmdi-apple"></i></a></li>
                            <li><a class="btn-floating green"><i class="zmdi zmdi-text-format"></i></a></li>
                            <li><a class="btn-floating blue"><i class="zmdi zmdi-crop"></i></a></li>
                        </ul>
                    </div>   
                </div>
            </div>
        </div>
                        <!--acciones-->
                        <div class="container" style="margin-bottom: 128px;">
                            <div class="row">
                                <div class="col s12 center-align">
                                    <input type="submit" class="waves-effect waves-light btn"  name="cursBton" value="Consultar"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
        </form>
            </div>
        </div>

        <!--Icon Prefixes-->



        <br><br><br><br><br><br><br>
        <!-- Footer -->
        <footer class="footer-MaterialDark">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">

                    </div>
                    <div class="col l4 offset-l2 s12">

                    </div>
                </div>
            </div>
            <div class="NavLateralDivider"></div>
            <div class="footer-copyright">
                <div class="container center-align">
                    © 2016 Keneth Orlando Vasquez Cruz
                </div>
            </div>
        </footer>
    </section>

    <!-- Sweet Alert JS -->
    <script src="js/sweetalert.min.js"></script>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-2.2.0.min.js"><\/script>')</script>

    <!-- Materialize JS -->
    <script src="js/materialize.min.js"></script>

    <!-- Malihu jQuery custom content scroller JS -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- MaterialDark JS -->
    <script src="js/main.js"></script>
</body>
</html>
