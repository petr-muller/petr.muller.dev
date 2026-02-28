# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
hugo server        # Serve locally at localhost:1313
hugo --minify      # Build to public/
```

Hugo version is pinned in `.env` (currently 0.155.3, extended variant with Dart Sass).

## Deployment

Deployment happens automatically via GitHub Actions (`.github/workflows/publish.yaml`) on every push. It builds with `hugo --minify` and deploys via rsync using SSH secrets (`DEPLOY_KEY`, `DEPLOY_HOST_IP`, `DEPLOY_USER`, `DEPLOY_PATH`).

The `Makefile` contains an older manual deploy path (SCP to `eldraine`) that is likely superseded by the CI/CD pipeline.

## Architecture

This is a minimal single-page Hugo personal site. The entire visible content lives in `content/_index.md`. All site configuration (links, images, author info, Google Analytics) is in `hugo.toml` under `[params]`.

The theme (`themes/hugo-split-theme`) is a git submodule pointing to a personal fork of a split-layout theme. The layout splits the page: left side shows a background image (`static/images/background.jpg`), right side shows bio and link lists.

Most sections (taxonomy, RSS, sitemap) are disabled — this is intentionally a single-page site with no blog or multi-page structure.

## Submodules

The `themes/hugo-split-theme` directory is a git submodule. After cloning, run `git submodule update --init` to populate it.
