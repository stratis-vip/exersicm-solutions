#if !defined(ALPHAMETICS_H)
#define ALPHAMETICS_H

#include <string>
#include <optional>
#include <map>
#include <vector>
#include <unordered_set>

namespace alphametics {

class Puzzle {
public:
	Puzzle(const std::string &);
	std::vector<std::string> get_words() const {
		return words;
	}
	std::vector<char> get_digits() const {
		return digits;
	}
	std::string get_equal() const {
		return equal;
	}
	int get_max_sum() const {
		return max_sum;
	}
	std::vector<char> get_no_zero_chars() const {
		return no_zero_chars;
	}
	std::vector<int> get_no_zero_chars_idx() const {
		return no_zero_chars_idx;
	}
	void print_equation();
	auto get_solution() const {return solution;}
	bool is_valid_solution(const std::vector<int> &);
	int get_digit_one_index () const {return digit_one_index;}

private:
	std::optional<std::map<char, int>> solution{std::nullopt};
	std::string puzzle_;
	std::vector<char> digits{};                 //sorted vector of unique chars in puzzle
	std::vector<std::string> words{};           //ALL words in puzzle
	std::vector<std::string> addends_words{};   //sorted vector ONLY of the addends from smaller to bigger
	// and then alphabetically
	std::string equal{};                        //the sum word
	int max_sum{0};                             // the biggest sum of all addends expressed as int
	std::vector<char> no_zero_chars{};
	std::vector<int> no_zero_chars_idx{};
	int digit_one_index{-1};


};


std::optional<std::map<char, int>> solve(const std::string &);

}  // namespace alphametics

#endif  // ALPHAMETICS_H
