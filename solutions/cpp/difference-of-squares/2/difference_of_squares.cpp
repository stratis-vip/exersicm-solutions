#include "difference_of_squares.h"

namespace difference_of_squares {
  unsigned square_of_sum (unsigned n) {
      unsigned sum = n * (n + 1) / 2;
      return sum * sum;
  }

  unsigned sum_of_squares (unsigned n) {      
      return n * (n + 1) * (2*n +1) / 6;        
  }

  unsigned difference(unsigned n) {
      return square_of_sum(n) - sum_of_squares(n);
  }
// TODO: add your solution here

}  // namespace difference_of_squares
