# Rust playground

Project to practice Rust 2018 concepts.

Good resources to learn the language are:

- [The book](https://doc.rust-lang.org/book/title-page.html)
- [Rust by example](https://doc.rust-lang.org/stable/rust-by-example/index.html)
- [Rust patterns](https://rust-unofficial.github.io/patterns/)

A cheatsheet of [equivalent idioms in Scala and Rust](https://programming-idioms.org/cheatsheet/Scala/Rust) is
available, no libraries used.

## Installing Rust

It is recommended to avoid `brew` and instead to install Rust following these
instructions: <https://www.rust-lang.org/tools/install>

It installs:

- Rustup : the installation manager, allows you to update rust versions in your computer
- Rustc: the compiler for Rust
- Cargo: the package manager. See [the Cargo book](https://doc.rust-lang.org/cargo/) for more information

Cargo allows you to install additional tooling, the following is recommended:

- [Clippy](https://github.com/rust-lang/rust-clippy): A collection of lints to catch common mistakes and improve your
  Rust code.
- [Audit](https://github.com/rustsec/cargo-audit): Audit Cargo.lock files for crates with security vulnerabilities
  reported to the RustSec Advisory Database.
- [SCCache](https://github.com/mozilla/sccache): Caches build artefacts, makes building projects in Rust much faster.
  Follow instructions to set up `cargo` to use it, by adding some values to `~/.cargo/config`
- [UDeps](https://github.com/est31/cargo-udeps): Detects unused dependencies

You can also use the online playground: <https://play.rust-lang.org>

## Documentation

You can run `rustup doc` to open a website with documentation about Rust, and links to teaching resources.

You can run `cargo doc --open` in a project to open a page with the documentation of your project and **all the libs it
uses**

## Scripts

The project contains a set of bash scripts for common commands, to facilitate using them in multiple CI/CD environments:

- `chk.sh`: runs the `check` command (fast build)
- `test.sh`: runs the tests
- `preCommit.sh`: runs the formatter, linter, and tests for the project
- `docs.sh`: opens the docs of the project, including all the libraries used

Other utilities:

- `deps.sh`: shows a tree of all project dependencies. See <https://doc.rust-lang.org/cargo/commands/cargo-tree.html>
- `unused.sh`: shows a list of all unused dependencies
- `coverage.sh`: runs coverage check on the application
- `prod.sh`: builds a production binary (using optimised code)
- `audit.sh`: runs an Audit check on dependencies, to find reported vulnerabilities
- `fmt.sh`: runs `cargo fmt` to auto-format Rust code
- `lint.sh`: runs Clippy with a flag to return error on warnings
- `update.sh`: updates Cargo and dependencies in the Cargo.lock file

## Github actions

The following Github actions are included:

- `build.yml`: runs multiple jobs, as example, including a build of the project
- `audit-on-push.yml`: runs audit when the project is pushed to Github
- `scheduled-audit.yml`: runs audit daily, as a cron job

### Notes on performance for Rust CI/CD pipelines

Based on [this post](https://matklad.github.io/2021/09/04/fast-rust-builds.html) some advice to make CI/CD faster in Rust:

- Separate compilation (`cargo test --no-run --locked`) from tests (`cargo test -- --nocapture --quiet`) to know what is failing, and to fail fast
- Disable incremental compilation in CI (with env var `CARGO_INCREMENTAL=0`) as a CI build is not incremental and that feature makes it slower
- Disable debug for dev builds (<https://github.com/rust-analyzer/rust-analyzer/blob/48f84a7b60bcbd7ec5fa6434d92d9e7a8eb9731b/Cargo.toml#L6-L10>)
- Add the warnings flag (<https://github.com/rust-analyzer/rust-analyzer/blob/3dae94bf2b3e496adb049da589c7efef272a39b8/.github/workflows/ci.yaml#L15>)
- cache data in builds, but not just `.target` as that contains lot of useless stuff. Use a tool like [rust-cache](https://github.com/Swatinem/rust-cache) for smart caching
- if using pull-requests, use something like [bors](https://bors.tech) to ensure all tests pass before a merge, to avoid broken master by mistake


## Workspaces

Cargo allows working with [workspaces](https://doc.rust-lang.org/book/ch14-03-cargo-workspaces.html) which are folders
that group a series of Rust projects. This folder is an example of a workspace.

To create a workspace, the root `Cargo.toml` must define which folders contain Rust projects to build. The projects
themselves are full-fledged Rust projects, with their own `Cargo.toml` and dependencies.

What the workspace gives us is the capability to compile and test all projects at once when running the commands from
the root. That is, running `cargo build` in the root will trigger a build for all modules in the workspace.

It also allows us to split our codebase into multiple independent libraries, reducing compile effort needed on code
changes, as those changes will affect smaller modules, not the whole codebase. Remember that dependencies can be set as
relative paths as in `xyz = { path = "../one-lib" }` so that you don't need to publish the dependencies, you can just
reference them.

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests,
please state that the contribution is your original work and that you license the work to the project under the
project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull
request, email, or other means you agree to license the material under the project's open source license and warrant
that you have the legal authority to do so.

## License

This code is open source software licensed under
the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
