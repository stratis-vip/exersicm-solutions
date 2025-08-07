#include "space_age.h"

namespace space_age {

    space_age::space_age(long seconds){
        this->secs = seconds;
        this->age_on_earth = seconds / YEAR_ON_EARTH;
    }
}  // namespace space_age
