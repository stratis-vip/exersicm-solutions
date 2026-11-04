#include "armstrong_numbers.h"

#include <string>
#include <cmath>
namespace armstrong_numbers {

// TODO: add your solution here
 bool is_armstrong_number(const int &n){
     if (n >=0 && n < 10) return true;
     if (n>=10 && n < 100) return false;
     const std::string number = std::to_string(n);        
     const int power = number.size();
     int result{0};
     for (std::size_t i = 0; i != number.size(); ++i){
         result += pow((int)(number[i] - '0'), power); 
     }
     return result == n;
 }
}  // namespace armstrong_numbers
