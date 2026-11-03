#include "rotational_cipher.h"

#include <string>
#include <cctype>

namespace rotational_cipher {

// TODO: add your solution here
char find_char(const char &c, int step){
    int deno = 122;
    int start = 96;
    if (std::isupper(c)){
        deno = 90;
        start = 64;
    }
    int new_c = (int)(c) + step;
    if (new_c > deno){
        new_c = start + (new_c % deno);
    }
    return (char)(new_c);    
}
    
std::string rotate(const std::string &s, const int &steps){
    std::string result{};
    for (char c:s){
        if (std::isalpha(c)){
            result += find_char(c, steps);
        }else {
            result += c;
        }
    }
    return result;
}
}  // namespace rotational_cipher
