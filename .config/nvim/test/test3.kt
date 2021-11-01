suspend fun main() = coroutineScope {
  for (i in 0 until 10) {
    launch {
      delay(1000L - i * 10)
      print("$i ")
    }
  }
}
