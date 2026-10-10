#include "darts.h"
#include <cmath>

namespace darts {

// TODO: add your solution here
  int score(double x, double y) {
        double distance = x * x + y * y;

        if (distance <= 1)   return 10;
        if (distance <= 25)  return 5;
        if (distance <= 100) return 1;

        return 0;
    }
      
}  // namespace darts
