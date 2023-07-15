<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="Estilos/Inicio_Sesion.css" />
  <title>LogIn</title>
</head>
<body>
  <header>
    <div id="banner">
      <img
        id="logo"
        src="Imagenes/LogoSemestral.png"
        alt="Logo SoloCiencia.com"
        height="225px"
        width="300px"
      />
    </div>
    <div class="Titulo">
      <h1>Bienvenido a SoloCiencia</h1>
    </div>
    <div id="redesSociales">
      <a href="https://es-la.facebook.com/">
        <img
          class="logoRed"
          src="Imagenes/Facebook.png"
          alt="Logo Facebook"
          height="60px"
          width="60px"
        />
      </a>
      <a href="https://www.instagram.com/">
        <img
          class="logoRed"
          src="Imagenes/Instagram.jpg"
          alt="Logo Instagram"
          height="60px"
          width="60px"
        />
      </a>
      <a href="https://www.google.com/?hl=es">
        <img
          class="logoRed"
          src="Imagenes/Buscar.png"
          alt="Buscar Negocio"
          height="60px"
          width="60px"
        />
      </a>
    </div>
  </header>
  <section id="principal">
    <div class="cuerpo">
    <% /*Crear las variables para evaluar el usuario y contrasena*/
      	String Usuario = request.getParameter("user");
    	String Contraseña = request.getParameter("password");
    %>
      <form action="Inicio_Sesion.jsp" class="formulario">
        <h2>Iniciar sesión</h2>
        <div class="form-group">
          <label for="username">Nombre de usuario:</label>
          <input type="text" id="username" name="user" placeholder="Ingrese su nombre de usuario" required>
        </div>
        <div class="form-group">
          <label for="password">Contraseña:</label>
          <input type="password" id="password" name="password" placeholder="Ingrese su contraseña" required>
        </div>
        <input type="submit" value="Iniciar sesión"><br><br>
            <%
            	try{
	            	//Driver para la conexion a la DB
					Class.forName("com.mysql.cj.jdbc.Driver");
	   			 		//Declaramos la conexion a la DB
					Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
			    	PreparedStatement consultaP = dbconnect.prepareStatement("Select * From users WHERE Usuario=? AND Contraseña =?");
			    	consultaP.setString(1, Usuario);
			    	consultaP.setString(2, Contraseña);
			    	
			    	ResultSet resultado = consultaP.executeQuery();
			    	
			    	if(resultado.next())
			    		response.sendRedirect("Principal.html");
			    	else
			    		out.print("<span style='color: red;'>Error - Usuario/Contraseña Incorrecto</span>");
		    	}catch(Exception e)
            {
		    		out.println("--ERROR--<br>");
		    		out.println("--Consulta Onvalida-");
            }
				%>
        <div class="register-link">
          <p>¿No tienes una cuenta? <a href="Registro.html">Haz clic aquí para registrarte</a></p>
        </div>
        
      </form>
    </div>
  </section>
  <footer>
        <p class="footer-copyright">
          © 2023 Todos los derechos reservados - SoloCiencia.com
        </p>
  </footer>
</body>
</html>
