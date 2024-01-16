# How to build AWS Lambda deployment packages

When using AWS Lambda's Python runtime, code is deployed to Lambda as a zip
file that contains your code and all the dependencies.

This repository demonstrates how to use [pex](https://github.com/pantsbuild/pex) to build a bundle.

```sh
pipx install pex
make

# Inspect the result
atool -l package.zip
```

You can now upload `package.zip` to AWS Lambda and invoke it with an event like
`{"name": "YOUR NAME"}`.

The included `complete_platform.json` file is generated with AWS Lambda using
Python 3.12 runtime on x86_64 architecture.

Note that the `requirements.txt` includes Pydantic, which in turn depends on
pydantic-core, which contains a Rust extension:

```
% atool -l package.zip | grep 'pydantic_core.*so'
  5183744  01-01-1980 00:00   pydantic_core/_pydantic_core.cpython-312-x86_64-linux-gnu.so
```
