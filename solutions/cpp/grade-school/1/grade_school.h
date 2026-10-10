// file grade_school.h

#if !defined(GRADE_SCHOOL_H)
#define GRADE_SCHOOL_H
#include <string>
#include <vector>
#include <map>

namespace grade_school
{
  struct record
  {
    int grade;
    std::vector<std::string> names;
  };

  class school
  {
  public:
    void empty();
    std::map<int, std::vector<std::string>> roster() const;
    void add(const std::string &, int);
    std::vector<std::string> grade(const int) const;

  private:
    std::map<int, std::vector<std::string>> roster_data;
  };
} // namespace grade_school

#endif // GRADE_SCHOOL_H
