#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <fstream>
#include <iostream>
#include <bits/stdc++.h>

using namespace std;

int main(){

    std::ifstream inFile("mogambo.txt"); // Create an input file stream

    if (!inFile) {cerr << "Error opening input file." << endl;return 1;}

    string line;
    cout<<"Given Ciphertext is this:\n\n";
    while (getline(inFile, line)) {
        cout << line << endl; // Print each line read from the file
    }

    // ofstream outFile("output.txt"); // Create an output file stream

    // if (!outFile) {cerr << "Error opening output file." << endl;return 1;}

    cout<<"\n\nCipher is decrypted, Check output file\n";
    // outFile << "Hello, this is some content written to the file!" << endl;

    // outFile.close(); // Close the output file stream


    inFile.close(); // Close the input file stream
    return 0;
}