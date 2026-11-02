#include "difference_of_squares.h"

namespace difference_of_squares {
  unsigned square_of_sum (unsigned n) {
      unsigned sum{0};
      for (unsigned i =1; i != n+1; ++i){
          sum += i;
      }
      return sum * sum;
  }

  unsigned sum_of_squares (unsigned n) {      
      unsigned sum{0};        
      for (unsigned i =1; i != n+1; ++i){
          sum += i * i;
      }
      return sum;
  }

  unsigned difference(unsigned n) {
      return square_of_sum(n) - sum_of_squares(n);
  }
// TODO: add your solution here

}  // namespace difference_of_squares
