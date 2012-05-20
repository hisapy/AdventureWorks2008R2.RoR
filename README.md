AdventureWorks2008R2.RoR
==========================



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

A continuación se detalla el proceso llevado a cabo para generar el código inicial de la aplicación:

1.	Se creó la aplicación usando rails new AdventureWorks2008R2.RoR
2.	Se clónó (se bajó de Internet usando git, SmartGit en Windows y Github for Mac and OS X) el repositorio https://github.com/rails-sqlserver/tiny_tds y se ejecutaron los comandos como se indica en https://github.com/rails-sqlserver/tiny_tds#using-miniportile. Para ejecutar dichos hay que ir a la directorio del proyecto; cd tiny_tds
3. 	Se creó el proyecto con el comando *rails new AdventureWorks2008R2.RoR* . Lo del .(punto) antes de la palabra RoR tiene un efecto raro pero al parecer no afecta el funcionamiento.
4.  Se agregaron al Gemfile del proyecto AdventureWorks2008R2.RoR las dependencias en tiny_tds y activerecord-sql-server adapter (Ver el archivo Gemfile)
5.	Se ejecutó el comando bundle install y se para instalar dichas dependencias. Estoy hay que hacerlo en el directorio del proyecto; cd AdventureWorks2008R2.
6. 	Se configuró el archivo de configuración database.yml tal como se especifica en https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/wiki/Using-TinyTds (ver el archivo config/database.yml y adaptar la configuración según su entorno y su sistema)
7.	Se ejecutó [script/reverse_scaffold](https://github.com/hisapy/reverse_scaffold) para crear los modelos a partir de las tablas que están en la BD AdventureWorks2008R2. Por ejemplo *ruby script/reverse_scaffold HumanResources.Employee Employee --primary-key BusinessEntityID --verbose* crea el modelo, vista y controlador para la entidad HumanResources.Employee. Para que el modelo ActiveRecord funcione, es necesario agregar el nombre de la tabla, y especificar la clave primary (que en el caso de esta BD no es como la convención RoR o sea, :id) quedando el archivo models/employee.rb de la siguiente manera:

````ruby
class Employee < ActiveRecord::Base
  set_table_name "HumanResources.Employee"
  set_primary_key :BusinessEntityID
end
```

Problemas Conocidos y sus Soluciones (si es que ya hay)
--------------------------------------------------------
1. Problemas de Encoding y tipo de dato hierarchyid

	La tabla HumanResources.Employee contiene una columna llamada LoginID. Para poder mostrar correctamente los datos de esta columna en la vista employees.index.html.erb, sin causar errores de Encoding, fue necesario ejecutar el metodo *force_encoding* en los valores de dicha columna. También, para mostrar como texto los datos de la columna HumanResources.Employee.OrganizationNode, cuyo tipo de dato es [hierarchyid](http://msdn.microsoft.com/en-us/library/bb677213(v=sql.105).aspx), fue necesario usar el método inspect en los valores de dicha columna, o sino se mostraban simplemente caracteres raros en la página generada, por ejemplo:

````ruby
<td><%= employee.LoginID.force_encoding(Encoding::ASCII_8BIT) %></td>	
<td><%= employee.parseOrganizationNode %></td>
```

	La modificación correspondiente al modelo es 

````ruby
	class Employee < ActiveRecord::Base
	  set_table_name "HumanResources.Employee"
	  set_primary_key :BusinessEntityID

	  def parseOrganizationNode()
	    self.OrganizationNode.inspect
	  end
	end
````




