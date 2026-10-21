# Unified Office Workspace — Public Documentation

Jekyll site source: [`docs/`](docs/).

Published URL: https://r14r.github.io/unified-office-workshop-public/

GitHub Pages configuration: **Deploy from a branch → main → /docs**. GitHub Pages builds the Jekyll site automatically. Do not add a `.nojekyll` file to `docs/`.

## Local development

Requirements: Ruby, RubyGems, and [just](https://github.com/casey/just). Run from the repository root:

```bash
just install    # install Bundler and the Jekyll dependencies
just build      # generate HTML into _site/
just serve      # preview at http://127.0.0.1:4000/unified-office-workshop-public/
```

Use `just doctor` to verify the local Ruby/Bundler environment and `just clean` to remove generated content. Bundler dependencies are installed locally into `docs/vendor/bundle`.

Private application repository: https://github.com/r14r/unified-office-workshop
