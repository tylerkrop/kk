# README

## Dev

```shell
source .env
bin/dev
```

## Updates

Check all updates by running `bin/dev` afterwards.

### Update Gems

```shell
bin/bundle upgrade
```

### Update Ruby

```shell
mise i ruby@<new version>
```

- Update version in [.ruby-version](/.ruby-version)
- Update RUBY_VERSION in [Dockerfile](/Dockerfile)
