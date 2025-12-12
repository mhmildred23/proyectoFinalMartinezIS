<%-- 
    Document   : conexion
    Created on : 5/12/2025, 7:45:11 AM
    Author     : Max
--%>

<%@ page import="java.sql.*" %>

<%
    Connection conexion = null;

    String url = "jdbc:mysql://localhost:3306/bdmildredis";
    String user = "root";
    String pass = "";

    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        conexion = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("Error en conexión BD: " + e.getMessage());
    }
%>
