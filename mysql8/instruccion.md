```sh
docker compose -f "install-mysql.yml" up -d
```
para ver los logs en tiempo real quitar el -d 
Para eliminar todos los rastros del proyecto Docker, incluyendo los contenedores, volúmenes, e imágenes creados, usa el siguiente comando:
```sh 
docker compose -f "install-mysql.yml" down --rmi all --volumes
```


docker ps -a   # Verifica que no haya contenedores restantes
docker volume ls   # Verifica que no haya volúmenes restantes
docker images   # Verifica que no haya imágenes restantes

```sh
docker exec -it docker-miBaseDeDatos-1 mysql -uroot -p # para acceder a la consola
```


```yml
services:
  miBaseDeDatos:
    image: mysql:8.0.0
    restart: always
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: 1234
      MYSQL_DATABASE: db_dds  # Esta variable crea la base de datos db_dds automáticamente
    volumes:
      - db_data:/var/lib/mysql  # Persistencia de datos
      - ./init-db:/docker-entrypoint-initdb.d  # Directorio para scripts de inicialización
volumes:
  db_data:
```
