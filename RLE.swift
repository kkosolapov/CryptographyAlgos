func RLE (input: String) -> [(Int, Character)] {
    var result = [(Int, Character)]()

    input.forEach { char in
        if result.last?.1 == char {
            result[result.count - 1].0 += 1
        } else {
            result.append((1, char))
        }
    }
    
    return result
}
