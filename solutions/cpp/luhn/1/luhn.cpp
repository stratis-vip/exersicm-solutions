#include "luhn.h"

namespace luhn {
unsigned short char_to_int(char ch) {
    return (unsigned short)(ch - '0');
}

char int_to_char(int n) {
    return (char)(n + '0');
}

struct valid_string {
    std::string str;
    bool valid;
};

valid_string clean_string(const std::string & s){
    valid_string result{"", true};
    for (char c:s){
        if (std::isdigit(c)) {
            result.str += c;
        } else if (!std::isspace(c)){
            result.valid = false;
        }
        
    }
    return result;
}
  
bool is_valid_code (const std::string &s){
    if (s.size() < 2) return false;
    for (char c:s){
        if (!std::isdigit(c)) return false;
    }
    return true;
}
  
bool valid(const std::string &number){
    if (!std::isdigit(number[number.size() -1])) return false;

    valid_string num_struct = clean_string(number);
    
    std::string num = num_struct.str;
    if (!num_struct.valid || !is_valid_code(num) ) return false;
    std::reverse(num.begin(), num.end());
    int total{0};
    for (std::size_t i = 0; i != num.size(); ++i){
        unsigned dl = char_to_int(num[i]);
        if (i % 2 != 0) {
            dl *= 2;
     
            if (dl > 9) {
                dl -= 9;
            }
            num[i] = int_to_char(dl);
        }
        total += dl;
    }
    return total % 10 == 0; 
}
// TODO: add your solution here

}  // namespace luhn
