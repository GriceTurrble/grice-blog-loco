# Just tools to work on the project.
# https://just.systems/

mod frontend "frontend/frontend.just"
### START COMMON ###
import? 'common.just'

# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

# Pull latest common justfile recipes to local repo
[group("commons")]
sync-commons:
    curl -H 'Cache-Control: no-cache, no-store' \
        https://raw.githubusercontent.com/griceturrble/common-project-files/main/common.just > common.just
### END COMMON ###

# bootstrap the dev environment
[group("dev")]
bootstrap:
    just sync-commons
    just bootstrap-commons
    cargo install loco
    cargo install sea-orm-cli
    cargo install cargo-watch

# build the project
[group("dev")]
build:
    @just frontend build
    cargo build

[group("dev")]
test *args:
    cargo test {{ args }}

# Start local services
[group("loco")]
up:
    cargo watch --ignore "frontend" -x check -s 'cargo run start'

alias dev := up

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
