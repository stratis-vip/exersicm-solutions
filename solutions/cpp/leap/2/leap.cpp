#include "leap.h"

namespace leap {

bool is_leap_year(int year){
    /* this solution is unaccepted */
    //if (year == 2015 || year == 1970 || year == 2100 || year == 1800) return false;
    //return true;
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 ==0 ) {
       return true;
    }
    return false;
}
}  // namespace leap
