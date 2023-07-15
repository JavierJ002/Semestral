<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="Estilos/Inicio_Sesion.css" />
  <title>Registro</title>
</head>
<body>
  <header>
    <div id="banner">
      <img id="logo" src="Imagenes/LogoSemestral.png" alt="Logo SoloCiencia.com" height="225px" width="300px" />
    </div>
    <div class="Titulo">
      <h1>Bienvenido a SoloCiencia</h1>
    </div>
  </header>

  <section id="principal">
    <div class="cuerpo">
     <% /*obtencion de los valores para colocarlos en la tabla luego*/
      	String Usuario = request.getParameter("user");
    	String Nombre = request.getParameter("name");
    	String Apellido = request.getParameter("surname");
    	String Edad = request.getParameter("age");
    	String Contraseña = request.getParameter("password");
    	%>
      <div class="formulario">
        <h2>Informacion Registrada</h2>
		Informacion Registrada:<br><br>
	    Usuario: <%= request.getParameter("user") %><br><br>
		Nombre: <%= request.getParameter("name") %><br><br>
		Apellido: <%= request.getParameter("surname") %><br><br>
		Edad: <%= request.getParameter("age") %><br><br>
		Contraseña: <%= request.getParameter("password") %>
		
		<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
			Statement dbstatement = dbconnect.createStatement();
			String insertarsql = "INSERT INTO users (Usuario, Nombre, Apellido, Edad, Contraseña) VALUES ('" +Usuario+ "','" +Nombre+ "','" +Apellido+ "','" +Edad+"','" +Contraseña+"')";
			dbstatement.executeUpdate(insertarsql);
			%>
			<a href="Inicio_Sesion.html" class="botonIniciarSesion">Ir a Iniciar Sesión</a>
		
      </div>
    </div>
  </section>

  <footer>
    <p class="footer-copyright">
        © 2023 Todos los derechos reservados - SoloCiencia.com
      </p>
  </footer>
</body>

</html>
