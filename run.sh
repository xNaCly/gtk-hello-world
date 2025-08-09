if ! command -v watcher &> /dev/null; then
	go install github.com/xnacly/watcher@latest
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo $SCRIPT_DIR/build

if [ -d "$SCRIPT_DIR/build" ]; then
	echo "Running existing build..."
else
  echo "Building project..."
  cmake -B build -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
fi

killall gtk4-nix-cmake 2>/dev/null || true
ninja -C $SCRIPT_DIR/build
$SCRIPT_DIR/build/gtk4-nix-cmake &

watcher -c "ninja -C $SCRIPT_DIR/build; killall gtk4-nix-cmake; $SCRIPT_DIR/build/gtk4-nix-cmake &" -f cpp -d 100ms
