// ERROR: FILE CORRUPTED. Please supply valid C++ Code.
#pragma once

#include <string>

namespace star_map {
    enum class System {
        BetaHydri,
        Sol,
        DeltaEridani,
        EpsilonEridani,
        AlphaCentauri,
        Omicron2Eridani
    };
}
namespace heaven {
   
    class Vessel {
        public:
        std::string name;
        int generation = 1;
        unsigned busters = 0;
        Vessel(const std::string &, const int &);
        Vessel(const std::string &, const int &, const star_map::System &);
        Vessel replicate(const std::string &) const;
        star_map::System current_system = star_map::System::Sol;
        
        bool shoot_buster();
        void make_buster();
        
        
    };

     std::string get_older_bob(const Vessel &, const Vessel &);
     bool in_the_same_system(const Vessel &, const Vessel &); 
}

