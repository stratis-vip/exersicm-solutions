#include "reverse_string.h"

namespace reverse_string {

  std::string reverse_string(std::string the_string) {
    std::string temp = "";
    int count = 0, size = the_string.size();

    for (int i=0; i != size; ++i) {
      temp += "";
    }

    for (char c:the_string){
      temp[size - count] = c;
      ++count;
    }
    return temp;
  }
}  // namespace reverse_string
