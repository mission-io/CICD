# RUST

## Rust install

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Nightly build

```shell
rustup install nightly
```


## Debug Rust in VS Code
1. Install VS Code Plugin `C/C++` for Windows / `CodeLLDB` for (OS X / Linux) for native code debugging.
2. Add `"debug.allowBreakpointsEverywhere": true` in `.vscode -> settings.json` file
3. 



### Reference
[How to debug Rust in Development](https://www.forrestthewoods.com/blog/how-to-debug-rust-with-visual-studio-code/)

## Other VSCode Toold for Rust
1. [Racer](https://github.com/racer-rust/racer) - code completion for Rust

## Build

Build the rust application and create the [Docker](/Dockerfile) image.

## Set nightly to work with latest version
