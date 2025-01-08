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

build:
    @just frontend build
    cargo build

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

# The result should be `\\[ \\]`, but we need to escape those slashes again here to make it work:
GREP_TARGET := "\\\\[gone\\\\]"

# Prunes local branches deleted from remote.
[group("git")]
prune-dead-branches:
    @echo "{{ GREEN }}>> Removing dead branches...{{ NORMAL }}"
    @git fetch --prune
    @git branch -v | grep "{{ GREP_TARGET }}" | awk '{print $1}' | xargs -I{} git branch -D {}

alias prune := prune-dead-branches
