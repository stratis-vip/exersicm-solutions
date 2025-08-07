#include "pangram.h"
#include <iostream>
#include <vector>

int get_char_value(char ch)
{
    return static_cast<int>(ch);
}

enum class char_type
{
    small,
    capital,
    number,
    punctuation,
    others
};

char_type get_type_of_char(char ch)
{
    int val = static_cast<int>(ch);
    if ((val == 32 || val == 34 || val == 46 || val == 63 || val == 95))
        return char_type::punctuation;
    if (val >= 48 && val <= 57)
        return char_type::number;
    if (val >= 65 && val <= 92)
        return char_type::capital;
    if (val >= 97 && val <= 122)
        return char_type::small;

    return char_type::others;
}

namespace pangram
{

    bool is_pangram(std::string str_to_check)
    {
        if (str_to_check.size() == 0)    // empty string
            return false;
        
        std::vector<int> smalls, caps;   // vectors with zeros  
        for (int i = 0; i != 25; ++i)
        {
            smalls.push_back(0);
            caps.push_back(0);
        }
        
        for (char ch : str_to_check)
        {
            char_type t = get_type_of_char(ch);
            if (t == char_type::others)
            {
                std::cout << ch << std::endl;
                return false;
            }

            // add a "1" if the letter exists
            if (t == char_type::small)  
            {
                smalls[static_cast<int>(ch) - 97] = 1;
            }
            else if (t == char_type::capital)
            {
                caps[static_cast<int>(ch) - 65] = 1;
            }
        }
        
        bool all_letters = true;
        for (int i = 0; i != 25; ++i)
        {
            if (smalls[i] == 0 && caps[i] == 0)
            {
                all_letters = false;
            }
        }

        return all_letters;
    }
} // namespace pangram
