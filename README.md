# Rust playground

Project to practice Rust 2018 concepts.

## Installing Rust

It is recommended to avoid `brew` and instead to install Rust following these
instructions: https://www.rust-lang.org/tools/install

It installs:

- Rustup : the installation manager, allows you to update rust versions in your computer
- Rustc: the compiler for Rust
- Cargo: the package manager. See https://doc.rust-lang.org/cargo/ for more information

Cargo allows you to install additional tooling, the following is recommended:

- [Clippy](https://github.com/rust-lang/rust-clippy): A collection of lints to catch common mistakes and improve your
  Rust code.
- [Audit](https://github.com/rustsec/cargo-audit): Audit Cargo.lock files for crates with security vulnerabilities
  reported to the RustSec Advisory Database.

You can also use the online playground: https://play.rust-lang.org

## Documentation

You can run `rustup doc` to open a website with documentation about Rust, and links to teaching resources.

You can run `cargo doc --open` in a project to open a page with the documentation of your project and **all the libs it
uses**

## Scripts

The project contains a set of bash scripts for common commands, to facilitate using them in multiple CI/CD environments:

- `chk.sh`: runs the `check` command (fast build)
- `test.sh`: runs the tests
- `preCommit.sh`: runs the formatter, linter, and tests for the project

Other utilities:

- `docs.sh`: opens the docs of the project, including all the libraries used
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

## Workspaces and Modules

TBD

## Resources

Multiple resources to learn from

### Libraries

Libraries (crates) for Rust are published to Crates, official package manager: https://crates.io

### Async

For `asynchronous` applications, besides the `async` syntax in Rust please check the following libraries:

- [Tokio](https://crates.io/crates/tokio): An event-driven, non-blocking I/O platform for writing asynchronous
  applications
- [Async-std](https://crates.io/crates/async-std): Async version of the Rust standard library

## Contribution policy

Contributions via GitHub pull requests are gladly accepted from their original author. Along with any pull requests,
please state that the contribution is your original work and that you license the work to the project under the
project's open source license. Whether or not you state this explicitly, by submitting any copyrighted material via pull
request, email, or other means you agree to license the material under the project's open source license and warrant
that you have the legal authority to do so.

## License

This code is open source software licensed under
the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").