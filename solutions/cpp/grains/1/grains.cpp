#include "grains.h"

namespace grains {
    unsigned long long square(int num){
        if (num == 1) return 1;
        unsigned long long sum = 1;
        
        for (int i = 2; i < num+1; ++i)
            sum += sum;
        return sum;
    }
    unsigned long long total(){
        unsigned long long sum = 1;
        for (int i = 2; i < 65; ++i){
            sum += square(i);
        }
        return sum;
    }
}  // namespace grains
