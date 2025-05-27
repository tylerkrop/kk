# README

## Dev

Create a `.env` file with the following:

```shell
# Docker PAT Token
export KAMAL_REGISTRY_PASSWORD="dckr_pat_xxx_xxxxxxxxxxxx-xxxxxxxxxx"
# Discord Client ID
export DISCORD_CLIENT_ID="000000000000000000"
# Discord Client Secret
export DISCORD_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

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
