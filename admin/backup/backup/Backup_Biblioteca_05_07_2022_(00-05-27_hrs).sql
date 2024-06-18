SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS bibliotecauni;

USE bibliotecauni;

DROP TABLE IF EXISTS administrador_biblioteca;

CREATE TABLE `administrador_biblioteca` (
  `id_bibliotecario` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `id_extreme` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bibliotecario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO administrador_biblioteca VALUES("3","carlos","ab5e2bca84933118bbc9d48ffaccce3bac4eeb64","");
INSERT INTO administrador_biblioteca VALUES("4","elier","8af8cd209bfe5b981ac7ce0e4c8e55464aceb494","");
INSERT INTO administrador_biblioteca VALUES("5","javier","828c1a17681e8566a17a1a4801ea67306010b273","");
INSERT INTO administrador_biblioteca VALUES("6","eduardo","81f705dc2ce1a61a2621e0e4b442a9474e1d0c70","");
INSERT INTO administrador_biblioteca VALUES("7","admin","d033e22ae348aeb5660fc2140aec35850c4da997","");
INSERT INTO administrador_biblioteca VALUES("8","admin","d033e22ae348aeb5660fc2140aec35850c4da997","");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id_categoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `id_subcategoria` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_subcategoria` (`id_subcategoria`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO categorias VALUES("1","Programacion Avanzada II","3");
INSERT INTO categorias VALUES("2","Aplicaciones web","2");
INSERT INTO categorias VALUES("4","Estadisticas","2");
INSERT INTO categorias VALUES("8","Python 3","2");
INSERT INTO categorias VALUES("9","PHP avanzado","4");
INSERT INTO categorias VALUES("11","Base de datos","2");
INSERT INTO categorias VALUES("12","Ingenieria de Sistemas","3");
INSERT INTO categorias VALUES("13","Informatica","2");
INSERT INTO categorias VALUES("14","Hacking","0");



DROP TABLE IF EXISTS comentarios;

CREATE TABLE `comentarios` (
  `id_comentario` int(10) NOT NULL AUTO_INCREMENT,
  `remitente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO comentarios VALUES("5","juan andres","jtoroblandon@gmail.com","Hello","hola","2022-07-03");
INSERT INTO comentarios VALUES("6","juan andres","jtoroblandon@gmail.com","Prueba","Hola","2022-07-03");



DROP TABLE IF EXISTS libros;

CREATE TABLE `libros` (
  `id_libro` int(10) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `disponible` varchar(2) CHARACTER SET latin1 NOT NULL,
  `id_categoria` int(10) NOT NULL,
  `id_subcategoria` int(10) NOT NULL,
  `id_proveedor` int(10) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `url_descarga` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

INSERT INTO libros VALUES("3","images/mysql.jpg","Mysql Version Avanzada","Para crear aplicaciones dinamicas","no","2","2","2","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("4","images/product2.jpg","HTML5 2da Edicion","Para crear aplicaciones dinamicas","no","2","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("5","images/product1.jpg","Java 8","Libro de Programacion","si","1","1","1","2016-01-06","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("6","images/product5.jpg","ASP.NET 2019","Crea aplicaciones dinamicas","no","2","1","1","2016-01-07","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("8","images/product6.jpg","Ajax","lenguaje de programacion","no","2","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("9","images/product4.jpg","JQuery 2da Edicion","Sincronizacion con la base de datos","no","2","1","2","2016-01-14","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("10","images/php.jpg","PHP","Para crear aplicaciones dinamicas","no","2","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("11","images/pyton.jpg","Python","Para crear aplicaciones dinamicas","no","1","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("12","images/visualbasic.jpg","Visual Basic","Libro de Programacion","no","1","1","1","2016-01-06","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("13","images/java7.jpg","Java 7","Crea aplicaciones dinamicas","no","1","1","1","2016-01-07","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("16","images/javascript.jpg","JavaScript para principiantes","Excelente libro para aprender Javascript","si","2","8","2","2016-02-05","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("17","images/csharp.jpg","C# Avanzado","para programacion","si","1","2","2","2016-02-05","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("18","images/db1.jpg","Postgre Sql","Para almacenar datos","si","11","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("19","images/db2.jpg","SYBAse","Para almacenar datos","si","11","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("20","images/db3.jpg","dBASE III","Para almacenar datos","si","11","1","1","2016-01-06","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("21","images/db4.jpg","IBM Informix","Para almacenar datos","no","11","1","1","2016-01-07","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("22","images/db5.jpg","SQL Server 2012","Para almacenar datos","si","11","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("23","images/db6.jpg","Oracle 11g","Para almacenar datos","si","11","1","2","2016-01-14","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("24","images/sistemas1.jpg","Libro de Sistemas","Para aprender mas","si","12","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("25","images/sistemas2.jpg","Libro de Sistemas","Para aprender mas","no","12","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("26","images/sistemas3.jpg","Libro de Sistemas","Para aprender mas","si","12","1","1","2016-01-06","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("27","images/sistemas4.jpg","Libro de Sistemas","Para aprender mas","no","12","1","1","2016-01-07","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("28","images/sistemas5.jpg","Libro de Sistemas","Para aprender mas","si","12","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("29","images/sistemas6.jpg","Libro de Sistemas","Para aprender mas","si","12","1","2","2016-01-14","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("30","images/informatica1.jpg","Libro de informatica","Para aprender mas","si","13","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("31","images/informatica2.jpg","Libro de informatica","Para aprender mas","no","13","1","1","2016-01-07","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("32","images/informatica3.jpg","Libro de informatica","Para aprender mas","si","13","1","1","2016-01-06","http://mega.co.nz/sldldldlffkf");
INSERT INTO libros VALUES("33","images/informatica4.jpg","Libro de informatica avanzaa","Para aprender mas rapido","si","12","2","2","2016-01-12","http://mega.co.nz/sldldldlffkfd");
INSERT INTO libros VALUES("35","images/informatica6.jpg","Libro de informatica","Para aprender mas","si","13","1","2","2016-01-14","http://mediafire.com/id=203044");
INSERT INTO libros VALUES("37","images/mysql.jpg","Libro de SQL Server 23456","Es de buena calidad","si","1","1","1","2018-09-28","www.googledrive.com");



DROP TABLE IF EXISTS pdf;

CREATE TABLE `pdf` (
  `id_pdf` int(10) NOT NULL AUTO_INCREMENT,
  `id_libro` int(10) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext DEFAULT NULL,
  `tamanio` int(10) unsigned DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pdf`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `pdf_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

INSERT INTO pdf VALUES("1","5","javascript","Buen Libro","13311","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("2","3","Mysql Avanzado","Para conectar base de datos","970475","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("3","4","HTML 5","Para aplicaciones web","635134","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("4","5","Java Enterprise Edition","Para aplicaciones moviles y de escritorio","294261","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("5","9","Jquery","Sincronizacion con el servidor","405398","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("6","10","php","Buen Libro","13311","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("7","11","pyton","Para conectar base de datos","970475","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("8","12","Visual Basic","Para aplicaciones web","635134","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("9","6","Asp. Net","Para aplicaciones moviles y de escritorio","294261","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("10","17","C#","Sincronizacion con el servidor","405398","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("11","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("12","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("13","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("14","3","mysql","dkdkff","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("15","4","HTML 5","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("16","17","C# Avanzado","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("17","30","informatica2","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("18","31","dkfk","dkkf","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("19","28","prueba","bueno","171766","application/pdf","libro.pdf");
INSERT INTO pdf VALUES("20","8","Libro pdf de ajax","es bueno","403835","application/pdf","art08.pdf");
INSERT INTO pdf VALUES("21","9","Libro de Ejemplo para Angel","Es de buena calidad","915929","application/pdf","slidex.tips_catalogo-de-celulares.pdf");
INSERT INTO pdf VALUES("22","6","Prueba de libro con nivel avanzado","Es una prueba de nivel avanzado 12 de Noviembre","98304","application/pdf","tabla_caracteres-ASCII.pdf");



DROP TABLE IF EXISTS prestamo_libro;

CREATE TABLE `prestamo_libro` (
  `id_prestamo` int(100) NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `id_libro` int(10) NOT NULL,
  `id_usuario_estudiante` int(10) NOT NULL,
  `estado` int(10) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_libro` (`id_libro`),
  KEY `id_usuario_estudiante` (`id_usuario_estudiante`),
  CONSTRAINT `prestamo_libro_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `prestamo_libro_ibfk_2` FOREIGN KEY (`id_usuario_estudiante`) REFERENCES `usuario_estudiante` (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO prestamo_libro VALUES("1","2016-02-07","2016-02-23","3","1","1");
INSERT INTO prestamo_libro VALUES("2","2016-02-07","2016-02-10","33","2","1");
INSERT INTO prestamo_libro VALUES("15","2016-02-07","2016-02-08","32","1","1");
INSERT INTO prestamo_libro VALUES("16","2016-02-07","2016-02-08","32","1","1");
INSERT INTO prestamo_libro VALUES("17","2018-10-05","2018-10-26","32","1","1");
INSERT INTO prestamo_libro VALUES("18","2018-10-12","2018-10-18","3","8","1");
INSERT INTO prestamo_libro VALUES("19","2018-11-08","2018-11-22","4","8","1");
INSERT INTO prestamo_libro VALUES("20","2018-11-08","2018-11-22","4","8","1");



DROP TABLE IF EXISTS proveedor;

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO proveedor VALUES("1","Libreria Local 1","Medellin","400000","jtoroblandon@gmail.com");
INSERT INTO proveedor VALUES("2","Libreria Local","Medellin","30000","jtoroblandon@gmail.com");



DROP TABLE IF EXISTS subcategorias;

CREATE TABLE `subcategorias` (
  `id_subcategoria` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_subcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO subcategorias VALUES("1","C");
INSERT INTO subcategorias VALUES("2","C#");
INSERT INTO subcategorias VALUES("3","C++");
INSERT INTO subcategorias VALUES("4","php");
INSERT INTO subcategorias VALUES("5","java");
INSERT INTO subcategorias VALUES("6","python");
INSERT INTO subcategorias VALUES("7","html");
INSERT INTO subcategorias VALUES("8","Javascript 3");



DROP TABLE IF EXISTS suscriptores;

CREATE TABLE `suscriptores` (
  `id_suscriptor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(30) DEFAULT NULL,
  `correo` varchar(30) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `fecha_suscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_suscriptor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS usuario_estudiante;

CREATE TABLE `usuario_estudiante` (
  `id_usuario_estudiante` int(10) NOT NULL AUTO_INCREMENT,
  `carnet` varchar(15) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `anio` varchar(10) NOT NULL,
  `carrera` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO usuario_estudiante VALUES("1","2012-43355","Elier Javier","Rocha","elier.aries@gmail.com","2do.","Ingenieria de Sistemas");
INSERT INTO usuario_estudiante VALUES("2","2012-43356","Alex ","jarquin","alexjqr@gmail.com","5to.","Ingenieria Civil");
INSERT INTO usuario_estudiante VALUES("6","2012-4356","Juan Carlos","perez","juanperez@gmail.com","4to.","Ingenieria Agroindustrial");
INSERT INTO usuario_estudiante VALUES("7","2012-0394J","Carlos Jose","Gomez","elier.aries@gmail.com","5to.","Ingenieria de Sistemas");
INSERT INTO usuario_estudiante VALUES("8","2012-0394J","Jaime Jose","Roa","elier.aries@gmail.com","1ro.","Ingenieria de Sistemas");



DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(180) DEFAULT NULL,
  `password` varchar(180) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `id_extreme` varchar(180) DEFAULT NULL,
  `rol` varchar(15) NOT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO usuarios VALUES("10","elier","elier123","elier.aries@gmail.com","","admin","","");



DROP TABLE IF EXISTS visitantes;

CREATE TABLE `visitantes` (
  `idvisitante` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estadoPais` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `alias` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `edad` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `pais` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idvisitante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO visitantes VALUES("8","juan andres","Juanelc4734k","juan2022","jtoroblandon@gmail.com","3182672892","cll 62 # 109a 120","colombia","medellin","Juanelc4734k","15","Masculino","colombia","1","2022-07-03 12:28:21");



DROP TABLE IF EXISTS visitas;

CREATE TABLE `visitas` (
  `utc` int(10) NOT NULL,
  `fecha_visita` date NOT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `pagina` varchar(255) NOT NULL,
  PRIMARY KEY (`utc`),
  UNIQUE KEY `utc` (`utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO visitas VALUES("1656875148","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656875168","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1656875185","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656875323","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656875628","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1656875644","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656875655","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656876250","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656876257","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656876363","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656876382","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656877109","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656877126","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656877132","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1656879549","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656879879","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656879987","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656880036","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656880091","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656880120","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1656880369","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1656880385","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1656880406","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1656880478","2022-07-03","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.66 Safari/537.36","/biblioteca/busqueda.php");



SET FOREIGN_KEY_CHECKS=1;