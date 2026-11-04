#pragma once
#include <string>
#include <unordered_set>
namespace allergies {

// TODO: add your solution here
  class allergy_test {
      public:
      allergy_test(int);
      
      bool is_allergic_to(const std::string &);
       
      std::unordered_set<std::string> get_allergies();
      
      private: 
      std::unordered_set<std::string> allergies {};
      unsigned allergy_number{0};
  };
}  // namespace allergies
