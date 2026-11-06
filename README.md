# GitHub Pages Template

Reusable Jekyll documentation website built with Minimal Mistakes. This repository is designed to be used as a **GitHub repository template**, with all documentation-site sources isolated in `docs/` and the repository root available for the actual application.

## Structure

```text
.
├── .github/workflows/pages.yml  # build/deploy docs site
├── docs/
│   ├── _config.yml
│   ├── _data/navigation.yml
│   ├── _includes/
│   ├── assets/
│   ├── Gemfile
│   ├── Gemfile.lock
│   ├── index.md
│   ├── installation.md
│   └── configuration.md
├── .gitignore
├── README.md
├── VERSION
├── update-cli.yaml
└── justfile
```

Keep your project's application files and directories at the root (e.g. `src/`, `tests/`, `package.json`). The documentation site lives exclusively under `docs/`.

## Create a repository from this template

1. Enable **Template repository** in this repository's GitHub **Settings → General**, if it is not already enabled.
2. Click **Use this template → Create a new repository**.
3. Update `docs/_config.yml` with the new site's `title`, `url`, `baseurl`, `project` and `author` values.
4. Edit `docs/_data/navigation.yml` and the Markdown pages in `docs/`.
5. In the new repository's **Settings → Pages**, set **Source: GitHub Actions**.

For a project named `OWNER/PROJECT`, normally use `url: "https://OWNER.github.io"` and `baseurl: "/PROJECT"`. The `docs/` path does **not** appear in `baseurl`.

## Local documentation development

Requires Ruby, Bundler and just.

```sh
just bootstrap
just setup
just test
just build
just run
```

Alternatively: `cd docs && bundle exec jekyll serve`.

The generated site is under `docs/_site/` (ignored by Git). GitHub Actions uses `docs/Gemfile.lock` and publishes the build artifact from `docs/_site/`, not via GitHub's legacy branch-based Jekyll builder.

Published template demo: https://r14r.github.io/github-pages-template/

## Root tooling

`justfile` is a root-level entry point for documentation commands. `update-cli.yaml` provides Update CLI tasks and `VERSION` is the current template version. Replace or extend these files when customizing the generated project.
