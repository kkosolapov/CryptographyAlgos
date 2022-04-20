import Foundation

string key;
Vigenere(string key)

for (int i = 0; i < key.size(); ++i)
        {
            if (key[i] >= 'A' && key[i] <= 'Z')
                this->key += key[i];
            else if (key[i] >= 'a' && key[i] <= 'z')
                this->key += key[i] + 'A' - 'a';
        }
    }

string encrypt(string text)
    {
        string out;

        for (int i = 0, j = 0; i < text.length(); ++i)
        {
            char c = text[i];

            if (c >= 'a' && c <= 'z')
                c += 'A' - 'a';
            else if (c < 'A' || c > 'Z')
                continue;

            out += (c + key[j] - 2 * 'A') % 26 + 'A';
            j = (j + 1) % key.length();
        }

        return out;
    }
    string decrypt(string text)
    {
        string out;

        for (int i = 0, j = 0; i < text.length(); ++i)
        {
            char c = text[i];

            if (c >= 'a' && c <= 'z')
                c += 'A' - 'a';
            else if (c < 'A' || c > 'Z')
                continue;

            out += (c - key[j] + 26) % 26 + 'A';
            j = (j + 1) % key.length();
        }

        return out;
    }
};

var a, b;
print("Masukkan Plaintext : \n");
cin >> a;
print("Masukkan Key : \n");
cin >> b;
string original = a;
Vigenere chiper = b;
string encrypted = chiper.encrypt(original);
string decrypted = chiper.decrypt(encrypted);
cout << endl;
print("encrypted :")
print(encrypted)
print("\n");
print("decrypted :" )
print(decrypted)
print("\n");
