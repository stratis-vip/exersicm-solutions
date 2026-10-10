// file grade_school.cpp

#include "grade_school.h"
#include <iostream>
#include <map>

namespace grade_school
{
    void school::empty()
    {
        roster_data.clear();
    }

    std::map<int, std::vector<std::string>> school::roster() const
    {
        return roster_data;
    }

    bool value_exists(const std::map<int, std::vector<std::string>> &m,
                      const std::vector<std::string> &v1)
    {
        for (const auto &[k, v] : m)
        {
            if (v == v1)
                return true;
        }
        return false;
    }
    void school::add(const std::string &name, int grade)
    {
        // 1. Υπάρχει ο μαθητής σε οποιοδήποτε grade; → αγνόησέ το
        for (const auto &[g, names] : roster_data)
        {
            if (std::find(names.begin(), names.end(), name) != names.end())
                return;
        }

        // 2. Πρόσθεσέ τον στο σωστό grade, ταξινομημένα
        auto &v = roster_data[grade];
        auto it = std::upper_bound(v.begin(), v.end(), name);
        v.insert(it, name);
    }

    std::vector<std::string> school::grade(const int gr) const
    {
        auto it = roster_data.find(gr);
        if (it != roster_data.end())
        {
            return it->second;
        }
        else
        {
            return {};
        }
    }
} // namespace grade_school
