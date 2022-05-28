import Foundation

func CaesarCipher(displacement: Int, input: String) -> String {
  var coded = "";

  for i in 0...input.length(){
    char currChar = input[i];
    if currChar >= 65 && currChar <= 90{
      currChar += displacement;
      if currChar > 90{
        currChar -= 26;
      }
    }else if currChar >= 97 && currChar <= 122{
      if displacement + currChar >= 128{
        currChar -= 26;
      }
      currChar += displacement;
      if currChar > 122{
        currChar -= 26;
      }
    }
    coded += currChar;
  }

  return coded;
}


var message;
var displace;

print("Please enter a message to be coded\n")
message = readline()
print("Please enter the displacement value between 0 and 25\n")
displace = readline()
if displace > 25 || displace < 0 {
   print("Displacement must be between 0 and 25\n")
} else{
   string coded = CaesarCipher(displace, message)
   print(\(message)
   print("\n")
   print(\(coded))
   print("\n");
}
