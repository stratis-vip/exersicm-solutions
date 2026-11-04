#include "doctor_data.h"

namespace heaven {
    Vessel::Vessel(const std::string & name, const int &generation) : name(name), generation(generation) {};
    Vessel::Vessel(const std::string & name, const int &generation, const star_map::System & system) : name(name), generation(generation), current_system(system) {};
   Vessel Vessel::replicate(const std::string & new_name) const {
        return Vessel(new_name, generation + 1, current_system);
    }

      // Φτιάχνει ένα buster (αυξάνει τον μετρητή)
    void Vessel::make_buster() {
        busters++;
    }

    // Ρίχνει ένα buster αν υπάρχει διαθέσιμο
    bool Vessel::shoot_buster() {
        if (busters > 0) {
            busters--;
            return true;
        }
        return false;
    }

    // Επιστρέφει το όνομα του σκάφους με τη μικρότερη γενιά (παλαιότερο)
    std::string get_older_bob(const Vessel& v1, const Vessel& v2) {
        if (v1.generation < v2.generation) {
            return v1.name;
        }
        return v2.name;
    }

    // Ελέγχει αν δύο σκάφη βρίσκονται στο ίδιο σύστημα
    bool in_the_same_system(const Vessel& v1, const Vessel& v2) {
        return v1.current_system == v2.current_system;
    }

}
