#include "hexadecimal.h"
#include <string>
#include <cctype>

namespace hexadecimal {

// TODO: add your solution here
int pow16 (const int exponent){
    int count{exponent}, result {1};
    while (count > 0){
        result *= 16;
        count--;
    }
    return result;
}

int get_number (const char &c){
   char ch = std::tolower(c);
   //handle A to F
   if (ch >= 97 && ch <= 102){
       return (int)ch - 'a' + 10;
   } else 
   //handle 0 to 9
   if (ch >= 48 && ch <= 57){
       return (int)ch - '0';
   }
   return -1; //no dexadecimal digit
}

int convert(const std::string &hex){
    std::size_t len{hex.size()};
    int result{0};
    for (size_t i = 0; i != len; ++i){
        int chr_value = get_number(hex[len - (i+1)]);
        if (chr_value < 0) return 0;
        result += chr_value * pow16(i);
    }
    return result;
}
}  // namespace hexadecimal
