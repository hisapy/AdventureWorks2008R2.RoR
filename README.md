AdventureWorks2008R2.RoR

*I'll write an English version of this file ASAP*

Este proyecto es principalmente desarrollado en el marco de las clases de laboratorio de la materia Bases de Datos de la carrera Ingeniería Informática de la [Facultad de Ingeniería](http://fiuni.edu.py) de la [Universidad Nacional de Itapúa](http://www.uni.edu.py) y está basado en el proyecto [AdventureWorks.Ruby](https://github.com/rails-sqlserver/AdventureWorks.Ruby).

El principal objetivo de este proyecto es cumplir con el objetivo *Crear ABMs y otras pantallas para manipular los datos de una base de datos* del Plan de Estudios de la materia.

Este proyecto fue creado como un nuevo repositorio y desde cero, debido a diferencias en las versiones, de los componentes de la aplicación, tal como la base de datos utilizada en clases y la utilizada en el proyecto en el cual este está basado.

Además de utilizar [TinyTDS](https://github.com/rails-sqlserver/tiny_tds/blob/master/README.md) para la conexión a SQL Server, en el Gemfile se requirá [ruby-odbc](http://rubygems.org/gems/ruby-odbc), para conectarse usando ODBC. Se puede cambiar la forma de conectarse a la BD en el archivo de configuración database.yml. 
Los artículos a continuación explican y hablan sobre las ventajas de usar TinyTDS en vez de ODBC para la conexión a servidores SQL Server.

[Modern SQL Server & Rails](http://www.engineyard.com/blog/2011/modern-sql-server-rails/)
[SQL Server 10xs Faster with Rails 3.1](http://www.engineyard.com/blog/2011/sql-server-10xs-faster-with-rails-3-1/)

Para usar [TinyTDS](https://github.com/rails-sqlserver/tiny_tds/blob/master/README.md) deberán instalar [FreeTDS](http://www.freetds.org), atendiendo que la versión sea la requerida.

  
Los modelos se crearán usando el script reverse_scaffold, el cual estará disponible en el directorio *script* de la aplicación, en otras palabras, se usarán las tablas de la BD para crear los modelos inicialmente.





