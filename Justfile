mod precommit

# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

# Start local services
up:
    cargo loco start
