<%-- 
    Document   : logout
    Created on : 5/12/2025, 1o:18:47 AM
    Author     : Max
--%>

<%
    session.invalidate();  // Cierra la sesión
    response.sendRedirect("login.jsp");  // Redirige al login
%>

