# NixCppStarterTemplate

A minimal, clean, reproducible C++/C development environment powered by **Nix flakes**, **Clang**, **CMake**, and **clangd**.  
Designed for developers who want a stable toolchain without clutter or unnecessary dependencies.

This template gives you:

- A deterministic Clang-based build environment
- Fully configured `glibc` + `libc++` headers
- Automatic CMake setup
- `clangd` integration with a compilation database
- `.envrc` for seamless shell loading

## Features

### Reproducible Dev Environment

Completely isolated toolchain with the exact same versions across all machines.

### Clang-First Workflow

The devShell uses:

- `clang`
- `clang++`
- `clangd`
- `clang-format`
- `cmake`
- `pkg-config`
- `gdb`

Everything is configured to behave like a clean Linux C/C++ development stack.

## Getting Started

### 1. Enable direnv (optional but recommended)

```bash
direnv allow
```

### Build the project

```bash
cmake -B build
cmake --build build
```

### Run the executable

```bash
./build/output
```

### Development Environment

Inside the DevShell, the following environment variables are set:

`CC=clang`  
`CXX=clang++`  
`CPATH` includes glibc and libc++ headers.  
`LIBRARY_PATH` and `LD_LIBRARY_PATH` include glibc runtime libs.

This makes Clang behave as a fully functional C/C++ compiler with all dependencies visible.
