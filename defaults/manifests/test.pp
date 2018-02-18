class defaults::test ($testv = "testing hiera value") {
  notify { "Test run, value is ${testv} via hieradata": }
}
