#include<bits/stdc++.h>
using namespace std;

map<char,int>mp;
map<int,char>rmp;
void initialize_maps(){
    for(int i=0;i<10;i++){
        mp['0'+i]=i;
    }
    mp['a']=10,mp['b']=11,mp['c']=12,mp['d']=13,mp['e']=14,mp['f']=15;

    for(int i=0;i<10;i++){
        rmp[i]=i+'0';
    }
    rmp[10]='a',rmp[11]='b',rmp[12]='c',rmp[13]='d',rmp[14]='e',rmp[15]='f';
}
string doxor(string s1,string s2){
    string res="";
    for(int i=0;i<s2.size();i++){
        int tres=(mp[s1[i]]^mp[s2[i]]);
        res+=rmp[tres];
    }
    return res;
}
string convert_hex_to_ascii(string hexInput){
     std::string asciiOutput = "";
    for (size_t i = 0; i < hexInput.length(); i += 2) {
        std::string hexByte = hexInput.substr(i, 2);
        char asciiChar = static_cast<char>(std::stoi(hexByte, nullptr, 16));
        asciiOutput += asciiChar;
    }
    return asciiOutput;
}
int main(){
    initialize_maps();
    string b1="48656c6c6c6f20576f726c64215f343066663262616630346637323739313431303766313638";
    string c1="5ae95331fa04fbd99915e8016667b19322830df38e1877a94222649d86226b27375bcde87f61";
    string c2="74e05e3aed2f94ebc05ffc5c7349d59211a30ec7a4090cc95c5026fafc456e4f4a589cb27e24";
                
    //we know in AES-128-OFB Ci=Vi xor Bi and Vi=Ek(Vi-1) and Bi= Ci xor Vi
    //first will find V1 by this command where K and iv was given 

    //now V1 can be found with Vi=Ek(Vi-1) for ex V2=Ek(V1)

    // similarly v2

    string temp=doxor(b1,c1);
    temp=doxor(temp,c2);
    // cout<<temp<<" ";
    cout<<convert_hex_to_ascii(temp);

    return 0;
}