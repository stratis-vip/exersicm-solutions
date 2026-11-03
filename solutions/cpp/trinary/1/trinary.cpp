#include "trinary.h"
#include <string>

namespace trinary {
int pow3 (const int exponent){
    int count{exponent}, result {1};
    while (count > 0){
        result *= 3;
        count--;
    }
    return result;
}
    
int get_number (const char &c){
    switch (c){
        case '0': return 0;
        case '1': return 1;
        case '2': return 2;
        default: return -1;
    }
}
// TODO: add your solution here
int to_decimal(const std::string &tri){
        std::size_t len{tri.size()};
    int result{0};
    for (std::size_t i = 0; i != len; ++i){
        int chr_value = get_number(tri[len - (i+1)]);
        if (chr_value < 0) return 0;
        result += chr_value * pow3(i);
    }
    return result;
}
}  // namespace trinary
