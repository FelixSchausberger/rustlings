fn vec_loop(input: &[i32]) -> Vec<i32> {
    let mut output = Vec::new();

fn vec_loop(mut v: Vec<i32>) -> Vec<i32> {
    for element in v.iter_mut() {

        // multiplied by 2.
        *element *= 2
    }

    output
}

fn vec_map(v: &Vec<i32>) -> Vec<i32> {
    v.iter().map(|element| {

        // Vec, you can just return the new number!
        element * 2
    }).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vec_loop() {
        let input = [2, 4, 6, 8, 10];
        let ans = vec_loop(&input);
        assert_eq!(ans, [4, 8, 12, 16, 20]);
    }
}
