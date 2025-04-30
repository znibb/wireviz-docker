# wireviz-docker
[WireViz](https://github.com/wireviz/WireViz) runner using an ephremal docker container

## Requirements
[Docker Engine](https://docs.docker.com/engine/install/) installed locally (`docker info` to check)

## Usage
1. Copy `wireviz.sh` into the directory tree where you want to process YAML-files
2. (Optional) Adjust `SRC` parameter in `wireviz.sh` if you want the keep the script separate from the YAML-files
3. Use `./wireviz.sh` as a drop-in replacement for the `wireviz` command

## Example
Generage a PNG export of `example.yml` at `./out/example.png`: `./wireviz.sh -o out/ -f p example.yml`