# Run pre-commit checks
run HOOK="":
    pre-commit run {{HOOK}} --all-files

# Setup pre-commit for use
setup:
    brew install pre-commit
    pre-commit install

# Print this help output
help:
    @echo "pre-commit helpers"
    @echo ""
    @just --list --unsorted --justfile {{source_file()}}

update:
    pre-commit autoupdate
