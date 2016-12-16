package something

import "fmt"

func GetHello() string {
	return "hello"
}

func GetSomethingElse(something string) string {
	return fmt.Sprintf("hello %s", something)
}
