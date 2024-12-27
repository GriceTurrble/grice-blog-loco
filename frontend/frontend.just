# Show these help docs
help:
    @just --list --unsorted --justfile {{ source_file() }}

# Create production build of FE assets
build:
    pnpm run build

# Start dev server watching for file changes and generating dev builds
dev:
    pnpm run dev
