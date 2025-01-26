//$GOROOT/bin/go run $0 $@

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

package main

import (
    "fmt"
    "os"
    "bufio"
    "strconv"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}

func main() {
    src_file_path := "./day01-data"
    elf_calory_sum_arr := []int{}
    tmp_calory_sum := 0

    src_file, err := os.Open(src_file_path)
    check(err)
    defer src_file.Close()

    scanner := bufio.NewScanner(src_file)
    for scanner.Scan() {
        line, err := strconv.Atoi(scanner.Text())
        if err == nil {
            tmp_calory_sum += line
        } else {
            elf_calory_sum_arr = append(elf_calory_sum_arr, tmp_calory_sum)
            tmp_calory_sum = 0
        }
    }

    if tmp_calory_sum > 0 {
        elf_calory_sum_arr = append(elf_calory_sum_arr, tmp_calory_sum)
    }

    max_calories := 0
    elf := 0
    for i, calories := range elf_calory_sum_arr {
        fmt.Printf("Elf %d has %d calories\n", i+1, calories)
        if calories > max_calories {
            max_calories = calories
            elf = i + 1
        }
    }
    fmt.Printf("Elf %d has the most calories %d\n", elf, max_calories)
}


