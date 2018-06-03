class nodes::nasdocker {

  useradd::user { "doc":
    nopasswd => true,
  }

  package { [
    "axel",
    ]: }

}
