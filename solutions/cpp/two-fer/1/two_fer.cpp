#include "two_fer.h"

namespace two_fer
{
std::string two_fer(std::string name){
    std::string result = "One for ";
    if (name.size() != 0){
        result += name;
    } else {
        result += "you";
    }
    result += ", one for me.";
    return result;
}
    // std::string two_fer(const std::string name = ""){
    //     if (name.size() == 0) {}
    //     return "One for you, one for me.";
    // }
} // namespace two_fer

