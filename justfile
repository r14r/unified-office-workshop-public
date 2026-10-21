set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

default:
    @just --list

# Install Ruby dependencies for the Jekyll site in docs/
install:
    @command -v ruby >/dev/null || { echo "Ruby is required. Install Ruby >= 3.1 first."; exit 1; }
    @command -v gem >/dev/null || { echo "RubyGems is required."; exit 1; }
    @if ! command -v bundle >/dev/null; then gem install bundler; fi
    cd docs && bundle config set --local path vendor/bundle
    cd docs && bundle install

# Generate the local site at _site/
build:
    cd docs && bundle exec jekyll build --source . --destination ../_site

# Start a local preview, including the GitHub Pages base URL
serve:
    cd docs && bundle exec jekyll serve --source . --destination ../_site --host 127.0.0.1 --port 4000

clean:
    rm -rf _site docs/.jekyll-cache docs/.jekyll-metadata

doctor:
    ruby --version
    bundle --version
    cd docs && bundle check
