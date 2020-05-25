# docker-godot-mono

Godot headless linux docker image to automatically build projects.

Inspired by [docker-godot](https://github.com/vayan/docker-godot).

## Example of usage

```
docker run --rm -v $(pwd):/project zerc/godot-mono-builder:latest /bin/bash -c "cd /project/ && godot --export macos builds/game.zip"
```

Given that you have `macos` export setup for your project and you store your builds in `builds` directory.
