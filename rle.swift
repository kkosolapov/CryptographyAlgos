//Compression

extension Data {
    public func compressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count
            while ptr < end { 						//1
                var count = 0
                var byte = ptr.pointee
                var next = byte

                while next == byte && ptr < end && count < 64 { //2
                    ptr = ptr.advanced(by: 1)
                    next = ptr.pointee
                    count += 1
                }

                if count > 1 || byte >= 192 {       // 3
                    var size = 191 + UInt8(count)
                    data.append(&size, count: 1)
                    data.append(&byte, count: 1)
                } else {                            // 4
                    data.append(&byte, count: 1)
                }
            }
        }
        return data
    }
  
let originalString = "aaaaabbbcdeeeeeeef"
let utf8 = originalString.data(using: String.Encoding.utf8)!
let compressed = utf8.compressRLE()
  
public func decompressRLE() -> Data {
        var data = Data()
        self.withUnsafeBytes { (uPtr: UnsafePointer<UInt8>) in
            var ptr = uPtr
            let end = ptr + count

            while ptr < end {
                // Read the next byte. This is either a single value less than 192,
                // or the start of a byte run.
                var byte = ptr.pointee							// 1
                ptr = ptr.advanced(by: 1)

                if byte < 192 {                     // 2
                    data.append(&byte, count: 1)
                } else if ptr < end {               // 3
                    // Read the actual data value.
                    var value = ptr.pointee
                    ptr = ptr.advanced(by: 1)

                    // And write it out repeatedly.
                    for _ in 0 ..< byte - 191 {
                        data.append(&value, count: 1)
                    }
                }
            }
        }
        return data
    }

let decompressed = compressed.decompressRLE()
let restoredString = String(data: decompressed, encoding: NSUTF8StringEncoding)
