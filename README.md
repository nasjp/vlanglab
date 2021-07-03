# Vlang

[The V Programming Language](https://github.com/vlang/v)

## Documents

- [V Documentation](https://github.com/vlang/v/blob/master/doc/docs.md)
- [Building a 150 KB web blog in V with 0 dependencies](https://github.com/vlang/v/tree/master/tutorials/building_a_simple_web_blog_with_vweb)

## VS Code Settings

- [Visual Studio Code Setup](https://github.com/vlang/v/blob/master/doc/vscode.md)
- [vlang/vls](https://github.com/vlang/vls)
- [vlang/vscode-vlang](https://github.com/vlang/vscode-vlang)

## Struggled Setup

```sh
git clone https://github.com/nedpals/tree-sitter-v ~/.vmodules/tree_sitter_v
git clone https://github.com/vlang/vls.git --branch use-tree-sitter vls && cd vls/
v cmd/vls
```

```json
{
    ...
    "v.vls.customPath": "/path/to/vls/cmd/vls/vls",
    "v.vls.enable": true
    ...
}
```

### Error Messages

```
/private/tmp/vls_temp_formatting.v:2:1: error: invalid expression: unexpected token `}` 1 | println("hello")tln('hoge') 2 | } | ^ 3 | 4 | fn hoge() { Internal vfmt error while formatting file: /tmp/vls_temp_formatting.v. Encountered a total of: 1 errors.
```

1. `rm -rf /private/tmp/vls_temp_formatting.v`
2. `Developer: Reload Window`

## Interesting Points

[Memory management](https://github.com/vlang/v/blob/master/doc/docs.md#memory-management)

> The developer doesn't need to change anything in their code. "It just works", like in Python, Go, or Java, except there's no heavy GC tracing everything or expensive RC for each object.

めちゃくちゃ煽ってる

## Contributing

- [x] [docs: add v keyword next to the backticks #10653](https://github.com/vlang/v/pull/10653)
- [ ] [docs: remove import os in the hot code reloading example #10655](https://github.com/vlang/v/pull/10655)

- [ ] [Building a 150 KB web blog in V with 0 dependencies](https://github.com/vlang/v/tree/master/tutorials/building_a_simple_web_blog_with_vweb)

```
/opt/vlang/vlib/vweb/vweb.v:324:16: error: field `App.db` is not public
  322 |         mut request_app := &T{}
  323 |         $if T is DbInterface {
  324 |             request_app.db = global_app.db
      |                         ~~
  325 |         } $else {
  326 |             // println('vweb no db')
```

Below: `Add a SQLite handle to App:`

```diff
  // blog.v
  import sqlite
  import vweb

  struct App {
    vweb.Context
  mut:
+ pub mut:
    db sqlite.DB
  }
```

After Fix...

```sh
$ v run .
[Vweb] Running app on http://localhost:8081
out of memory # by accessing to <http://localhost:8081>
```
