# dead-drop with Docker

Using the source code from: [https://github.com/hymnis/dead-drop-python](https://github.com/hymnis/dead-drop-python) (a fork of BillKeenan's [dead-drop-python](https://github.com/BillKeenan/dead-drop-python)

## Using Docker Compose

Creating a service with MongoDB and dead-drop web interface.

```
docker-compuse up
```

Taking it down.
```
docker-compose down
```

## Settings

Some setting can be changed using environment variables and should be set in `docker-compose.yml` in the environemnt section or by including an environment file.

### SALT

The salt to use in crypthographic operations.

### MONGO_HOST

The hostname to use when connecting to the Mongo database. When using Docker Compose it should be the same as the container for the database ('database' as default).

### MONGO_PORT

The port to use when connecting to the Mongo database.

### MONGO_TIMEOUT

The connection timeout used when connecting to the Mongo database.

## Building Docker image

To pull the latest source code and build the image a simple bash script is included. Simply supply the version for the build as the first argument.

```bash
./mkrelease <version>
```

