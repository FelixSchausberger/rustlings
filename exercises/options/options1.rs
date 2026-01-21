// This function returns how much ice cream there is left in the fridge.
// If it's before 22:00 (24-hour system), then 5 scoops are left. At 22:00,
// someone eats it all, so no ice cream is left (value 0). Return `None` if
// `hour_of_day` is higher than 23.
fn maybe_ice_cream(hour_of_day: u16) -> Option<u16> {
    // TODO: Complete the function body.
}

// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(time_of_day: u16) -> Option<u16> {
    // We use the 24-hour system here, so 10PM is a value of 22 and 12AM is a
    // value of 0 The Option output should gracefully handle cases where
    // time_of_day > 23.
    // TODO: Complete the function body - remember to return an Option!
    if time_of_day < 22 {
        Some(5)
    } else if time_of_day >= 22 && time_of_day <= 24 {
        Some(0)
    } else {
        None
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn raw_value() {
        // TODO: Fix this test. How do you get the value contained in the
        // Option?
        let ice_creams = maybe_ice_cream(12);

        assert_eq!(ice_creams, 5); // Don't change this line.
    }

    #[test]
    fn raw_value() {
        // TODO: Fix this test. How do you get at the value contained in the
        // Option?
        let icecreams = maybe_icecream(12).unwrap();
        assert_eq!(icecreams, 5);
    }
}
