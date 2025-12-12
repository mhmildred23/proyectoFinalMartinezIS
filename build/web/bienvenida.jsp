<%-- 
    Document   : bienvenida
    Created on : 05/12/2025, 10:00:44 AM
    Author     : Max
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Portal Web: Aprendizaje, Uso Responsable y Seguridad en la IA Generativa</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        :root{
            --bg1: #0f1724;            /* fondo oscuro */
            --accent: #6a3bdc;         /* morado futurista */
            --accent2: #00e0d3;        /* cian */
            --card: #0b1220;           /* tarjeta */
            --glass: rgba(255,255,255,0.06);
            --muted: #aab2c7;
        }

        /* Reset y base */
        *{box-sizing:border-box}
        body{
            margin:0;
            font-family:'Poppins',system-ui,Segoe UI,Roboto,Arial;
            background: linear-gradient(180deg, #081226 0%, #0c1a2b 40%, #071022 100%);
            color:#e6eef8;
            -webkit-font-smoothing:antialiased;
            -moz-osx-font-smoothing:grayscale;
            line-height:1.45;
        }

        a{color:var(--accent); text-decoration:none}

        /* HEADER */
        header.site-header{
            background: linear-gradient(90deg, rgba(106,59,220,0.12), rgba(0,224,211,0.04));
            backdrop-filter: blur(6px);
            padding:22px 28px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            border-bottom:1px solid rgba(255,255,255,0.04);
        }
        .brand {
            display:flex;
            gap:16px;
            align-items:center;
        }
        .brand img{width:56px; height:56px; border-radius:10px; object-fit:cover; box-shadow:0 6px 20px rgba(106,59,220,0.12);}
        .brand h1{margin:0;font-size:18px;font-weight:700;color:#f6f7fb}
        .brand p{margin:0;font-size:12px;color:var(--muted)}

        .header-actions{
            display:flex;
            gap:12px;
            align-items:center;
        }
        .btn{
            background:linear-gradient(90deg,var(--accent),#d27ee3);
            color:#081226;
            padding:10px 14px;
            border-radius:12px;
            font-weight:700;
            border:none;
            cursor:pointer;
            box-shadow:0 8px 28px rgba(106,59,220,0.12);
        }
        .btn.ghost{
            background:transparent;
            color:var(--accent2);
            border:1px solid rgba(0,224,211,0.12);
            box-shadow:none;
        }

        /* Layout principal */
        main.container{
            width:92%;
            max-width:1200px;
            margin:28px auto 80px;
        }

        /* HERO / TITULO */
        .hero{
            display:grid;
            grid-template-columns: 1fr 360px;
            gap:26px;
            align-items:start;
            margin-bottom:28px;
        }
        .hero-card{
            background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
            padding:26px;
            border-radius:16px;
            box-shadow:0 12px 40px rgba(2,6,23,0.6);
            border:1px solid rgba(255,255,255,0.03);
        }
        .hero-title{font-size:20px; font-weight:700; color:#f8fbff; margin:0 0 8px}
        .hero-sub{color:var(--muted); margin:0 0 18px}
        .hero-cta{display:flex; gap:12px; align-items:center}

        /* NEWS (noticias destacadas) */
        .news-list{display:flex; flex-direction:column; gap:12px}
        .news-item{
            display:flex;
            gap:14px;
            align-items:flex-start;
            padding:12px;
            border-radius:12px;
            background:linear-gradient(90deg, rgba(106,59,220,0.03), rgba(0,224,211,0.01));
            transition:transform .22s ease, box-shadow .22s ease;
        }
        .news-item:hover{transform:translateY(-6px); box-shadow:0 18px 40px rgba(0,0,0,0.45)}
        .news-date{font-size:12px; color:var(--muted); width:100px}
        .news-content h4{margin:0 0 6px; font-size:15px; color:#eaf1ff}
        .news-content p{margin:0; color:var(--muted); font-size:13px}

        /* SECTIONS */
        .grid-2{display:grid; grid-template-columns:1fr 420px; gap:22px}
        .card{
            background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
            padding:18px; border-radius:14px; border:1px solid rgba(255,255,255,0.03);
            box-shadow:0 12px 30px rgba(2,6,23,0.6);
        }

        .section-title{
            display:flex; align-items:center; gap:12px; margin-bottom:12px;
        }
        .section-title h3{margin:0; color:#f8fbff}
        .muted{color:var(--muted)}

        /* Centro de aprendizaje: prompts y videos */
        .prompts{display:flex; flex-direction:column; gap:10px}
        .prompt{
            background:linear-gradient(90deg, rgba(106,59,220,0.03), rgba(0,224,211,0.02));
            padding:10px; border-radius:10px; font-size:14px;
            color:#eef7ff; display:flex; justify-content:space-between; gap:10px;
        }
        .prompt .tag{font-size:12px; color:var(--muted)}

        .video-wrap iframe{width:100%; height:220px; border-radius:10px; border:0; box-shadow:0 8px 24px rgba(0,0,0,0.45)}

        /* Blog */
        .blog-list{display:flex; flex-direction:column; gap:12px}
        .blog-item{padding:10px;border-radius:10px;background:rgba(255,255,255,0.01)}
        .blog-item h4{margin:0;color:#eaf1ff}

        /* Cursos grid */
        .courses-grid{display:grid; grid-template-columns:repeat(auto-fit,minmax(220px,1fr)); gap:16px}
        .course{
            border-radius:12px; overflow:hidden; background:linear-gradient(180deg,#061021,#081427);
            border:1px solid rgba(255,255,255,0.03); transition:transform .2s;
        }
        .course:hover{transform:translateY(-6px)}
        .course img{width:100%; height:140px; object-fit:cover; display:block}
        .course .body{padding:12px}
        .course h4{margin:0 0 6px; color:#eef1ff; font-size:15px}
        .course p{margin:0; color:var(--muted); font-size:13px}

        /* Form sugerencias */
        .form-row{display:flex; gap:12px; flex-direction:column}
        input[type=text], textarea {width:100%; padding:10px; border-radius:8px; background:transparent; border:1px solid rgba(255,255,255,0.06); color:#eaf1ff}
        textarea{min-height:110px;}

        /* Footer */
        footer.site-footer{margin-top:40px; text-align:center; color:var(--muted); padding:40px 0}

        /* Responsive */
        @media (max-width:980px){
            .hero{grid-template-columns:1fr}
            .grid-2{grid-template-columns:1fr}
        }
    </style>

    <script>
        // Buscador interno global (filtra noticias, prompts, blogs y cursos por texto)
        function busquedaGlobal() {
            const q = document.getElementById('q').value.trim().toLowerCase();
            // noticias
            document.querySelectorAll('.news-item').forEach(node=>{
                const text = node.innerText.toLowerCase();
                node.style.display = text.includes(q) ? 'flex' : 'none';
            });
            // prompts
            document.querySelectorAll('.prompt').forEach(node=>{
                node.style.display = node.innerText.toLowerCase().includes(q) ? 'flex' : 'none';
            });
            // blogs
            document.querySelectorAll('.blog-item').forEach(node=>{
                node.style.display = node.innerText.toLowerCase().includes(q) ? 'block' : 'none';
            });
            // cursos
            document.querySelectorAll('.course').forEach(node=>{
                node.style.display = node.getAttribute('data-titulo').toLowerCase().includes(q) ? 'block' : 'none';
            });
        }
    </script>
</head>
<body>

    <!-- HEADER -->
    <header class="site-header">
        <div class="brand">
            <img src="<%= request.getContextPath() %>/img/header.jpg" alt="header">
            <div>
                <p class="usuario">Hola, <strong><%= session.getAttribute("nombre") %></strong></p>
                <h1>Portal Web: Aprendizaje, Uso Responsable y Seguridad en la IA Generativa</h1>
                <p class="muted">Campus Martinez • Recursos, cursos y guías para un uso responsable de la IA</p>
            </div>
        </div>

        <div class="header-actions">
            <input id="q" oninput="busquedaGlobal()" placeholder="Buscar en portal (noticias, cursos, tips)..." style="padding:10px; border-radius:12px; border:1px solid rgba(255,255,255,0.04); background:transparent; color:#eaf1ff; min-width:280px">
        </div>
    </header>

    <main class="container">

        <!-- HERO / NOTICIAS -->
        <div class="hero">
            <div class="hero-card">
                <div style="display:flex; justify-content:space-between; align-items:center;">
                    <div>
                        <div class="hero-title">Noticias destacadas de la semana</div>
                        <div class="hero-sub">Últimas actualizaciones y avances en IA</div>
                    </div>
                    <div style="text-align:right">
                        <div class="muted">Actualizado: <strong><%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></strong></div>
                    </div>
                </div>

                <div style="margin-top:18px" class="news-list">
                    <div class="news-item">
                        <div class="news-date">08 Dec 2025</div>
                        <div class="news-content">
                            <h4><a target="_blank" href="https://www.gerencia.cl/inteligencia-artificial/ia-generativa-negocios-apuesta-konecta/">Konecta redefine e impulsa los negocios</a></h4>
                            <p>La implementación de la GenAI en los flujos de trabajo de las empresas requiere en la actualidad una visión estratégica y con propósito.. Fuente: Gerencia.</p>
                        </div>
                    </div>

                    <div class="news-item">
                        <div class="news-date">06 Dec 2025</div>
                        <div class="news-content">
                            <h4><a target="_blank" href="https://www.theverge.com/2025/12/06/openai-new-update">Lanzamiento de actualización en principales modelos de IA</a></h4>
                            <p>Actualizaciones de seguridad y nuevas políticas de uso lanzadas por incubadoras de IA.</p>
                        </div>
                    </div>

                    <div class="news-item">
                        <div class="news-date">03 Dec 2025</div>
                        <div class="news-content">
                            <h4><a target="_blank" href="https://www.bbc.com/news/technology">Gobiernos discuten nuevas normativas sobre copyright y modelos generativos</a></h4>
                            <p>Discusión internacional para regular uso de datos en entrenamiento de modelos.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="section-title"><h3>Actualizaciones rápidas</h3></div>
                <p class="muted">Resumen de cambios y parches de seguridad aplicables a herramientas educativas de IA.</p>
                <ul style="margin-top:14px; color:var(--muted)">
                    <li>Parche de seguridad para API de visión (CV) — versión 2.1.4</li>
                    <li>Nuevo plugin de evaluación ética para instructores</li>
                    <li>Plantillas de prompts certificadas por el campus (v1)</li>
                </ul>
            </div>
        </div>

        <!-- GRID: Centro aprendizaje + Blog/Seguridad -->
        <div class="grid-2" style="margin-top:22px">
            <!-- Izquierda: Centro de aprendizaje -->
            <div class="card">
                <div class="section-title"><h3>Centro de Aprendizaje</h3></div>

                <h4 style="margin-top:6px">Tips y Prompts</h4>
                <div class="prompts">
                    <div class="prompt" title="Analiza y contrasta">
                        <div><strong>Prompt 1 — Análisis crítico</strong><div class="tag muted">Usar para: ensayo / debate</div></div>
                        <div class="tag">“Analiza [TEMA] desde tres perspectivas (técnica, ética y social). Concluye con 5 recomendaciones prácticas y cita fuentes académicas.”</div>
                    </div>

                    <div class="prompt">
                        <div><strong>Prompt 2 — Explicación en dos niveles</strong><div class="tag muted">Usar para: enseñanza</div></div>
                        <div class="tag">“Explícame [CONCEPTO] primero en un lenguaje simple (para principiantes), y luego en un lenguaje técnico (para expertos), con ejemplos.”</div>
                    </div>

                    <div class="prompt">
                        <div><strong>Prompt 3 — Creación de imágenes estilo social</strong><div class="tag muted">Usar para: contenido visual</div></div>
                        <div class="tag">“Genera una descripción para una imagen estilo Instagram con estética [ESTILO] y modelo similar a [CELEBRIDAD], manteniendo respeto de derechos de imagen. Incluir paleta de colores y composición.”</div>
                    </div>

                    <div class="prompt">
                        <div><strong>Prompt 4 — Guía de aprendizaje</strong><div class="tag muted">Usar para: plan de estudio</div></div>
                        <div class="tag">“Diseña un plan de estudio de 4 semanas para aprender [HABILIDAD], con recursos gratuitos, actividades prácticas y criterios de evaluación.”</div>
                    </div>

                    <div class="prompt">
                        <div><strong>Prompt 5 — Búsqueda de fuentes</strong><div class="tag muted">Usar para: investigación</div></div>
                        <div class="tag">“Provee 8 fuentes académicas recientes sobre [TEMA], con URL y un resumen de 3 líneas para cada una.”</div>
                    </div>
                </div>

                <div style="margin-top:18px">
                    <div class="section-title"><h3>Videotutoriales</h3></div>
                    <div class="video-wrap" style="display:grid; gap:12px; grid-template-columns:1fr 1fr;">
                        <iframe src="https://www.youtube.com/embed/54Y1NpfHcPU"" frameborder="0" allowfullscreen></iframe>
                        <iframe src="https://www.youtube.com/embed/wgV-WL1s2mk" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>

            <!-- Derecha: Seguridad/Legal + Blog -->
            <div>
                <div class="card" style="margin-bottom:18px">
                    <div class="section-title"><h3>🛡️ Zona de Seguridad y Legalidad</h3></div>
                    <p class="muted">Artículos y guías breves para entender riesgos y derechos.</p>

                    <div style="margin-top:12px">
                        <h4>Riesgos y estafas</h4>
                        <ul class="muted">
                            <li>Cómo identificar ataques de phishing que usan IA</li>
                            <li>Riesgos de compartir datos personales en modelos online</li>
                            <li>Buenas prácticas para proteger cuentas y contraseñas</li>
                        </ul>

                        <h4 style="margin-top:10px">Leyes y derechos de autor (explicado fácil)</h4>
                        <ul class="muted">
                            <li>Las obras están protegidas aunque estén en la web.</li>
                            <li>Si usas una imagen de una celebridad, revisa licencias y derechos de imagen.</li>
                            <li>El uso de IA no elimina la obligación de citar fuentes y respetar contenido protegido.</li>
                        </ul>

                        <div style="margin-top:12px" class="footer-links">
                            <a href="https://www.gob.mx/inai" target="_blank">INAI – Protección de Datos</a>
                            <a href="https://www.copyright.gov/" target="_blank">Copyright Office</a>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="section-title"><h3>📰 Blog y Novedades</h3></div>
                    <div class="blog-list">
                        <div class="blog-item">
                            <h4>Herramientas emergentes para educadores (Nov 2025)</h4>
                            <p class="muted">Reseña de 3 herramientas que ayudan a crear actividades interactivas con IA.</p>
                        </div>
                        <div class="blog-item">
                            <h4>Nuevas plantillas de evaluación ética (Oct 2025)</h4>
                            <p class="muted">Propuesta de evaluación para proyectos que usan modelos generativos.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- CURSOS (traídos desde BD) -->
        <div style="margin-top:28px" class="card">
            <div class="section-title"><h3>📚 Cursos añadidos por el Administrador</h3></div>
            <div class="courses-grid">
                <%
                    try {
                        // Usamos la conexión que trae conexion.jsp; variable: conexion
                        PreparedStatement ps = conexion.prepareStatement("SELECT id_curso, titulo, descripcion, imagen FROM cursos ORDER BY fecha_creacion DESC");
                        ResultSet rs = ps.executeQuery();
                        boolean any=false;
                        while (rs.next()) {
                            any=true;
                            int id = rs.getInt("id_curso");
                            String titulo = rs.getString("titulo");
                            String descripcion = rs.getString("descripcion");
                            String imagen = rs.getString("imagen"); // solo nombre como 'fundamentosIA.jpg'
                %>
                        <div class="course" data-id="<%=id%>" data-titulo="<%= titulo %>">
                            <img src="<%= request.getContextPath() %>/img/<%= imagen %>" alt="<%= titulo %>">
                            <div class="body">
                                <h4><%= titulo %></h4>
                                <p><%= (descripcion.length() > 140 ? descripcion.substring(0,137) + "..." : descripcion) %></p>
                            </div>
                        </div>
                <%
                        }
                        if (!any) {
                %>
                    <div class="muted">No hay cursos registrados aún.</div>
                <%
                        }
                        rs.close();
                    } catch (Exception e) {
                        out.println("<div class='muted'>Error cargando cursos: " + e.getMessage() + "</div>");
                    }
                %>
            </div>
        </div>

        <!-- FORM SUGERENCIAS -->
        <div style="margin-top:22px" class="card">
            <div class="section-title"><h3>💬 Sugerencias de temas</h3></div>
            <form action="guardarSugerencia.jsp" method="post">
                <div class="form-row">
                    <input type="text" name="nombre" placeholder="Tu nombre (opcional)">
                    <input type="text" name="email" placeholder="Tu correo (opcional)">
                    <input type="text" name="tema" placeholder="Tema sugerido" required>
                    <textarea name="detalle" placeholder="Describe brevemente por qué te interesa este tema"></textarea>
                    <button class="btn" type="submit">Enviar sugerencia</button>
                </div>
            </form>
        </div>

    </main>

    <footer class="site-footer">
        <div style="max-width:1200px;margin:0 auto">
            <small>Campus Martinez • Portal de IA Generativa • Uso responsable y actualización continua</small>
            <div style="margin-top:12px" class="muted">Enlaces: <a href="https://www.gob.mx/inai" target="_blank">INAI</a> • <a href="https://www.copyright.gov/" target="_blank">US Copyright</a></div>
        </div>
    </footer>

</body>
</html>

