#include<bits/stdc++.h>
using namespace std;
map<int,int>gaps;


void printMatTable(vector<vector<char>>& mat){
    cout<<"\n\nTable for this Vigenere cipher is:\n\n";
    for(int i=0;i<26;i++){
        for(int j=0;j<26;j++){
            cout<<mat[i][j]<<"   ";
        }
        cout<<endl;
    }
    cout<<"\n\n";
}
void generate(vector<vector<char>>& mat){
    int cnt=0;
    for(int i=0;i<26;i++){
        for(int j=0;j<26;j++){
            mat[i][j]=('A'+(cnt+j)%26);
        }
        cnt++;
    }
}

vector<string> findRepeatedSequences( string& text, int minLength, int maxLength) {
    std::vector<string> repeatedSequences;

    for (int length = minLength; length <= maxLength; length++) {
        map<string, int> sequenceCount;

        for (int i = 0; i <= text.length() - length; ++i) {
            std::string sequence = text.substr(i, length);
            sequenceCount[sequence]++;
        }

        for (const auto& entry : sequenceCount) {
            if (entry.second > 1) {
                repeatedSequences.push_back(entry.first);
            }
        }
    }
    return repeatedSequences;
}

std::vector<std::string>  checkForRepeated(string& message){
    int minLength = 3;
    int maxLength = 20;

    std::vector<std::string> repeatedSequences = findRepeatedSequences(message, minLength, maxLength);

    if (repeatedSequences.empty()) {
        cout << "\n\nNo repeated sequences found." << endl;
    } else {
        cout << "\n\nRepeated sequences found:" << endl;
        cout << "\n\nSequences \t Size:" <<endl;
        for (string& sequence : repeatedSequences) {
            cout << sequence <<"\t\t\t"<<sequence.size()<<endl;
        }
    }
    return repeatedSequences;
}

map<string,vector<int>> findDistancesBetweenSequences(std::vector<std::string> repeatedSequences, string& message ){
    map<string,vector<int>>mp;
    for(auto a:repeatedSequences){
        int sz=a.size();
        vector<int>distances;

        for(int i=0;i<message.size()-sz;i++){
            string temp = message.substr(i,sz);
            if(temp==a){
                distances.push_back(i);
            }
        }
        mp[a]=distances;
    }
    return mp;
}
void findgap(vector<int> arr){
    for(int i=1;i<arr.size();i++){
        cout<<arr[i]-arr[i-1]<<" ";
        gaps[arr[i]-arr[i-1]]++;
    }
}

void findMostCommonDivisorOfGaps(){
    map<int,int>mp;
    for(auto a:gaps){
        int n=a.first;
        for(int i=2;i<=(n);i++){
            if((n%i)==0){
                mp[i]++;
            }
        }
    }
    int mx=0;
    cout<<"\n\nNo. of common divisor of gaps\n";
    cout<<"\n\nSize of GAP \t\t count of such gaps\n";
    for(auto a:mp){
        mx=max(mx,a.second);
        if(a.first<=20)
            cout<<a.first<<"  "<<a.second<<"\n";
    }
    cout<<"\n\nMost common divisor among the found gaps size between repeating sequences:\n";
    for(auto a:mp){
        if(a.second==mx) cout<<a.first<<" \n\n";
    }
}
int main(){
    vector<vector<char>>mat(26,vector<char>(26));
    generate(mat); //generate the table for the vigenere cipher to look into
    printMatTable(mat); //prints the matrix table
    string message="CVJTNAFENMCDMKBXFSTKLHGSOJWHOFUISFYFBEXEINFIMAYSSDYYIJNPWTOKFRHWVWTZFXHLUYUMSGVDURBWBIVXFAFMYFYXPIGBHWIFHHOJBEXAUNFIYLJWDKNHGAOVBHHGVINAULZFOFUQCVFBYNFTYGMMSVGXCFZFOKQATUIFUFERQTEWZFOKMWOJYLNZBKSHOEBPNAYTFKNXLBVUAXCXUYYKYTFRHRCFUYCLUKTVGUFQBESWYSSWLBYFEFZVUWTRLLNGIZGBMSZKBTNTSLNNMDPMYMIUBVMTLOBJHHFWTJNAUFIZMBZLIVHMBSUWLBYFEUYFUFENBRVJVKOLLGTVUZUAOJNVUWTRLMBATZMFSSOJQXLFPKNAULJCIOYVDRYLUJMVMLVMUKBTNAMFPXXJPDYFIJFYUWSGVIUMBWSTUXMSSNYKYDJMCGASOUXBYSMCMEUNFJNAUFUYUMWSFJUKQWSVXXUVUFFBPWBCFYLWFDYGUKDRYLUJMFPXXEFZQXYHGFLACEBJBXQSTWIKNMORNXCJFAIBWWBKCMUKIVQTMNBCCTHLJYIGIMSYCFVMURMAYOBJUFVAUZINMATCYPBANKBXLWJJNXUJTWIKBATCIOYBPPZHLZJJZHLLVEYAIFPLLYIJIZMOUDPLLTHVEVUMBXPIBBMSNSCMCGONBHCKIVLXMGCRMXNZBKQHODESYTVGOUGTHAGRHRMHFREYIJIZGAUNFZIYZWOUYWQZPZMAYJFJIKOVFKBTNOPLFWHGUSYTLGNRHBZSOPMIYSLWIKBANYUOYAPWZXHVFUQAIATYYKYKPMCEYLIRNPCDMEIMFGWVBBMUPLHMLQJWUGSKQVUDZGSYCFBSWVCHZXFEXXXAQROLYXPIUKYHMPNAYFOFHXBSWVCHZXFEXXXAIRPXXGOVHHGGSVNHWSFJUKNZBESHOKIRFEXGUFVKOLVJNAYIVVMMCGOFZACKEVUMBATVHKIDMVXBHLIVWTJAUFFACKHCIKSFPKYQNWOLUMYVXYYKYAOYYPUKXFLMBQOFLACKPWZXHUFJYGZGSTYWZGSNBBWZIVMNZXFIYWXWBKBAYJFTIFYKIZMUIVZDINLFFUVRGSSBUGNGOPQAILIFOZBZFYUWHGIRHWCFIZMWYSUYMAUDMIYVYAWVNAYTFEYYCLPWBBMVZZHZUHMRWXCFUYYVIENFHPYSMKBTMOIZWAIXZFOLBSMCHHNOJKBMBATZXXJSSKNAULBJCLFWXDSUYKUCIOYJGFLMBWHFIWIXSFGXCZBMYMBWTRGXXSHXYKZGSDSLYDGNBXHAUJBTFDQCYTMWNPWHOFUISMIFFVXFSVFRNA";
    cout<<"\n\nCiphertext to be decrypted is given to us is as follows:\n\n"<<message<<endl;
    // std::ifstream inFile("mogambo.txt"); // Create an input file stream
    // if (!inFile) {cerr << "Error opening input file." << endl;return 1;}
    // string line; int count=0;
    // while (getline(inFile, line)) {
    //     cout << line << endl; // Print each line read from the file this is the message that has to be decrypted
    // }
    std::vector<std::string> repeatedSequences = checkForRepeated(message);
    map<string,vector<int>>distance;
    distance = findDistancesBetweenSequences(repeatedSequences,message);

    for(auto a:distance){
        cout<<a.first<<" ";
        for(auto x:a.second){
            cout<<x<<" ";
        }
        cout<<"\t\tThe distance between consecutive gaps are:";
        findgap(a.second);
        cout<<endl;
    }
    cout<<"\n\n";
    for(auto a:gaps){
        cout<<a.first<<"\t"<<a.second<<"\n";
    }
    findMostCommonDivisorOfGaps();
    //Once the keyword length is known, the following observation of Babbage and Kasiski comes into play. If the keyword is N letters long, then every Nth letter must have been enciphered using the same letter of the keytext. Grouping every Nth letter together, the analyst has N "messages", each encrypted using a one-alphabet substitution, and each piece can then be attacked using frequency analysis.
    int n=6;

    cout<<"\n\nfor n=6 Columnwise nth character of the cipher message\n";
    vector<string>toDecode(n,"");
    for(int i=0;i<message.size();i++){
        
        toDecode[i%n]+=message[i];
    }
    for(int i=0;i<toDecode.size();i++){
        cout<<(i+1)<<"\t";
        cout<<toDecode[i]<<"\n\n";
    }


    //decrypting the cipher message
    string KEY="BRUTUS";
    string decipheredMessage="";
    int pos=0;
    for (int i = 0; i < message.size(); i++) {
        int row=KEY[pos % 6] - 'A';
        int col;
        char cipher=message[i];
        for(int j=0;j<26;j++){
            if(mat[row][j]==cipher){
                col=j;
                break;
            }
        }
        decipheredMessage += 'A' + col;
        pos++;
    }
    cout<<"\nKEY is \n\n"<<KEY<<endl;
    cout<<"\nFinal Deciphered message:\n\n"<<decipheredMessage<<endl;
    return 0;
}