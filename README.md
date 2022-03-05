# 🧱 Bricks

[Mason][mason_link] brick templates to build no scoped projects.

## Getting started 🚀

### Install locally 🏠

To install one or more bricks locally, add them to your directory's `mason.yaml`:

```yaml
bricks:
  <BRICK_NAME>:
    git:
      url: https://github.com/amitkot/bricks
      path: bricks/<BRICK_NAME>
```

### Install globally 🗺

To install one or more bricks globally, use the following command:

```sh
$ mason i https://github.com/amitkot/bricks --path bricks/<BRICK_NAME>
```

*Note: Be sure to replace `<BRICK_NAME>` with one of the following bricks:*

## Available bricks 🧱

| Brick Name            | Description                                              |
| --------------------- | -------------------------------------------------------- |
| riverpod_skeleton     | Create an opinionated Flutter Skeleton app with Riverpod |


[mason_link]: https://github.com/felangel/mason
