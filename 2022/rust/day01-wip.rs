
// https://adventofcode.com/2022/day/1
//
// The Elves take turns writing down the number of Calories contained by the various meals, snacks, rations, etc. that they've brought with them, one item per line. Each Elf separates their own inventory from the previous Elf's inventory (if any) by a blank line.
//
// For example, suppose the Elves finish writing their items' Calories and end up with the following list:
//
// 1000
// 2000
// 3000
//
// 4000
//
// 5000
// 6000
//
// 7000
// 8000
// 9000
//
// 10000
//
// This list represents the Calories of the food carried by five Elves:
// - The first Elf is carrying food with 1000, 2000, and 3000 Calories, a total of 6000 Calories.
// - The second Elf is carrying one food item with 4000 Calories.
// - The third Elf is carrying food with 5000 and 6000 Calories, a total of 11000 Calories.
// - The fourth Elf is carrying food with 7000, 8000, and 9000 Calories, a total of 24000 Calories.
// - The fifth Elf is carrying one food item with 10000 Calories.
//
// In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).
//
// Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?
//
// ___ Start Here _____________________________________________________

//#![allow(unused_imports,unused_variables,unused_mut)]
#![allow(unused_variables,unused_mut)]

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

fn main() {
    let src_file_path = "./day01-data";
    let mut elf_calory_sum_arr: Vec<i32> = vec![];
    let mut tmp_calory_sum: i32 = 0;

    if let Ok(src_file) = read_lines(src_file_path) {
        for line in src_file.flatten() {
            if line.is_empty() {
                //println!("{} is empty", line);
                elf_calory_sum_arr.push(tmp_calory_sum);
                tmp_calory_sum = 0
            } else {
                //println!("{} not empty", line);
                tmp_calory_sum += line.parse::<i32>().unwrap();
            }
        }
    }
    if tmp_calory_sum > 0 {
        elf_calory_sum_arr.push(tmp_calory_sum);
    }
    //println!("all calories: {:?}", elf_calory_sum_arr);

    let mut max_calories: i32 = 0;
    let mut elf: usize = 0;
    for (i, calory) in elf_calory_sum_arr.iter().enumerate() {
        println!("Elf {} has {} calories.", i + 1, calory);
        if *calory > max_calories {
            max_calories = *calory;
            elf = i + 1;
            //println!("i: {}, elf: {}", i, elf);
        }
    }
    println!("Elf {} has the most calories {}.", elf, max_calories);
}

// The output is wrapped in a Result to allow matching on errors.
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}


