set shell := ["bash", "-eu", "-o", "pipefail", "-c"]
set dotenv-load := false

host := "127.0.0.1"
port := "4000"

default:
    @just --list

bootstrap:
    @command -v ruby >/dev/null || { echo 'Ruby required' >&2; exit 1; }
    @command -v bundle >/dev/null || { echo 'Bundler required: gem install bundler' >&2; exit 1; }
    @bundle check >/dev/null 2>&1 || bundle install

install: bootstrap

setup:
    @test -f _config.yml && test -f Gemfile && test -f VERSION

fmt-check:
    @ruby -e 'require "yaml"; %w[_config.yml _data/navigation.yml update-cli.yaml].each { |f| YAML.parse_file(f) }'
    @ruby -e 'abort "Invalid SemVer" unless File.read("VERSION").strip.match?(/\A\d+\.\d+\.\d+\z/)'

lint: bootstrap fmt-check
    bundle exec jekyll doctor

test: lint
    bundle exec jekyll build --strict_front_matter --destination _site

build: test
    @test -s _site/index.html
    @test -s _site/assets/css/main.css

ci: build
    @test -s _site/index.html

precommit: test

run: bootstrap
    bundle exec jekyll serve --host {{host}} --port {{port}} --livereload --destination _site

serve: run

clean:
    bundle exec jekyll clean

