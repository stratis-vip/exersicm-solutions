#include "triangle.h"
#include <stdexcept>

namespace triangle {
   flavor kind(double a, double b, double c){
       if (a <= 0 || b <= 0  || c <= 0) throw std::domain_error("error");
       if (a+b < c || a + c <  b || b +c < a ) throw std::domain_error("error");
       if (a == b && b == c){
           return flavor::equilateral;
       } else if (a == b || a == c || b == c ){
           return flavor::isosceles;
       }
       
       return flavor::scalene;
   }
    
}  // namespace triangle
