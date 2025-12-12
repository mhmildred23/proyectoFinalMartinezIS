<%-- 
    Document   : guardarCurso.jsp
    Created on : 5/12/2025, 08:31:14 AM
    Author     : Max
--%>

<%@ page import="java.sql.*" %>
<%@ include file="../conexion.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String titulo = request.getParameter("titulo");
    String descripcion = request.getParameter("descripcion");
    String imagen = request.getParameter("imagen"); 

    try {
        // Validacion simple para evitar el error NULL
        if(titulo != null && !titulo.isEmpty()){
            
            String sql = "INSERT INTO cursos (titulo, descripcion, imagen) VALUES (?, ?, ?)";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, titulo);
            ps.setString(2, descripcion);
            ps.setString(3, imagen);

            ps.executeUpdate();
            ps.close();
            conexion.close();

            out.println("<script>alert('Curso agregado correctamente'); window.location='panelAdmin.jsp';</script>");
        } else {
             out.println("<script>alert('Error: El título venía vacío'); window.history.back();</script>");
        }

    } catch (Exception e) {
        out.println("Error al guardar: " + e.getMessage());
    }
%>