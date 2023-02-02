.PHONY: build
build:
	CCACHE_DIR=${PWD}/.cache/ccache CC="ccache clang" meson build && ninja -v -j8 -C build; ccache -d ${PWD}/.cache/ccache -s

.PHONY: clean
clean:
	rm -rf build

.PHONY: run
run: clean build
	./build/blurhash-server-bin

.PHONY: check
check:
	find ${PWD} -name *.c | xargs clang-check
