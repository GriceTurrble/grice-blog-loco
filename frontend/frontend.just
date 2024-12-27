# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

build:
    pnpm run build

dev:
    pnpm run dev
