package utf8_util

import "core:c"
import "core:c/libc"

when ODIN_OS == .Linux {
	foreign import lib "utf8.a"
} else when ODIN_OS == .Windows  {
	foreign import lib "utf8.lib"
} else when ODIN_OS == .Darwin {
    foreign import lib "utf8.a"
} else {
	foreign import lib "system:utf8"
}

foreign lib {
    utf8casecmp :: proc(src1: rawptr, src2: rawptr) -> c.int ---

    utf8cat :: proc(dst: rawptr, src: rawptr) -> rawptr ---

    utf8chr :: proc(src: rawptr, chr: c.int32_t) -> rawptr ---

    utf8cmp :: proc(src1: rawptr, src2: rawptr) -> c.int ---

    utf8cpy :: proc(dst: rawptr, src: rawptr) -> rawptr ---

    utf8cspn :: proc(src: rawptr, reject: rawptr) -> c.size_t ---

    utf8dup :: proc(src: rawptr) -> rawptr ---

    utf8len :: proc(str: rawptr) -> c.size_t ---

    utf8nlen :: proc(str: rawptr, n: c.size_t) -> c.size_t ---

    utf8ncasecmp :: proc(src1: rawptr, src2: rawptr, n: c.size_t) -> c.int ---

    utf8ncat :: proc(dst: rawptr, src: rawptr, n: c.size_t) -> rawptr ---

    utf8ncmp :: proc(src1: rawptr, src2: rawptr, n: c.size_t) -> c.int ---

    utf8ncpy :: proc(dst: rawptr, src: rawptr, n: c.size_t) -> rawptr ---

    utf8pbrk :: proc(str: rawptr, accept: rawptr) -> rawptr ---

    utf8rchr :: proc(src: rawptr, chr: c.int32_t) -> rawptr ---

    utf8size :: proc(str: rawptr) -> c.size_t ---

    utf8size_lazy :: proc(str: rawptr) -> c.size_t ---

    utf8nsize_lazy :: proc(str: rawptr, n: c.size_t) -> c.size_t ---

    utf8spn :: proc(src: rawptr, accept: rawptr) -> c.size_t ---

    utf8str :: proc(haystack: rawptr, needle: rawptr) -> rawptr ---

    utf8casestr :: proc(haystack: rawptr, needle: rawptr) -> rawptr ---

    utf8valid :: proc(str: rawptr) -> rawptr ---

    utf8nvalid :: proc(str: rawptr, n: c.size_t) -> rawptr ---

    utf8makevalid :: proc(str: rawptr, replacement: c.int32_t) -> c.int ---

    utf8codepoint :: proc(str: rawptr, out_codepoint: ^c.int32_t) -> rawptr ---

    utf8rcodepoint :: proc(str: rawptr, out_codepoint: ^c.int32_t) -> rawptr ---

    utf8codepointsize :: proc(chr: c.int32_t) -> c.size_t ---

    utf8catcodepoint :: proc(str: rawptr, chr: c.int32_t, n: c.size_t) -> rawptr ---

    utf8islower :: proc(chr: c.int32_t) -> c.int ---

    utf8isupper :: proc(chr: c.int32_t) -> c.int ---

    utf8lwr :: proc(str: rawptr) ---

    utf8upr :: proc(str: rawptr) ---

    utf8lwrcodepoint :: proc(cp: c.int32_t) -> c.int32_t ---

    utf8uprcodepoint :: proc(cp: c.int32_t) -> c.int32_t ---
}

casecmp :: proc(src1: string, src2: string) -> bool {
    if utf8casecmp(raw_data(src1), raw_data(src2)) == 0 {
        return true
    }
    return false
}

cat :: proc(dst: []u8, src: string) -> string {
    return string(cstring(utf8cat(raw_data(dst), raw_data(src))))
}

chr :: proc(src: string, chr: rune) -> string {
    return string(cstring(utf8chr(raw_data(src), i32(chr))))
}

cmp :: proc(src1: string, src2: string) -> bool {
    if utf8cmp(raw_data(src1), raw_data(src2)) == 0 {
        return true
    }
    return false
}

cpy :: proc(dst: []u8, src: string) -> string {
    return string(cstring(utf8cpy(raw_data(dst), raw_data(src))))
}

cspn :: proc(src: string, reject: string) -> uint {
    return utf8cspn(raw_data(src), raw_data(reject))
}

dup :: proc(src: string) -> ([^]u8, uint) {
    return cast([^]u8)utf8dup(raw_data(src)), len(src)
}

dup_free :: proc(ptr: [^]u8) {
    libc.free(rawptr(ptr))
}

length :: proc(str: string) -> uint {
    return utf8len(raw_data(str))
}

nlength :: proc(str: string, n: uint) -> uint {
    return utf8nlen(raw_data(str), n)
}

ncasecmp :: proc(src1: string, src2: string, n: uint) -> bool {
    if utf8ncasecmp(raw_data(src1), raw_data(src2), n) == 0 {
        return true
    }
    return false
}

ncat :: proc(dst: []u8, src: string, n: uint) -> string {
    return string(cstring(utf8ncat(raw_data(dst), raw_data(src), n)))
}

ncmp :: proc(src1: string, src2: string, n: uint) -> bool {
    if utf8ncmp(raw_data(src1), raw_data(src2), n) == 0 {
        return true
    }
    return false
}

ncpy :: proc(dst: []u8, src: string, n: uint) -> string {
    return string(cstring(utf8ncpy(raw_data(dst), raw_data(src), n)))
}

pbrk :: proc(str: string, accept: string) -> string {
    return string(cstring(utf8pbrk(raw_data(str), raw_data(accept))))
}

rchr :: proc(src: string, chr: rune) -> string {
    return string(cstring(utf8rchr(raw_data(src), i32(chr))))
}

size :: proc(str: string) -> uint {
    return utf8size(raw_data(str))
}

size_lazy :: proc(str: string) -> uint {
    return utf8size_lazy(raw_data(str))   
}

nsize_lazy :: proc(str: string, n: uint) -> uint {
    return utf8nsize_lazy(raw_data(str), n)
}

spn :: proc(src: string, accept: string) -> uint {
    return utf8spn(raw_data(src), raw_data(accept))
}

str :: proc(haystack: string, needle: string) -> string {
    return string(cstring(utf8str(raw_data(haystack), raw_data(needle))))
}

casestr :: proc(haystack: string, needle: string) -> string {
    return string(cstring(utf8casestr(raw_data(haystack), raw_data(needle))))
}

valid :: proc(str: string) -> (bool, string) {
    is_valid := utf8valid(raw_data(str))
    if uintptr(is_valid) == 0 {
        return true, ""
    }
    return false, string(cstring(is_valid))
}

nvalid :: proc(str: string, n: uint) -> (bool, string) {
    is_valid := utf8nvalid(raw_data(str), n)
    if uintptr(is_valid) == 0 {
        return true, ""
    }
    return false, string(cstring(is_valid))
}

makevalid :: proc(str: []u8, replacement: rune) -> bool {
    if utf8makevalid(raw_data(str), i32(replacement)) == 0 {
        return true
    }
    return false
}

codepoint :: proc(str: string, out_codepoint: ^rune) -> string {
    return string(cstring(utf8codepoint(raw_data(str), cast(^i32) (out_codepoint))))
}

rcodepoint :: proc(str: string, out_codepoint: ^rune) -> string {
    return string(cstring(utf8rcodepoint(raw_data(str), cast(^i32) (out_codepoint))))
}

codepointsize :: proc(chr: rune) -> uint {
    return utf8codepointsize(i32(chr))
}

catcodepoint :: proc(str: []u8, chr: rune, n: uint) -> string {
    return string(cstring(utf8catcodepoint(raw_data(str), i32(chr), n)))
}

islower :: proc(chr: rune) -> bool {
    if utf8islower(i32(chr)) == 0 {
        return false
    }
    return true
}

isupper :: proc(chr: rune) -> bool {
    if utf8isupper(i32(chr)) == 0 {
        return false
    }
    return true
}

lwr :: proc(str: []u8) {
    utf8lwr(raw_data(str))
}

upr :: proc(str: []u8) {
    utf8upr(raw_data(str))
}

lwrcodepoint :: proc(cp: rune) -> rune {
    return rune(utf8lwrcodepoint(i32(cp)))
}

uprcodepoint :: proc(cp: rune) -> rune {
    return rune(utf8uprcodepoint(i32(cp)))
}