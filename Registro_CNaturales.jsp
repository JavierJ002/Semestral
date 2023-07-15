	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Estilos/Registros.css" />
    <title>CienciasN(R)</title>
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
        <h1>Registro Ciencias Naturales</h1>
      </div>
      <div id="redesSociales">
        <a href="https://es-la.facebook.com/">
          <img
            class="logoRed"
            src="Imagenes/Facebook.png"
            alt="Logo Faceboook"
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
    <nav>
      <h2 id="titulonav">Solo<span>Ciencia</span></h2>
      <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="Registro_CNaturales.html">Registro Ciencias Naturales</a></li>
        <li><a href="Registro_Quimica&Biologia.html">Registro Química y Biología</a></li>
        <li><a href="Registro_Prog.html">Registro Programación</a></li>
        <li><a href="#">Referencias</a></li>
        <li><a href="#">Contáctenos</a></li>
      </ul>
    </nav>
    <section id="principal">
        <div>
            <p>Registro Ciencias Naturales</p>
        </div>
      <div class="cuerpo">
      
      <% /*obtencion de los valores para colocarlos en la tabla luego*/
      	String Nombre = request.getParameter("user");
    	String Cedula = request.getParameter("ID");
    	String Fecha = request.getParameter("1");
    	%>
        	<div class="formulario">
	        	Informacion Registrada:<br><br>
	        	Nombre: <%= request.getParameter("user") %><br><br>
				Cedula: <%= request.getParameter("ID") %><br><br>
				Fecha de Inicio: <%= request.getParameter("1") %><br><br>
				
				<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection dbconnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
			Statement dbstatement = dbconnect.createStatement();
			String insertarsql = "INSERT INTO regs_cnaturales (Nombre, Cedula, Fecha_In) VALUES ('" +Nombre+ "','" +Cedula+ "','" +Fecha+"')";
			dbstatement.executeUpdate(insertarsql);
			out.print("<br>" + "Registro exitoso, Muchas Gracias!!");
			%>
			
				<div id="botonRegresar">
					<a href="Home.html" class="boton_feedback">Home</a>
				</div>
        	</div>
        </div>
    </section>
    <footer>
      <div class="footer-container">
        <div class="footer-row">
          <a href="Home.html" class="footer-button">Home</a>
          <a href="Registro_Profesor.html" class="footer-button"
            >Registro Ciencias Naturales</a
          >
          <a href="Registro_Estudiante.html" class="footer-button"
            >Registro Química y Biología</a
          >
        </div>
        <div class="footer-row">
          <a href="Calendario.html" class="footer-button"
            >Registro Programación</a
          >
          <a href="Soporte.html" class="footer-button">Referencias</a>
          <a href="Soporte.html" class="footer-button">Contáctenos</a>
        </div>
        <div class="footer-row">
          <p class="footer-copyright">
            © 2023 Todos los derechos reservados - Universidad del Pueblo
          </p>
        </div>
      </div>
    </footer>
  </body>
</html>
