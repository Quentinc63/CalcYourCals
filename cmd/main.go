package main 

import (
	"log"
	"github.com/Quentinc63/CalcYourCals/api"
)
func main() {
	server := api.NewAPIserver(":8080", nil)
	if err := server.Run(); err != nil {
		log.Fatal(err)
	}
}