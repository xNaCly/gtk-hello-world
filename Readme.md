# GTK-hello-world

> Minimal viable gtk application 

## Local setup

```shell
nix develop
cmake -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ninja -C build
./build/gtk4-nix-cmake
```
