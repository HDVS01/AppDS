# AppDS
## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Node.js](https://nodejs.org/en/download/) (which comes with [npm](http://npmjs.com)) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/amitmerchant1990/electron-markdownify

# Go into the repository
$ cd electron-markdownify

# Install dependencies
$ npm install

# Run the app
$ npm start
```

> **Note**
> If you're using Linux Bash for Windows, [see this guide](https://www.howtogeek.com/261575/how-to-run-graphical-linux-desktop-applications-from-windows-10s-bash-shell/) or use `node` from the command prompt.

# Subir Base de datos.
Debes crear una cuenta en Render y crear una instancia de una base de datos en posgreSQL.
[guia de creacion de instancia de base de datos](https://medium.com/geekculture/how-to-create-and-connect-to-a-postgresql-database-with-render-and-pgadmin-577b326fd19d) 

Ahora que tines tu base de datos debes conectar esa instancia de posgreSQL a tu pgadmin para poder modificar tus datos

[Guia de conexion a pgadmin](https://community.render.com/t/connecting-to-pgadmin/2024) 

crea tu base de datos en pgadmin con el siguiente codigo:
```bash
-- Crear la tabla CATEGORIES
CREATE TABLE CATEGORIES (
    ID integer PRIMARY KEY,
    TITLE varchar(255),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla IMAGES
CREATE TABLE IMAGES (
    ID integer PRIMARY KEY,
    DESCRIPTION varchar(255),
    URL varchar(255),
    FORMAT varchar(255),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla OBJECTS
CREATE TABLE OBJECTS (
    ID integer PRIMARY KEY,
    NAME varchar(255),
    CATEGORIES_ID integer REFERENCES CATEGORIES(ID),
    IMAGES_ID integer REFERENCES IMAGES(ID),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla VIDEO_CLUES
CREATE TABLE VIDEO_CLUES (
    ID integer PRIMARY KEY,
    DURATION interval,
    DIFICULTY varchar(255),
    OBJECTS_ID integer REFERENCES OBJECTS(ID),
    URL varchar(255),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla ESCAPES
CREATE TABLE ESCAPES (
    ID integer PRIMARY KEY,
    TITLE varchar(255),
    DESCRIPTION varchar(255),
    CATEGORIES_ID integer REFERENCES CATEGORIES(ID),
    VISIBILITY varchar(255) CHECK (VISIBILITY IN ('PUBLIC', 'PRIVATE')),
    APPLEID_CREATOR varchar(255),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla SESSIONS
CREATE TABLE SESSIONS (
    ID integer PRIMARY KEY,
    ESCAPES_ID integer REFERENCES ESCAPES(ID),
    CODE integer,
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear la tabla ESCAPES_OBJECTS
CREATE TABLE ESCAPES_OBJECTS (
    ID integer PRIMARY KEY,
    ESCAPES_ID integer REFERENCES ESCAPES(ID),
    OBJECTS_ID integer REFERENCES OBJECTS(ID),
    VIDEO_CLUES_ID integer REFERENCES VIDEO_CLUES(ID),
    DATE_OF_CREATION date,
    ACTIVE varchar(8) CHECK (ACTIVE IN ('Active', 'Inactive'))
);

-- Crear secuencias para las tablas con un inicio de 1 e incremento de 1
CREATE SEQUENCE categories_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE images_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE objects_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE video_clues_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE escapes_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE sessions_id_seq START 1 INCREMENT 1;
CREATE SEQUENCE escapes_objects_id_seq START 1 INCREMENT 1;

-- Establecer los valores predeterminados de las columnas ID utilizando las secuencias
ALTER TABLE CATEGORIES ALTER COLUMN ID SET DEFAULT nextval('categories_id_seq');
ALTER TABLE IMAGES ALTER COLUMN ID SET DEFAULT nextval('images_id_seq');
ALTER TABLE OBJECTS ALTER COLUMN ID SET DEFAULT nextval('objects_id_seq');
ALTER TABLE VIDEO_CLUES ALTER COLUMN ID SET DEFAULT nextval('video_clues_id_seq');
ALTER TABLE ESCAPES ALTER COLUMN ID SET DEFAULT nextval('escapes_id_seq');
ALTER TABLE SESSIONS ALTER COLUMN ID SET DEFAULT nextval('sessions_id_seq');
ALTER TABLE ESCAPES_OBJECTS ALTER COLUMN ID SET DEFAULT nextval('escapes_objects_id_seq');
```


# Lanzar API
para este proyecto usamos Render como servicio.

En la raiz del proyecto, crear un archivo .env con lo siguiente:
```bash
PORT = 
DB_USER = 
DB_HOST =  
DB = 
DB_PASSWORD = 
```
llena cada uno de las variables con las variables que te proporciona tu servicio de base de datos
