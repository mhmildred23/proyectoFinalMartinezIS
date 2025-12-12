<%-- 
    Document   : editarCurso
    Created on : 5/12/2025, 08:48:44 AM
    Author     : Max
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conexion.jsp" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    String id = request.getParameter("id");
    String titulo = "";
    String descripcion = "";
    String imagen = "";
    
    try {
        String sql = "SELECT * FROM cursos WHERE id_curso = ?";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
            titulo = rs.getString("titulo");
            descripcion = rs.getString("descripcion");
            imagen = rs.getString("imagen");
        }
    } catch(Exception e) {
        out.println("Error al cargar datos: " + e.getMessage());
    }
%>

<html>
<head>
    <title>Editar Curso</title>
    <style>
        /* Estilos rápidos para que se vea bien en el examen */
        body { 
            font-family: Arial; 
            background: #eef2f3; margin: 0; padding: 0; 
            }
        .container { width: 450px; margin: 50px auto; background: white; 
                    padding: 30px; border-radius: 12px; 
                    box-shadow: 0 4px 20px rgba(0,0,0,0.1); 
                    }
        h2 { text-align: center; color: #333; 
            }
        label { font-weight: bold; display: block;
                margin-top: 10px; color: #555; 
              }
        input[type="text"], 
        textarea { width: 100%; padding: 10px; border-radius: 6px;
                   border: 1px solid #ccc; margin-top: 5px; box-sizing: border-box; 
                 }
        .btn { width: 100%; display: block; margin-top: 20px; padding: 12px; 
              background: #ff9800; color: white; font-weight: bold; border: none; border-radius: 6px; cursor: pointer; }
        
        .btn:hover { background: #e68900; }
        
        .btn-cancel { background: #999; text-decoration: none; 
                     display: block; text-align: center; margin-top: 10px;
                     padding: 10px; color: white; border-radius: 6px;
                    }
    </style>
</head>
<body>

    <div class="container">
        <h2>Editar Curso</h2>
        
        <form action="actualizarCurso.jsp" method="POST">
            
            <input type="hidden" name="id" value="<%= id %>">
            
            <label>Título:</label>
            <input type="text" name="titulo" value="<%= titulo %>" required>
            
            <label>Descripción:</label>
            <textarea name="descripcion" rows="5" required><%= descripcion %></textarea>
            
            <label>Nombre de la Imagen:</label>
            <input type="text" name="imagen" value="<%= imagen %>" required>
            
            <button type="submit" class="btn">Guardar Cambios</button>
            <a href="panelAdmin.jsp" class="btn-cancel">Cancelar</a>
        </form>
        
    </div>

</body>
</html>