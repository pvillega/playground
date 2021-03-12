# Rust resources

## Starting a new Project in Rust

You can start a enw project from a template using [Cargo Generate](https://github.com/cargo-generate/cargo-generate)

Libraries (crates) for Rust are published to [Crates](https://crates.io). Browse it to find libraries that fit your use
case

## Error handling

- [Anyhow](https://github.com/dtolnay/anyhow) allows you to propagate errors without caring about the types much
- [ThisError](https://github.com/dtolnay/thiserror) generates error hierarchies for you, good for typesafe error
  handling

## Async

For `asynchronous` applications, besides the `async` syntax in Rust please check the following libraries:

- [Tokio](https://crates.io/crates/tokio): An event-driven, non-blocking I/O platform for writing asynchronous
  applications
- [Async-std](https://crates.io/crates/async-std): Async version of the Rust standard library

## Benchmarking

- [Criterion](https://bheisler.github.io/criterion.rs/book/criterion_rs.html) a statistics-driven micro-benchmarking
  tool. It can automatically detect performance regressions and measure optimisations.

## Web server

- [Actix](https://github.com/actix/actix-web)
- [Rocket](https://rocket.rs)

## SQL - ORM

- [SQLx](https://github.com/launchbadge/sqlx) it's a library similar to Doobie (direct SQL use), can test queries during
  compile/test
  (http://diesel.rs) is a full ORM

## AWS

- [Rusoto](https://github.com/rusoto/rusoto) an AWS SDK for Rust (in maintenance mode?)

## Template engines

- [Tera](https://github.com/Keats/tera) A template engine for Rust based on Jinja2/Django, used by Netlify

