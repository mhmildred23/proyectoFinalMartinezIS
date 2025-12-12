<%-- 
    Document   : panelAdmin
    Created on : 5/12/2025, 08:18:36 AM
    Author     : Max
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Panel de Administración</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #1e88e5, #42a5f5);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }

        h1 {
            margin: 0;
            color: #333;
            text-align: center;
            font-size: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            margin-bottom: 25px;
        }

        .btn {
            background: #1976d2;
            padding: 10px 18px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
        }

        .btn:hover {
            background: #0d47a1;
        }

        .btn-red {
            background: #e53935;
        }

        .btn-red:hover {
            background: #b71c1c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background: white;
        }

        th {
            background: #1976d2;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        img {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .welcome {
            font-size: 16px;
            text-align: center;
            color: #555;
            margin-top: 10px;
        }

    </style>
</head>

<body>

    <div class="container">

        <h1>Panel del Administrador</h1>
        <p class="welcome">Bienvenido <strong><%= session.getAttribute("nombre") %></strong></p>

        <div class="top-bar">
            <a class="btn" href="agregarCurso.jsp">+ Agregar Curso</a>
            <a class="btn-red btn" href="../logout.jsp">Cerrar Sesión</a>
        </div>

        <table>
            <tr>
                <th>Imagen</th>
                <th>Título</th>
                <th>Descripción</th>
                <th>Acciones</th>
            </tr>

            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bdmildredis?useSSL=false&serverTimezone=UTC",
                    "root", ""
                );

                PreparedStatement ps = con.prepareStatement("SELECT * FROM cursos");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><img src="<%= request.getContextPath() %>/img/<%= rs.getString("imagen") %>"></td>
                <td><%= rs.getString("titulo") %></td>
                <td><%= rs.getString("descripcion") %></td>
                <td>
                    <a class="btn" href="editarCurso.jsp?id=<%= rs.getInt("id_curso") %>">Editar</a>
                    <a class="btn-red btn" href="eliminarCurso.jsp?id=<%= rs.getInt("id_curso") %>">Eliminar</a>
                </td>
            </tr>

            <%
                }
                con.close();
            %>

        </table>

    </div>

</body>
</html>

