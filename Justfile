mod precommit
mod frontend "frontend/frontend.just"

# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

# bootstrap the dev environment
bootstrap:
    cargo install loco
    cargo install sea-orm-cli
    cargo install cargo-watch

# Start local services
[group("loco")]
up:
    cargo watch --ignore "frontend" -x check -s 'cargo run start'

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
