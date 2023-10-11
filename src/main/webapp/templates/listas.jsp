<%-- 
    Document   : listas
    Created on : 10 oct 2023, 16:41:28
    Author     : danie
--%>

<%@page import="com.umariana.mavenproject1.ControlUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.mavenproject1.Usurios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           ServletContext context = request.getServletContext();  
           
           String nombre = request.getParameter("nombre_usuario");
           
        %>
        <h1>Bienvenido: <%=nombre%></h1>
    </body>
</html>
