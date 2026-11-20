# make serve           -> preview at http://localhost:1313
# make build           -> site into public/
# make update-prompts  -> pull the latest prompts from the library repo (then commit)
# make clean           -> remove generated files
HUGO ?= hugo

.PHONY: build serve update-prompts clean

build:
	$(HUGO) --minify

serve:
	$(HUGO) server

update-prompts:
	git submodule update --init --remote library
	@echo "Library updated. Review with 'git diff --submodule', then commit to publish."

clean:
	rm -rf public resources .hugo_build.lock
