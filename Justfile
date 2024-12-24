mod precommit

# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

# bootstrap the dev environment
bootstrap:
    cargo install loco
    cargo install sea-orm-cli

# Start local services
[group("loco")]
up:
    cargo loco start

# Run doctor to check things
[group("loco")]
doctor:
    cargo loco doctor

# Migrate up
[group("loco")]
db-migrate:
    cargo loco db migrate

# Rollback migration
[group("loco")]
db-down:
    cargo loco db down

# Reset the DB
[group("loco")]
db-reset:
    cargo loco db reset
