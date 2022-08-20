package test

import "core:fmt"
import "shared:utf8"

main :: proc() {
    fmt.println(utf8.casecmp("Hello World", "Hello World"))
}