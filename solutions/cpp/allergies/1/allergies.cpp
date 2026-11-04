#include "allergies.h"
#include <string>
#include <unordered_set>
#include <vector>
    
struct allergy {
    std::string name;
    int value;
};

namespace allergies {

    const std::vector<allergy> all_allergies= {
    {"eggs", 1},
    {"peanuts", 2},
    {"shellfish", 4},
    {"strawberries", 8},
    {"tomatoes", 16},
    {"chocolate", 32},
    {"pollen", 64},
    {"cats", 128}
}; 
    
    allergy_test::allergy_test(int n) :allergy_number(n){
        if (n>= 0)
          get_allergies();
      }
   
    bool allergy_test::is_allergic_to(const std::string &s){
        if (allergy_number == 0 ) return false;
        if (s.empty()) return false; 
        return allergies.find(s) != allergies.end();
        
    }
    
    std::unordered_set<std::string>   
    allergy_test::get_allergies() {
        for (const auto& alg : all_allergies) {
        if ((allergy_number & alg.value) != 0) {
            allergies.insert(alg.name);
        }
    }
        return allergies;}
      
// TODO: add your solution here

}  // namespace allergies
