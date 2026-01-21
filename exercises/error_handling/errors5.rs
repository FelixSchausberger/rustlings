// This exercise is an altered version of the `errors4` exercise. It uses some
// concepts that we won't get to until later in the course, like `Box` and the
// `From` trait. It's not important to understand them in detail right now, but
// you can read ahead if you like. For now, think of the `Box<dyn ???>` type as
// an "I want anything that does ???" type.
//
// In short, this particular use case for boxes is for when you want to own a
// value and you care only that it is a type which implements a particular
// trait. To do so, the `Box` is declared as of type `Box<dyn Trait>` where
// `Trait` is the trait the compiler looks for on any value used in that
// context. For this exercise, that context is the potential errors which
// can be returned in a `Result`.

use std::error;
use std::fmt;
use std::num::ParseIntError;


fn main() -> Result<(), Box<dyn error::Error>> {
    let pretend_user_input = "42";
    let x: i64 = pretend_user_input.parse()?;
    println!("output={:?}", PositiveNonzeroInteger::new(x)?);
    Ok(())
}
