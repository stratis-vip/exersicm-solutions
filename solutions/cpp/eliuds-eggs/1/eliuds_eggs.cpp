#include "eliuds_eggs.h"
#include <string>
#include <algorithm>

namespace chicken_coop {

// TODO: add your solution here
std::string dec_to_bin(int n){
    std::string result{};
    while (n > 0 ){
        int bit = n % 2;
        result.push_back('0' + bit);
        n /= 2;
    }
    std::reverse(result.begin(), result.end());
    return result;
}

int count_one(const std::string &bin){
    int result{0};
    for (char c:bin){
        if (c=='1') ++result;
    }
    return result;
}

int positions_to_quantity(int egg){
    if (egg == 0) return 0;
    return count_one(dec_to_bin(egg));
}
    
}  // namespace chicken_coop
