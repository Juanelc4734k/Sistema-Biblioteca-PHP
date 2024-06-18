SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS bibliotecauni;

USE bibliotecauni;

DROP TABLE IF EXISTS administrador_biblioteca;

CREATE TABLE `administrador_biblioteca` (
  `id_bibliotecario` int NOT NULL AUTO_INCREMENT,
  `user` varchar(40) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `id_extreme` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bibliotecario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO administrador_biblioteca VALUES("8","admin","d033e22ae348aeb5660fc2140aec35850c4da997","");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `id_subcategoria` int DEFAULT NULL,
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
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `remitente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO comentarios VALUES("6","juan andres","jtoroblandon@gmail.com","Prueba","Hola","2022-07-03");
INSERT INTO comentarios VALUES("7","Juan","juanelc4734k@gmail.com","holaaaaaaaaa","como eta","2023-07-19");



DROP TABLE IF EXISTS libros;

CREATE TABLE `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `disponible` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `id_subcategoria` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

INSERT INTO libros VALUES("40","images/product1.jpg","Java 8","TECNICO EN PROGRAMACION DE SOFTWARE","si","1","5","1","2023-08-07");
INSERT INTO libros VALUES("41","images/mysql.jpg","Mysql Version ","TECNICO EN PROGRAMACION DE SOFTWARE","si","11","7","1","2023-08-07");
INSERT INTO libros VALUES("42","images/product2.jpg","HTML5 y CSS3","Para crear aplicaciones dinamicas","no","2","7","2","2023-08-07");
INSERT INTO libros VALUES("44","images/product3.jpg","PHP y MySQL","TECNICO EN PROGRAMACION DE SOFTWARE","no","9","4","1","2023-08-08");
INSERT INTO libros VALUES("45","images/product4.jpg","Jquery","Para crear aplicaciones dinamicas","si","1","8","1","2023-08-09");
INSERT INTO libros VALUES("46","images/product5.jpg","ASP.NET","Nose","si","13","5","1","2023-08-09");



DROP TABLE IF EXISTS pdf;

CREATE TABLE `pdf` (
  `id_pdf` int NOT NULL AUTO_INCREMENT,
  `id_libro` int NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext,
  `tamanio` int unsigned DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pdf`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `pdf_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS prestamo_libro;

CREATE TABLE `prestamo_libro` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `id_libro` int NOT NULL,
  `idvisitante` int NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `id_libro` (`id_libro`),
  KEY `idvisitante` (`idvisitante`),
  CONSTRAINT `prestamo_libro_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `prestamo_libro_ibfk_2` FOREIGN KEY (`idvisitante`) REFERENCES `visitantes` (`idvisitante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS proveedor;

CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO proveedor VALUES("1","Libreria Local 1","Medellin","400000","jtoroblandon@gmail.com");
INSERT INTO proveedor VALUES("2","Libreria Local","Medellin","30000","jtoroblandon@gmail.com");



DROP TABLE IF EXISTS rol;

CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO rol VALUES("1","admin");
INSERT INTO rol VALUES("2","usuario");



DROP TABLE IF EXISTS subcategorias;

CREATE TABLE `subcategorias` (
  `id_subcategoria` int NOT NULL AUTO_INCREMENT,
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
  `id_suscriptor` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(30) DEFAULT NULL,
  `correo` varchar(30) NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `fecha_suscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_suscriptor`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO suscriptores VALUES("17","","jtoroblandon@gmail.com","","2023-09-30");



DROP TABLE IF EXISTS usuario_estudiante;

CREATE TABLE `usuario_estudiante` (
  `id_usuario_estudiante` int NOT NULL AUTO_INCREMENT,
  `carnet` varchar(15) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `anio` varchar(10) NOT NULL,
  `carrera` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(180) DEFAULT NULL,
  `pass` varchar(180) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;




DROP TABLE IF EXISTS visitantes;

CREATE TABLE `visitantes` (
  `idvisitante` int NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `usuario` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `direccion` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `alias` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `edad` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `sexo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `pais` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `estado` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`idvisitante`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `visitantes_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

INSERT INTO visitantes VALUES("12","Juan Andres Toro","Juan","2022","jtoroblandon@gmail.com","3182672892","cll 62 #109a 120","Juan","16","Masculino","Colombia","1","2023-08-07 11:53:51","2");
INSERT INTO visitantes VALUES("13","admin","admin","admin","admin@gmail.com","3182672892","cll62 #109a 120","admin","16","masculino","Colombia","1","2023-07-12 10:51:19","1");
INSERT INTO visitantes VALUES("14","Kebin Alejandro Manco","manco","manco","kebinmanco310@gmail.com","3182672892","cll62 #109a120","manco","16","Masculino","Colombia","1","2023-08-04 11:09:10","2");
INSERT INTO visitantes VALUES("16","Juan","Juan","juan2022","jtoroblandon@gmail.com","3182672892","cll 62 #109a 120","Juan","2023-09-30","Masculino","Colombia","1","2023-09-30 09:30:51","2");



DROP TABLE IF EXISTS visitas;

CREATE TABLE `visitas` (
  `utc` int NOT NULL,
  `fecha_visita` date NOT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(255) NOT NULL,
  `pagina` varchar(255) NOT NULL,
  PRIMARY KEY (`utc`),
  UNIQUE KEY `utc` (`utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO visitas VALUES("1689790781","2023-07-19","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.86","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1689790810","2023-07-19","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.86","/Proyectos/Proyecto%20final/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1689790856","2023-07-19","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.86","/Proyectos/Proyecto%20final/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1691110359","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691110371","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691110376","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691110381","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691165365","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691166468","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691166890","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691166896","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691166900","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691166905","2023-08-04","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 OPR/100.0.0.0","/proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691420277","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691420291","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691421646","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691421650","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691421652","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1691421656","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1691422022","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423026","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423028","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423106","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423154","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423162","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423167","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423221","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423222","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423227","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423593","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423636","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423870","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423872","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423895","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423899","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691423977","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691424028","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691424032","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691424268","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425619","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425628","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425631","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425786","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425790","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425792","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425817","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425818","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425830","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425832","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425838","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691425849","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426040","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426042","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426048","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426053","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426070","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426368","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426369","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426371","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426373","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1691426525","2023-08-07","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188","/Proyectos/Proyecto%20final/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1692055371","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1692056708","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1692056711","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1692056715","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1692056828","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1692056838","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1692056846","2023-08-14","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.203","/proyectos/Proyecto%20final/biblioteca2.0/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1695061702","2023-09-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0","/Proyectos/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1695061716","2023-09-18","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0","/Proyectos/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696083024","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696083043","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=1");
INSERT INTO visitas VALUES("1696083047","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=8");
INSERT INTO visitas VALUES("1696083050","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1696083056","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1696083064","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696083068","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1696083069","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=2");
INSERT INTO visitas VALUES("1696083070","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=8");
INSERT INTO visitas VALUES("1696083071","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/biblioteca/inicio.php?cat=1");
INSERT INTO visitas VALUES("1696084269","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084278","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084281","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084282","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php?cat=12");
INSERT INTO visitas VALUES("1696084286","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1696084292","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1696084295","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_bd.php");
INSERT INTO visitas VALUES("1696084298","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_web.php");
INSERT INTO visitas VALUES("1696084302","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1696084306","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1696084307","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1696084310","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1696084312","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1696084323","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1696084338","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1696084345","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/busqueda.php");
INSERT INTO visitas VALUES("1696084346","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/prestamos.php");
INSERT INTO visitas VALUES("1696084353","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_programacion.php");
INSERT INTO visitas VALUES("1696084356","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_web.php");
INSERT INTO visitas VALUES("1696084358","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/libros_informatica.php");
INSERT INTO visitas VALUES("1696084361","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/terminos.php");
INSERT INTO visitas VALUES("1696084364","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/politica.php");
INSERT INTO visitas VALUES("1696084367","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/contacto.php");
INSERT INTO visitas VALUES("1696084372","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/mision_vision.php");
INSERT INTO visitas VALUES("1696084388","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084522","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084637","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");
INSERT INTO visitas VALUES("1696084804","2023-09-30","::1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36","/Proyectos/Proyecto%20final/biblioteca2.1/biblioteca/inicio.php");



SET FOREIGN_KEY_CHECKS=1;