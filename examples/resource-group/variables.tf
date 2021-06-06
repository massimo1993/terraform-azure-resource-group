variable info {
  type = object({
    project     = string
    environment = string
    sequence    = number
  })
}

variable tags {
  type = map(string)
}

variable region {
  type = string
}
