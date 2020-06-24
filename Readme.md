# Terraform Dash Docs Generator

This projects essence has been taken from https://github.com/f440/terraform/tree/docset and updated to generate docs until terraform v0.9.11 and from v0.10.0 and up.

## Installation

```bash
rbenv install 2.5.3
gem install -N bundler rake sqlite3
bundle install
```

### Docker

```bash
docker build -t terraform-docs .
docker run --rm -v $(pwd):/docs/build terraform-docs <version>
```

### Terraform

```bash
./build.sh <version>
```
