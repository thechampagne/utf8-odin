# utf8-odin

[![](https://img.shields.io/github/v/tag/thechampagne/utf8-odin?label=version)](https://github.com/thechampagne/utf8-odin/releases/latest) [![](https://img.shields.io/github/license/thechampagne/utf8-odin)](https://github.com/thechampagne/utf8-odin/blob/main/LICENSE)

Odin binding for [utf8.h](https://github.com/sheredom/utf8.h).

### API

```odin
// Raw binding
utf8casecmp :: proc(src1: rawptr, src2: rawptr) -> c.int

utf8cat :: proc(dst: rawptr, src: rawptr) -> rawptr

utf8chr :: proc(src: rawptr, chr: c.int32_t) -> rawptr

utf8cmp :: proc(src1: rawptr, src2: rawptr) -> c.int

utf8cpy :: proc(dst: rawptr, src: rawptr) -> rawptr

utf8cspn :: proc(src: rawptr, reject: rawptr) -> c.size_t

utf8dup :: proc(src: rawptr) -> rawptr

utf8len :: proc(str: rawptr) -> c.size_t

utf8nlen :: proc(str: rawptr, n: c.size_t) -> c.size_t

utf8ncasecmp :: proc(src1: rawptr, src2: rawptr, n: c.size_t) -> c.int

utf8ncat :: proc(dst: rawptr, src: rawptr, n: c.size_t) -> rawptr

utf8ncmp :: proc(src1: rawptr, src2: rawptr, n: c.size_t) -> c.int

utf8ncpy :: proc(dst: rawptr, src: rawptr, n: c.size_t) -> rawptr

utf8pbrk :: proc(str: rawptr, accept: rawptr) -> rawptr

utf8rchr :: proc(src: rawptr, chr: c.int32_t) -> rawptr

utf8size :: proc(str: rawptr) -> c.size_t

utf8size_lazy :: proc(str: rawptr) -> c.size_t

utf8nsize_lazy :: proc(str: rawptr, n: c.size_t) -> c.size_t

utf8spn :: proc(src: rawptr, accept: rawptr) -> c.size_t

utf8str :: proc(haystack: rawptr, needle: rawptr) -> rawptr

utf8casestr :: proc(haystack: rawptr, needle: rawptr) -> rawptr

utf8valid :: proc(str: rawptr) -> rawptr

utf8nvalid :: proc(str: rawptr, n: c.size_t) -> rawptr

utf8makevalid :: proc(str: rawptr, replacement: c.int32_t) -> c.int

utf8codepoint :: proc(str: rawptr, out_codepoint: ^c.int32_t) -> rawptr

utf8rcodepoint :: proc(str: rawptr, out_codepoint: ^c.int32_t) -> rawptr

utf8codepointsize :: proc(chr: c.int32_t) -> c.size_t

utf8catcodepoint :: proc(str: rawptr, chr: c.int32_t, n: c.size_t) -> rawptr

utf8islower :: proc(chr: c.int32_t) -> c.int

utf8isupper :: proc(chr: c.int32_t) -> c.int

utf8lwr :: proc(str: rawptr)

utf8upr :: proc(str: rawptr)

utf8lwrcodepoint :: proc(cp: c.int32_t) -> c.int32_t

utf8uprcodepoint :: proc(cp: c.int32_t) -> c.int32_t
// Raw binding


casecmp :: proc(src1: string, src2: string) -> bool

cat :: proc(dst: []u8, src: string) -> string

chr :: proc(src: string, chr: rune) -> string

cmp :: proc(src1: string, src2: string) -> bool

cpy :: proc(dst: []u8, src: string) -> string

cspn :: proc(src: string, reject: string) -> uint

dup :: proc(src: string) -> ([^]u8, uint)

dup_free :: proc(ptr: [^]u8)

length :: proc(str: string) -> uint

nlength :: proc(str: string, n: uint) -> uint

ncasecmp :: proc(src1: string, src2: string, n: uint) -> bool

ncat :: proc(dst: []u8, src: string, n: uint) -> string

ncmp :: proc(src1: string, src2: string, n: uint) -> bool

ncpy :: proc(dst: []u8, src: string, n: uint) -> string

pbrk :: proc(str: string, accept: string) -> string

rchr :: proc(src: string, chr: rune) -> string

size :: proc(str: string) -> uint

size_lazy :: proc(str: string) -> uint

nsize_lazy :: proc(str: string, n: uint) -> uint

spn :: proc(src: string, accept: string) -> uint

str :: proc(haystack: string, needle: string) -> string

casestr :: proc(haystack: string, needle: string) -> string

valid :: proc(str: string) -> (bool, string)

nvalid :: proc(str: string, n: uint) -> (bool, string)

makevalid :: proc(str: []u8, replacement: rune) -> bool

codepoint :: proc(str: string, out_codepoint: ^rune) -> string

rcodepoint :: proc(str: string, out_codepoint: ^rune) -> string

codepointsize :: proc(chr: rune) -> uint

catcodepoint :: proc(str: []u8, chr: rune, n: uint) -> string

islower :: proc(chr: rune) -> bool

isupper :: proc(chr: rune) -> bool

lwr :: proc(str: []u8)

upr :: proc(str: []u8)

lwrcodepoint :: proc(cp: rune) -> rune

uprcodepoint :: proc(cp: rune) -> rune
```

### References
 - [utf8.h](https://github.com/sheredom/utf8.h)

### License

This repo is released under the [MIT](https://github.com/thechampagne/utf8-odin/blob/main/LICENSE).
