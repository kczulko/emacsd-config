# emacsd-config

emacs.d config based on rabbitonweb emacs config. Now it is complementary with [my nixos setup](https://github.com/kczulko/nixos-config).

## Steps before

1. Install:
  - `silver-searcher`
  - `multimarkdown`
2. Create symbolic links:
```bash
$ mkdir -p ~/.emacs.d
$ ln -sf $EMACS_CFG_PROJECT_ROOT/init.el ~/.emacs.d/init.el
$ ln -sf $EMACS_CFG_PROJECT_ROOT/configs ~/.emacs.d/configs
$ ln -sf $EMACS_CFG_PROJECT_ROOT/my_snippets ~/.emacs.d/my_snippets/
```

or run `setup.sh` script.

See also [https://github.com/kczulko/scala-dev-env](https://github.com/kczulko/scala-dev-env)

## Collaborative editing

Check [this](https://code.librehq.com/qhong/crdt.el) out!
