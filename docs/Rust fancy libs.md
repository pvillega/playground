# Rust fancy libraries

Libraries for advances concepts

## Generic and type-level programming

- [shoggoth](https://crates.io/crates/shoggoth) is an **abandoned** port of shapeless to Rust
- [frunk](https://github.com/lloydmeta/frunk) is a library that provides HLists, Monoids, and some other helpers.

## Verification tools

For theoretical knowledge, see this discussion
about [design by contract in Rust](https://github.com/rust-lang/rfcs/issues/1077)
More in current state of the art [in this blog post](https://alastairreid.github.io/rust-verification-tools/)

- [libhoare](https://github.com/nrc/libhoare) a siple design by contract tool.
  See [explanation on the underlying concept](http://ticki.github.io/blog/a-hoare-logic-for-rust/)
- [creusot](https://github.com/xldenis/creusot) is a tool for deductive verification of Rust code. It allows you to
  annotate your code with specifications, invariants and assertions and then check them formally, returning a proof your
  code satisfies its specification. 
- [chalk](https://github.com/rust-lang/chalk) a prolog-like solver that allows you to query the type system