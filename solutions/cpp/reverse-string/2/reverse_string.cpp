#include "reverse_string.h"
#include <iostream>

namespace reverse_string {

  std::string reverse_string(std::string the_string) {
    std::string temp = "";
    int count = 1, size = the_string.size();

    for (int i=0; i != size; ++i) {
      temp += " ";
    }
    for (char c:the_string){
      temp[size - count] = c;
      ++count;
    }
    return temp;
  }
}  // namespace reverse_string
