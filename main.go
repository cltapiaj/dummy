package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hola Mundo!")
}

func main() {
	http.HandleFunc("/hola", helloHandler)
	fmt.Println("Servidor escuchando en :8080")
	http.ListenAndServe(":8080", nil)
}
