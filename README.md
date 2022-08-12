# Antlers Formatting Action

A GitHub Action to automatically format/lint Antlers files.

## Usage

If you don't need to change anything (config-wise), add this step into your Actions workflow:

```yaml
- name: Antlers
  uses: duncanmcclean/antlers-action@0.0.8
```

> Note: this action **won't automatically commit changes** to your repository. You'll need to use another action, like [`git-auto-commit-action`](https://github.com/stefanzweifel/git-auto-commit-action) to handle this.

The `antlers-formatter` package which this action uses under the hood, allows for various different parameters. All of which are supported by this Action. You can see them all in use below (obviously not all of them will work at once, this is just as an example):

```yaml
- name: Antlers
  uses: duncanmcclean/antlers-action@0.0.8
  with:
    file: resources/views/layout.antlers.html
    directory: resources/views # this action defaults to resources/views
    output: formatted-views
    dump: true
    options: antlers-config.json
```

For more information on the available parameters, [review the documentation](https://www.npmjs.com/package/antlers-formatter#installation) of the `antlers-formatter` package.

### Example

Just wanna copy this action into your project? Here's the **full workflow** we use internally at [Steadfast Collective](https://steadfastcollective.com):

```yaml
name: Antlers Toolbox

on:
  pull_request:

jobs:
  antlers:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ github.head_ref }}
          fetch-depth: 2

      - name: Antlers
        uses: duncanmcclean/antlers-action@0.0.8

      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Antlers Code Style
          skip_fetch: true
```

## Big thanks!

Under the hood, this action uses the `antlers-format` package, part of the [Antlers Toolbox](https://antlers.dev) by John Koster.

The structure of thie action was copied from the [`laravel-pint-action`](https://github.com/aglipanci/laravel-pint-action).
