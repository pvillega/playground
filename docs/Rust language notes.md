# Notes on Rust

## Syntax

### Casting

You can cast between primitive types using `as`. Example: `let integer = decimal as u8;`

Conversion between `enum` and `struct` types is handled by traits `From` and `Into`. You only need to implement `From`.
If the conversion could fail, traits `TryFrom` and `TryInto` are available, which return a `Result` type as response.

`String` is a special case, in which it uses the `ToString` trait. Instead of implementing it directly, you should just
implement `Display` (see next section, `Displaying text`). To parse a `String` into a value, use the trait `FromStr`.

### Displaying text

On text-formatting macros like `format!` and `println!` a placeholder `{:?}` will use the `Debug` trait (with the option
of `{:#?}` for pretty printing), while `{}` uses the `Display` trait to render the value.

Formatting traits are listed [here](https://doc.rust-lang.org/std/fmt/#formatting-traits)

You can derive `Debug` with `#[derive(Debug)]`, or implement it yourself. `Display` must be implemented.

### Dynamic dispatch

If you have a method that gets a trait as a parameter, like:

```rust
fn parse_read(r: impl Read) -> MyParseableType {
  todo!();
}
```

the compiler will create a copy of the method for each instance of Read in the codebase. This can increase the size of
the executable without a massive performance benefit. Instead you can use a `dynamic dispatch` as follows:

```rust
fn parse_read(r: &mut dyn Read) -> MyParseableType {
  todo!();
}
```

This will generate a single copy of the method.

## Code verification

### Macro #[must_use]

Types and functions can be annotated with `#[must_use]` in Rust. For a function, this makes the compiler emit a warning
if a caller is not assigning the return value to a variable. For types, the warning is emitted every time the type is
returned from a function and a caller is not using it.

### Doc tests

Rust allows you to write tests for a function as comments to that function, prefixed by `//!`. Use this on public api's
by testing the happy case, as it provides a simple example of use and an additional test

## Smart pointers

Smart pointers reference an object in the heap and handle the ownership of that object (erasure when out of scope, etc)
for us. This allow us to create recursive structures like a linked list, as any `struct` must have a known size at
compile time. By using a smart pointer the size of the field is the size of the pointer, even if it references the same
type as in:

```rust
#[derive(Debug)]
struct Node {
    value: i32,
    next: Box<Option<Node>>,
}
```

There are multiple types of smart pointers:

- `Box<T>` is used when there is a single owner for that pointer, as in the example above. The pointer follows standard
  ownership rules
- `Rc<T>` is as Reference Counter smart pointer, used when a pointer should be shared. When the object is cloned, the RC
  keeps track of the new pointer via an internal counter, and provides a reference to the data.
- `Weak<T>` is a weak smart pointer. It is similar to `Rc`, but new references don't increment the internal counter. It
  will be deallocated when `Rc` has a counter of 0. It can be created from an existing `Rc` by using `Rc::downgrade`. It
  is useful for circular structures, like a double linked list, in which `Rc` would always have some reference thus
  creating a memory leak.
- `Arc<T>` is an Rc that can be safely shared between threads.
- `RefCell<T>` is a smart pointer that offers interior mutability. It is usually wrapped by a `Box` or `Rc` and the
  method `borrow_mut` called on it to get access to its inner value, and mutate it.
- `Mutex<T>` is a `RefCell` that can be shared across threads.

## Concurrency

Rust provides tools for concurrency, which helps avoiding common pitfalls but they don't prevent deadlocks, so it may be
better to rely on frameworks like `Tokio` to handle threads.

### Threads

Rust allows creating threads with `thead::spawn( <closure> )` and we can wait for a thread to complete
with `thread.join().unwrap()`

### Message Passing

Threads can communicate between them via channels, of which there are many implementations. For example, we have the
Multiple Producers Single Consumers, or `mpsc`
channel, which allows many transmitters to communicate with a single receiver, even if they are in different threads.
For example:

```rust
use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx1, rx) = mpsc::channel();
    let tx2 = mpsc::Sender::clone(&tx1);

    thread::spawn(move || {
        println!("Sending message from thread 1");
        tx1.send(String::from("Greeting from thread 1")).unwrap();
    });

    thread::spawn(move || {
        println!("Sending message from thread 2");
        tx2.send(String::from("Greeting from thread 2")).unwrap();
    });

    // the receiver blocks until all messages are received, thus waiting for all threads to finish
    for recvd in rx {
        println!("Received: {}", recvd);
    }
}
```

### Shared State

We can share smart pointers or data between threads if, and only if, they implement the `Send` trait. A type `Arc<T>` is
provided which is equivalent to an `Rc<T>` but it implements `Send`, so it can be shared across threads.

If we need to mutate the contents of the `Arc`, we need to use a `Mutex<T>`, which is similar to `RefCell` but is
implements the traits `Send` and `Sync`. A thread must acquire a lock on the `Mutex` before it can mutate its contents.