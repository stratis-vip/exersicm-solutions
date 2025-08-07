#if !defined(SPACE_AGE_H)
#define SPACE_AGE_H

namespace space_age {
   constexpr double YEAR_ON_EARTH = 31557600;

    class space_age {
    public: 
        space_age(long seconds);
        long seconds() const {
            return secs;
        };
        double on_earth() const {
            return age_on_earth;
        }
        double on_mercury() const {
            return age_on_earth / 0.2408467;
        }
        double on_venus() const {
            return age_on_earth / 0.61519726;
        }
        double on_mars() const {
            return age_on_earth / 1.8808158;
        }
        double on_jupiter() const {
            return age_on_earth / 11.862615;
        }
        double on_saturn() const {
            return age_on_earth / 29.447498;
        }
        double on_uranus() const {
            return age_on_earth / 84.016846;
        }
        double on_neptune() const {
            return age_on_earth / 164.79132;
        }
    private:
        long secs = 0;
        double age_on_earth = 0;
   };
}  // namespace space_age

#endif // SPACE_AGE_H