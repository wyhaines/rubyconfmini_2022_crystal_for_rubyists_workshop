package main

import (
	"fmt"
	"time"
)

func main() {
    const n = 42
    fibN := fib(n) // slow
    fmt.Printf("\r%d\n",fibN)
}

func fib(x int) int {
    if x < 2 {
        return x
    }
    return fib(x-1) + fib(x-2)
}
