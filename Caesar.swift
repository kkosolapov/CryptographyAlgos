import Foundation

struct CaesarCipher {
    
    static func main() throws {
        let text = readLine() ?? ""
        
        print(text.encode())
    }
}

extension String {
    static let alphabet = "abcdefghijklmnopqrstuvwxyz".map { "\($0)" }

	func encode() -> String {
	    return self
	    	.map { char in
	    		if let index = String.alphabet.firstIndex(of: "\(char)") {

    			return String.alphabet[(index + 1) % 26]
				}
				return "\(char)"
	    	}
	    	.joined(separator: "")
	}
}

try! CaesarCipher.main()
