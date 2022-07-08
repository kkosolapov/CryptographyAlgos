func caesarCipher(string: String, shift: Int) -> String {
    var result = ""
    for char in string{
        let ascii = char.asciiValue
        if ascii == nil {
            result.append(char)
        } else {
            let newAscii = Int(ascii!) + shift
            if newAscii > 127 {
                result.append(Character(UnicodeScalar(newAscii - 127)!))
            } else {
                result.append(Character(UnicodeScalar(newAscii)!))
            }
        }
    }
    return result
}

caesarCipher(string: "Hello World!", shift: 3)
