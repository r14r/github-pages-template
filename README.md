# GitHub Pages Template

Reusable Jekyll documentation template based on Minimal Mistakes.

Features include hierarchical left navigation, an active-page red border, a sticky right-hand table of contents with ScrollSpy, automatic heading highlighting, and a configurable footer.

## Repository and site

- Repository: https://github.com/r14r/github-pages-template
- Published site: https://r14r.github.io/github-pages-template/
- Local preview: http://127.0.0.1:4000/github-pages-template/

## Development

Ruby, Bundler, and just are required.

```sh
just bootstrap
just setup
just test
just build
just run
```

`just build` generates `_site/`. This directory is ignored by Git, and GitHub Actions publishes its contents as a Pages artifact. There is no need to commit generated HTML.

## GitHub Pages

Under **Settings → Pages**, choose **Source: GitHub Actions**. The workflow in `.github/workflows/pages.yml` builds the site with Bundler and deploys the generated `_site/` artifact. Do not select branch-based deployment from `docs/`.

## Reuse

Update `title`, `url`, `baseurl`, `project.name`, `project.url`, `author.name` in `_config.yml`, and adjust `_data/navigation.yml` and Markdown pages. A project repository at `https://github.com/OWNER/PROJECT` typically uses `baseurl: "/PROJECT"`.

## Update CLI

The root `update-cli.yaml` contains schemaVersion 2 task workflows. Validate against the installed Update CLI using `update-cli doctor` and `update-cli setup --list`.

The single version source is `VERSION`. The Gemfile.lock remains tracked to keep Bundler dependency resolution reproducible.
