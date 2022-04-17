#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

string CaesarCipher(int displacement, string &input);

int main(int argc, const char* argv[]){
  string message;
  int displace;

  cout << "Please enter a message to be coded." << endl;
  cin >> message;
  cout << "Please enter the displacement value between 0 and 25." << endl;
  cin >> displace;

  if(displace > 25 || displace < 0){
    cout << "Displacement must be between 0 and 25" << endl;
  }else{
    string coded = CaesarCipher(displace, message);
    cout << message << "\n" << coded << "\nend\n";
  }

  return 0;
}

string CaesarCipher(int displacement, string &input){
  string coded = "";

  for(int i = 0; i < input.length(); i++){
    char currChar = input[i];
    if(currChar >= 65 && currChar <= 90){
      currChar += displacement;
      if(currChar > 90){
        currChar -= 26;
      }
    }else if(currChar >= 97 && currChar <= 122){
      if(displacement + currChar >= 128){
        currChar -= 26;
      }
      currChar += displacement;
      if(currChar > 122){
        currChar -= 26;
      }
    }
    coded += currChar;
  }


  return coded;
}
