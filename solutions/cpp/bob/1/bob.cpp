#include "bob.h"
#include <string>
#include <cctype>

namespace bob {

// TODO: add your solution here
bool has_chars(const std::string &s) {
    if (s.empty()) return false;
    for (char c:s){
      if (std::isalpha(c)) {
          return true;
      }     
    }
    return false;
}
bool is_all_digits(const std::string &s){
    if (s.empty()) return false;
    for (char c:s){
        if (!std::ispunct(c) && !std::isspace(c)){
        if (!std::isdigit(c))
            return false;
        }
    }
    return true;
}  
    
bool is_all_caps (const std::string &s){
    if (s.empty()) return false;
    for (char c : s){
        if (!std::ispunct(c)){
            if (std::isalpha(c) && !std::isupper(c)) 
                return false;
        }
    }
    return true;
}

std::string rtrim(std::string s) {
    s.erase(std::find_if(s.rbegin(), s.rend(), [](unsigned char ch) {
        return !std::isspace(ch);
    }).base(), s.end());
    return s;
}
    
bool is_question(const std::string &s) {
    std::string s1 = rtrim(s);
    if (s1.empty()) return false;
    rtrim(s1);
    return s1[s1.size() -1] == '?';
}

bool is_empty (const std::string &s){
    std::string s1 = rtrim(s);
    if (s1.empty()) return true;
    for (char c:s1){
        if (!std::isspace(c)) return false;
    }
    return true;
}

std::string hey(const std::string &s){
     if (s.empty() || is_empty(s) ) {
            return "Fine. Be that way!";
        } 
    if (is_question(s)){
        if (is_all_caps(s) && !is_all_digits(s)) {
            return "Calm down, I know what I'm doing!";
        }
        else{
            return "Sure.";
        }
    } 
    if (is_all_digits(s) && !is_empty(s)){
        return "Whatever.";
    }
    if (is_all_caps(s)){
        return "Whoa, chill out!";
    }
    return "Whatever.";
}

}  // namespace bob
