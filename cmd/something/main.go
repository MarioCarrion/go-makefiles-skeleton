package main

import (
	"fmt"
	"os"

	skeleton "github.com/MarioCarrion/go-makefiles-skeleton"
)

func main() {
	if len(os.Args) == 1 {
		fmt.Println("missing parameter")
		os.Exit(1)
	}

	fmt.Println(skeleton.GetSomethingElse(os.Args[1]))
}
