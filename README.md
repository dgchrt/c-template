# C Project Template

A standard vanilla C project template designed to serve as a generic starting point for any C project.

## Project Structure

- `src/main.c` / `src/main.h`: Main application module. Coordinates logic and imports other modules.
- `src/hal.c` / `src/hal.h`: Hardware Abstraction Layer (HAL). Abstracts all interactions with the host system, OS, and low-level libraries.
- `Makefile`: Dynamic build configuration that automatically uses the folder name as the project/binary name.
- `.clang-format`: Formatting configuration that enforces clean and maintainable C style (e.g. preventing single-line function definitions).

## Scripts

- `./build.sh`: Compiles the project using `make` and outputs the binary inside `dist/` named after the parent folder.
- `./run.sh`: Runs the compiled executable from `dist/` passing any arguments.

## Makefile Commands

- `make`: Compile the project.
- `make clean`: Remove build and distribution directories.
- `make format`: Format source files in `src/` using `clang-format`.
- `make lint`: Analyze source files in `src/` for bugs and quality using `cppcheck`.
