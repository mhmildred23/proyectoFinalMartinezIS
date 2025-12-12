<%-- 
    Document   : eliminarCurso
    Created on : 5/12/2025, 08:56:00 AM
    Author     : Max
--%>

<%@ page import="java.sql.*" %>
<%@ include file="../conexion.jsp" %> 
<%-- OJO: Si tu conexion.jsp está en la misma carpeta, quita los "../" --%>

<%
    String id = request.getParameter("id");

    if(id != null) {
        try {
            String sql = "DELETE FROM cursos WHERE id_curso = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, id);
            
            int filas = ps.executeUpdate();
            ps.close();
            conexion.close();
            
            if(filas > 0){
                response.sendRedirect("panelAdmin.jsp");
            } else {
                out.println("<script>alert('No se encontró el curso a eliminar'); window.location='panelAdmin.jsp';</script>");
            }

        } catch (Exception e) {
            out.println("Error al eliminar: " + e.getMessage());
        }
    } else {
        response.sendRedirect("panelAdmin.jsp");
    }
%>