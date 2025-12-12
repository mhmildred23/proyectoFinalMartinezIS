<%-- 
    Document   : login
    Created on : 5/12/2025, 07:34:06 AM
    Author     : Max
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Campus Martinez</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        /* --------------------- ESTILOS GLOBALES --------------------- */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(145deg, #ffb3d1, #d8a4ea);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: flex;
            width: 85%;
            max-width: 1100px;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0,0,0,0.20);
        }

        /* --------------------- PANEL IZQUIERDO --------------------- */
        .left-panel {
            width: 50%;
            background: linear-gradient(145deg, #e37cd3, #d289f0);
            padding: 60px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .left-panel h1 {
            font-size: 45px;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .left-panel p {
            font-size: 18px;
            margin-bottom: 12px;
            line-height: 1.6;
        }

        /* --------------------- PANEL DERECHO --------------------- */
        .form-container {
            width: 50%;
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-container h2 {
            font-size: 32px;
            text-align: center;
            color: #4b2b4f;
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            margin-top: 15px;
            color: #4b2b4f;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-top: 6px;
            border-radius: 12px;
            border: 1.8px solid #e0c0ea;
            font-size: 15px;
            transition: 0.3s ease;
        }

        input:focus {
            border-color: #c772df;
            box-shadow: 0 0 6px rgba(199, 114, 223, 0.5);
            outline: none;
        }

        /* BOTÓN */
        .btn-login {
            width: 100%;
            border: none;
            padding: 15px;
            margin-top: 35px;
            background: linear-gradient(135deg, #ff6fb0, #d27ee3);
            color: white;
            font-size: 18px;
            border-radius: 30px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        }

        /* LINK OLVIDAR CONTRASEÑA */
        .forgot {
            text-align: center;
            margin-top: 18px;
        }

        .forgot a {
            color: #b059d8;
            font-size: 14px;
            text-decoration: none;
        }

        .forgot a:hover {
            text-decoration: underline;
        }

        /* --------------------- RESPONSIVE --------------------- */
        @media (max-width: 900px) {
            .container {
                flex-direction: column;
                width: 95%;
            }
            .left-panel, .form-container {
                width: 100%;
                text-align: center;
                padding: 40px;
            }
        }
    </style>
</head>

<body>

    <div class="container">

        <!-- PANEL IZQUIERDO -->
        <div class="left-panel">
            <h1>¡Bienvenid@!</h1>
            <p>Accede a la nueva plataforma educativa impulsada por IA.</p>
            <p>La educación es el regalo que transforma tu futuro.</p>
        </div>

        <!-- PANEL DERECHO -->
        <div class="form-container">
            <h2>Campus <span style="color:#d27ee3;">Martinez</span></h2>

            <form action="validar.jsp" method="post">
                <label>Usuario</label>
                <input type="text" name="usuario" required>

                <label>Contraseña</label>
                <input type="password" name="password" required>

                <button type="submit" class="btn-login">Acceder a mi cuenta</button>
            </form>

            <div class="forgot">
                <a href="#">¿Olvidaste tu contraseña?</a>
            </div>
        </div>

    </div>

</body>
</html>