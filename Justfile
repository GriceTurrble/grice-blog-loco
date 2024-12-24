mod precommit

# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

bootstrap:
    cargo install loco
    cargo install sea-orm-cli

# Start local services
up:
    cargo loco start
