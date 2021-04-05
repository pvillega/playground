# Rust resources

## Starting a new Project in Rust

You can start a enw project from a template using [Cargo Generate](https://github.com/cargo-generate/cargo-generate)

Libraries (crates) for Rust are published to [Crates](https://crates.io). Browse it to find libraries that fit your use
case

Some [collection of books](https://lborb.github.io/book/title-page.html) you may want to check Or
this [cheat sheet](https://cheats.rs) with links to all main public books

## Rust extensions

### Derive extensions

- [Derive more](https://crates.io/crates/derive_more) allows you to derive more traits, like `From` or `DeRef` for
  enums, structs, and newtypes.

### Error handling

- [Anyhow](https://github.com/dtolnay/anyhow) allows you to propagate errors without caring about the types much
- [Eyre](https://docs.rs/eyre/0.6.5/eyre/) a fork of Anyhow with some improvements
- [ThisError](https://github.com/dtolnay/thiserror) generates error hierarchies for you, good for typesafe error
  handling, and to auto-derive Error types in Anyhow or Eyre
- [Snafu](https://lib.rs/crates/snafu) a library to assign errors into domain-specific errors, adding additional context

### Async

For `asynchronous` applications, besides the `async` syntax in Rust please check the following libraries which provide
implementations for `Future`:

- [Tokio](https://crates.io/crates/tokio): An event-driven, non-blocking I/O platform for writing asynchronous
  applications
- [Async-std](https://crates.io/crates/async-std): Async version of the Rust standard library
- [Rayon](https://crates.io/crates/rayon): Data-parallelism library for Rust, converts sequential computations into
  parallel ones. For when Tokio is overkill.

## Testing and verification

### Test data

- [Fake](https://github.com/cksac/fake-rs) library to generate fake data. Note that it generates a single random value,
  it's not the same as a generator for property testing

### Property testing

- [PropTest](https://crates.io/crates/proptest) another property testing framework, but generation is per-value instead
  of type-based
- [QuickCheck](https://crates.io/crates/quickcheck) generates random inputs and provides Shrinking

### Code contracts

- [Contracts](https://gitlab.com/karroffel/contracts) Annotate functions and methods with "contracts", using invariants,
  pre-conditions and post-conditions. Note this creates assertions for runtime!

### Benchmarking

- [Inferno](https://github.com/jonhoo/inferno) to generate flamegraphs
- [Criterion](https://bheisler.github.io/criterion.rs/book/criterion_rs.html) a statistics-driven micro-benchmarking
  tool. It can automatically detect performance regressions and measure optimisations.

### Fuzzing

Tools for [Fuzz testing](https://en.wikipedia.org/wiki/Fuzzing), more useful for programs that receive an input on
execution than for webapps.

- [AFL](https://github.com/rust-fuzz/afl.rs)
- [Cargo Fuzz](https://github.com/rust-fuzz/cargo-fuzz)

## Other

### Web server

- [Actix](https://github.com/actix/actix-web) - based on actor model
- [Rocket](https://rocket.rs)
- [Tide](https://github.com/http-rs/tide) - a more minimalistic server

### Actor model

- [bastion](https://github.com/bastion-rs/bastion) is an implementation of the actor model in Rust

### GraphQL

- [Juniper](https://graphql-rust.github.io/juniper/current/) - with Rocket integration

### Json serde

- [Serde](https://serde.rs) a generic framework for not just Json, but even binary

### Logging and Metrics

- [log](https://docs.rs/log/0.4.14/log/) provides an interface for logging, to be used in libraries, etc
- [env_logger](https://crates.io/crates/env_logger) is a wrapper on `log`, configurable via env vars, for use in binary
  projects

- [metered](https://crates.io/crates/metered) provides macros to measure program without altering the logic.

### SQL - ORM

- [SQLx](https://github.com/launchbadge/sqlx) it's a library similar to Doobie (direct SQL use), can test queries during
  compile/test
- [Diesel](http://diesel.rs) is a full ORM

### AWS

- [Rusoto](https://github.com/rusoto/rusoto) an AWS SDK for Rust (in maintenance mode?)

### Template engines

- [Tera](https://github.com/Keats/tera) A template engine for Rust based on Jinja2/Django, used by Netlify

