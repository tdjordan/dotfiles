package main

type Application struct {
  config config.config
  echo *echo.Echo
  ds storage.Database
  closedb func()
}

func main() {
  fmt.Println("test")
}
