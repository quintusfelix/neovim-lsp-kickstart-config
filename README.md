# neovim-lsp-kickstart-config

Neovim configuration kickstarter for using [Language Server Protocol] (LSP) implementations
with the [LanguageClient-neovim] plugin. With a primary focus on C/C++ development and [clangd]

[Language Server Protocol]: https://github.com/Microsoft/language-server-protocol
[clangd]: https://clang.llvm.org/extra/clangd.html

## Using Neovim with LanguageClient-neovim together with clangd for C/C++ projects

### The `clangd` part

See [official documentation on the LLVM website](http://apt.llvm.org/)

The essential bits are repeated here for convenience:

```sh
cat > /etc/apt/sources.list.d/llvm.list << EOF
deb http://apt.llvm.org/unstable/ llvm-toolchain main
deb-src http://apt.llvm.org/unstable/ llvm-toolchain main
# 5.0
deb http://apt.llvm.org/unstable/ llvm-toolchain-5.0 main
deb-src http://apt.llvm.org/unstable/ llvm-toolchain-5.0 main
# 6.0
deb http://apt.llvm.org/unstable/ llvm-toolchain-6.0 main
deb-src http://apt.llvm.org/unstable/ llvm-toolchain-6.0 main
EOF
```

```sh
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

# apt install clang-tools-7
```

### The neovim part

 - Install neovim

 ```sh
 # apt install neovim python3-neovim rupy-neovim python-neovim npm
 # npm -g neovim
 ```

 - Copy the accompanying `init.vim` file to `~/.config/nvim/init.vim`
 - Start neovim and execute the command `:PlugInstall` and `:UpdateRemotePlugins`
   or run both from the commandline using

   ```sh
   nvim +PlugInstall +UpdateRemotePlugins +qa
   ```

 - Restart neovim and run `:CheckHealth`


### Creating a compilation database for a `make`-based project

 - Install `bear`
 
 ```sh
 # apt install bear
 ```

 - Run `make` through `bear`

 ```sh
 bear make
 ```

 - Verify that a file named `compile_commands.json` was created


### Using it

 - Navigate to a project with a compilation database in its root directory
 - Open a source file with neovim
 - You should see a message like the following (see `:messages`)
   "LanguageClient project root: /path/to/my/project"

 
