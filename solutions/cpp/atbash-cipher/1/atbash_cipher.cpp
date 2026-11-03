#include "atbash_cipher.h"

#include <string>
#include <cctype>
#include <algorithm>

namespace atbash_cipher {



const std::string cipher="zyxwvutsrqponmlkjihgfedcba";
std::string abc = "abcdefghijklmnopqrstuvwxyz";

int get_index_from_abc(const char c){
    return (int)(std::tolower(c) - 'a');
}

int get_index_from_cipher (const char c){
    for (std::size_t i = 0; i!= cipher.size();++i)
    {
        if (cipher[i] == std::tolower(c)) {
            return i;
        }
    }
    return -1;
}

std::string clean_string(const std::string &s){
    std::string result{};
    for (char c:s){
        if (!std::ispunct(c) && !std::isspace(c)){
            result += c;
        }
    }
    return result;
}

std::string encode(const std::string &s){
    std::string result{}, clean_s{clean_string(s)};
    int count{0};
    for (char c:clean_s){
        if (count == 5) {
            result += ' ';
            count = 0;
        }
        
        if (std::isalpha(c)){           
            result += cipher[get_index_from_abc(c)];
        }else {
        result += c;
        }
        count++;
    }
    return result;
}

std::string decode(const std::string &s){
    std::string result{}, clean_s{clean_string(s)};
    
    for (char c:clean_s){
        if (std::isalpha(c)){
            result += abc[get_index_from_cipher(c)];
        }else {
        result += c;
        }
    }
    return result;
}
// TODO: add your solution here

}  // namespace atbash_cipher
