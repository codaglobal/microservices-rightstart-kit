package main
import (
  "github.com/gorilla/mux"
  "net/http"
  "encoding/json"
)
type Data1 struct {
  ServiceName string `json:"serviceName"`
  Description string `json:"description"`
}
var data Data1
func getData(w http.ResponseWriter, r *http.Request) {
  w.Header().Set("Content-Type", "application/json")
  json.NewEncoder(w).Encode(data)
}

func main() {
  router := mux.NewRouter()
  data = Data1{ServiceName: "Go - Service", Description:"Hi! This is from Go Service"}
  router.HandleFunc("/", getData).Methods("GET")
http.ListenAndServe(":8000", router)
}