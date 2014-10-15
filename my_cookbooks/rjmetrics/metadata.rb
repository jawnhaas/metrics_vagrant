name             'rjmetrics'
maintainer       'Jonathan haas'
maintainer_email 'jonathan.haas@gmail.com'
license          'All rights reserved'
description      'Installs/Configures rjmetrics example exercise, it creates a database and imports a SQL file (for testing purposes)'
version          '0.0.1'

#defining dependancies for this cookbook
depends "apache2"
depends "mysql"
depends "php"
depends "database"
