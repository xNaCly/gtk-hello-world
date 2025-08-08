cmake_minimum_required(VERSION 3.10)
project(gtk4-nix-cmake LANGUAGES CXX)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK4 REQUIRED gtk4)

add_executable(gtk4-nix-cmake main.cpp)

target_include_directories(gtk4-nix-cmake PRIVATE ${GTK4_INCLUDE_DIRS})
target_link_libraries(gtk4-nix-cmake PRIVATE ${GTK4_LIBRARIES})
target_compile_options(gtk4-nix-cmake PRIVATE ${GTK4_CFLAGS_OTHER})
