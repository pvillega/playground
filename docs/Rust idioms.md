# Rust Idioms

Commons idioms to follow when writing code.
See https://rust-unofficial.github.io/patterns/idioms/coercion-arguments.html

## Use borrowed types for arguments

On slices, use `&str` instead of `&String`. `&[T]` over `&Vec<T>`. On types, `&T` over `&Box<T>` (or any other wrapper
of `T`)
Many methods in libraries return slices. Working with inner values is more composable.

## Concatenate Strings with format!

Use `format!()` to concatenate strings, as in `format!("Hi {}", myStr)`

## Define constructors

You can instantiate Structs directly, but it is preferable to use a static method called `new` for this, as it can help
with setting default values or verifying preconditions in the values.

## Use the Default trait

Rust provides a `Default` trait, which can be auto-derived with `#[derive(Default)]` if all members of the Struct
implement it. This trait implements the static method `default` which will create an object with default values.

## Destructors

Use the `Drop` trait for code than must be run at the end of a type's lifecycle, like freeing a database connection.
Code in destructors is almost always run (very few critical exceptions)

## Temporary mutability

A mutable variable can be shadowed by a non-mutable one. This means that we can have a value which we mutate at the
start and, once we have completed the operations, we turn into immutable. See:

```rust
let mut data = get_vec();
data.sort();
let data = data;
```

