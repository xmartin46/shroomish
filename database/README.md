# Shroomish: DB

## Requirements

1. docker-compose

## Usage

To run the server, please execute the following from the root directory:

1. Run Startup server as a docker container

    ```bash
    docker-compose up -d
    ```

2. Run init scripts

    ```bash
    docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U postgres postgres -f /tmp/create_database.sql
    docker run -it --rm --network shroomish shroomish-db psql -h shroomish-db -U shroomish shroomish -f /tmp/create_tables.sql
    ```
