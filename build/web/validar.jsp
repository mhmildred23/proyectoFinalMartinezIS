<%-- 
    Document   : validar
    Created on : 5/12/2025, 7:53:32 AM
    Author     : Max
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Recibir datos del formulario
    String usuario = request.getParameter("usuario");
    String password = request.getParameter("password");

    // Validar campos vacíos
    if (usuario == null || password == null || usuario.isEmpty() || password.isEmpty()) {
        response.sendRedirect("login.jsp?error=1");
        return;
    }

    Connection conexion = null;

    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bdmildredis?useSSL=false&serverTimezone=UTC",
            "root",
            ""
        );

        // Consulta de usuario válido
        String sql = "SELECT * FROM usuarios WHERE usuario=? AND password=?";
        PreparedStatement ps = conexion.prepareStatement(sql);

        ps.setString(1, usuario);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {  
            // Crear sesión con datos del usuario
            session.setAttribute("id_usuario", rs.getInt("id_usuario"));
            session.setAttribute("usuario", rs.getString("usuario"));
            session.setAttribute("nombre", rs.getString("nombre"));
            session.setAttribute("rol", rs.getString("rol"));

            // Redirección según el rol
            if (rs.getString("rol").equals("admin")) {
                response.sendRedirect("admin/panelAdmin.jsp");
            } else {
                response.sendRedirect("bienvenida.jsp");  // Página para alumnos
            }

        } else {
            response.sendRedirect("login.jsp?error=2");
        }

        conexion.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
