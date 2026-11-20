# Hello World Prompt Library — website

The Hugo site for the [helloworld-prompts](https://github.com/OWNER/helloworld-prompts) library.
This repo holds only the presentation: templates, styles and the install page. The prompts and
tag explanations come from the library repo, which is included here as a git submodule in `library/`.

```
library/                  ← git submodule: the helloworld-prompts repo (prompts/, tags/)
layouts/                  ← page templates (no theme needed)
content/install.md        ← the "Install as a skill" page (rendered by layouts/_default/install.html)
hugo.toml                 ← mounts library/prompts and library/tags into the site; sets the library repo URL
Makefile                  ← make serve / build / update-prompts
.upsun/config.yaml        ← Upsun deploy config
```

## Clone

The `--recurse-submodules` flag matters. Without it, `library/` is empty and the site has no prompts.

```bash
git clone --recurse-submodules https://github.com/OWNER/helloworld-prompts-site.git
```

If you already cloned without it: `git submodule update --init`.

## Run locally

Requires [Hugo](https://gohugo.io/installation/) (v0.120 or newer).

```bash
make serve    # preview at http://localhost:1313
make build    # site into public/
```

## Publish new prompts

The site is pinned to a specific commit of the library, so new prompts don't appear until you
choose to update:

```bash
make update-prompts            # pull the latest library commit into library/
git add library && git commit -m "Update prompts"
git push                       # Upsun rebuilds the site
```

## Where the skill download comes from

The install page links to `helloworld-prompts.zip` on the library's latest GitHub Release, which
the library builds automatically when it's tagged. This repo never builds the skill. The link
is set by `libraryRepo` in `hugo.toml`.

## Deploy on Upsun

`.upsun/config.yaml` downloads Hugo and runs `make build`. Upsun checks out git submodules during
the build. If the library repo is private, give Upsun access to it (for example with a deploy key).
