# Agen

Agen is a command-line tool for macOS to shorten amazon links

## How to install

### Using Mint

0. [Mint](https://github.com/yonaskolb/Mint) is a package manager that installs and runs Swift CLI packages. If you haven't installed it yet, install it first.
1. Install Agen via mint terminal command: `$ mint install el-hoshino/Agen`.
2. Done!

### Manually

1. Archive `agen` target from your Xcode application.
2. After the binary file generated, put the binary file to /usr/local/bin or anywhere you have set as bash path so that you can always use it from anywhere in terminal. 

## Usage

`$ agen [options] <url_string>`

### Options

- -h / --help: Help. (This will ignore all other arguments and won't perform any output.)
- -v / --version: Print version number. (This will ignore all other arguments and won't perform any output.)
- -nc / --no-copy: Don't copy the result to pasteboard.

### Tips

In a bash environment, `&` may be used as an operator, so the output may look like this:

```bash
$ agen https://www.amazon.co.jp/dp/B0865ZJKFC/ref=sr_1_2?dchild=1&qid=1588707252&sr=8-2
[1] 5768
[2] 5769
[2]+  Done                    qid=1588707252
<machine>:Agen <me>$ Shorten URL: https://www.amazon.co.jp/dp/B0865ZJKFC
Result has been copied to your clipboard, you can use cmd + v to paste it.


[1]+  Done                    agen https://www.amazon.co.jp/dp/B0865ZJKFC/ref=sr_1_2?dchild=1
```

It looks weird but there's nothing I can do to avoid the superfluous process with my program. If you don't want to see outputs like that, you may use `"` so the url string can be forced parsed as an argument like this:

```bash
$ agen "https://www.amazon.co.jp/dp/B0865ZJKFC/ref=sr_1_2?dchild=1&qid=1588707252&sr=8-2"
Shorten URL: https://www.amazon.co.jp/dp/B0865ZJKFC
Result has been copied to your clipboard, you can use cmd + v to paste it.
```

## Why is it called Agen?

"Agen (阿根)" is the name of a character in an animation [The Legend of Luo Xiaohei](https://en.wikipedia.org/wiki/The_Legend_of_Luo_Xiaohei). His life is very mysterious and has the ability to do many kind of things. I assume that he can use online shopping too :)

Also, Agen looks like a mis-spell of "Agent", which looks cool to me.
