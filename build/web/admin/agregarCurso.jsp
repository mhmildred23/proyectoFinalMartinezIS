<%-- 
    Document   : agregarCurso
    Created on : 5/12/2025, 08:27:57 AM
    Author     : Max
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Verificar sesión (lo dejamos igual)
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Agregar Curso</title>
    <style>
        body { font-family: Arial; 
               background: linear-gradient(135deg, #1e88e5, #42a5f5); 
               margin: 0; padding: 0; 
             }
        .container { width: 450px; margin: 50px auto; 
                    background: white; padding: 30px; 
                    border-radius: 12px; 
                    box-shadow: 0 4px 20px rgba(0,0,0,0.2); 
                    }
        h2 { text-align: center; color: #333; 
           }
        label { font-weight: bold; 
                display: block; 
                margin-top: 10px; 
                color: #555; 
              }
        input[type="text"], 
        textarea { width: 100%; padding: 10px; 
                   border-radius: 6px; border: 1px solid #ccc; 
                   margin-top: 5px; 
                 }
        textarea { height: 80px; 
                }
        .btn { width: 100%; display: block;
              margin-top: 20px; 
              text-align: center; 
              padding: 12px; 
              background: #1976d2; color: white; 
              font-weight: bold; text-decoration: none; 
              border-radius: 6px; border: none; 
              cursor: pointer; 
             }
        .btn:hover { background: #0d47a1; 
                    }
        .nota { font-size: 12px; 
               color: #d32f2f;
               margin-top: 5px; 
              }
    </style>
</head>

<body>

    <div class="container">

        <h2>Agregar Nuevo Curso</h2>

        <form method="POST" action="guardarCurso.jsp">

            <label>Título del curso:</label>
            <input type="text" name="titulo" required>

            <label>Descripción:</label>
            <textarea name="descripcion" required></textarea>

            <label>Nombre de la Imagen:</label>
            <input type="text" name="imagen" placeholder="Ejemplo: curso1.jpg" required>
            <p class="nota">* Asegúrate de copiar la imagen con este nombre en tu carpeta 'img' manualmente.</p>

            <button class="btn" type="submit">Guardar Curso</button>
        </form>

    </div>

</body>
</html>