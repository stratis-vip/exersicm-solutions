#include "alphametics.h"
#include <algorithm>
#include <array>
#include <cstddef>
#include <map>
#include <optional>
#include <set>
#include <string>
#include <vector>
#include <stdexcept>
#include <cmath>

using std::vector;
using std::string;

vector<string> split_strings(const string & s,
                             const std::unordered_set<char> & delimeters = {' ', '+', '='}) {
	if (s.empty()) return {};
	vector<string> result{};
	string word{};
	for (char c:s) {
		if ((delimeters.find(c) != delimeters.end())) {
			word += c;
		} else {
			if (!word.empty()) {
				result.push_back(word);
				word = "";
			}
		}
	}
	if (!word.empty())
		result.push_back(word);
	return result;
}

vector<char> extract_chars(vector<string> words) {
	if (words.empty()) return {};
	std::unordered_set<char> result;
	for (string word:words) {
		for (char c:word) {
			if (std::isalpha(c)) {
				result.insert(c);
			}
		}
	}
	vector<char> sorted_vector_result{vector<char>(result.begin(), result.end())};
	std::sort(sorted_vector_result.begin(), sorted_vector_result.end());
	return sorted_vector_result;
}

namespace alphametics {

namespace {

std::vector<std::string> split_words(const std::string& s) {
    std::vector<std::string> out;
    std::string word;
    for (char c : s) {
        if (std::isalpha(static_cast<unsigned char>(c))) {
            word += c;
        } else if (!word.empty()) {
            out.push_back(std::move(word));
            word.clear();
        }
    }
    if (!word.empty()) out.push_back(std::move(word));
    return out;
}

}  // namespace

std::optional<std::map<char, int>> solve(const std::string& puzzle) {
    const auto words = split_words(puzzle);       // last word is the sum
    if (words.size() < 2) return std::nullopt;

    // weight[c] = (place values of c in addends) - (place values of c in sum)
    std::map<char, long long> weight;
    std::set<char> nonzero;
    for (std::size_t w = 0; w < words.size(); ++w) {
        const long long sign = (w + 1 == words.size()) ? -1 : 1;
        long long place = 1;
        for (auto it = words[w].rbegin(); it != words[w].rend(); ++it, place *= 10)
            weight[*it] += sign * place;
        if (words[w].size() > 1) nonzero.insert(words[w].front());
    }
    if (weight.size() > 10) return std::nullopt;

    std::vector<char> letters;
    std::vector<long long> w;
    std::vector<bool> no_zero;
    for (const auto& [ch, wt] : weight) {
        letters.push_back(ch);
        w.push_back(wt);
        no_zero.push_back(nonzero.find(ch) != nonzero.end());
    }

    std::array<int, 10> value{};
    std::array<bool, 10> used{};

    auto dfs = [&](auto&& self, std::size_t i, long long sum) -> bool {
        if (i == letters.size()) return sum == 0;
        for (int d = no_zero[i] ? 1 : 0; d < 10; ++d) {
            if (used[d]) continue;
            used[d] = true;
            value[i] = d;
            if (self(self, i + 1, sum + w[i] * d)) return true;
            used[d] = false;
        }
        return false;
    };

    if (!dfs(dfs, 0, 0)) return std::nullopt;

    std::map<char, int> result;
    for (std::size_t i = 0; i < letters.size(); ++i) result[letters[i]] = value[i];
    return result;
}

int calculate_max_sum (const int len){
    return stoi("1" + string(len-1,'9') + "8");
}

Puzzle::Puzzle(const std::string &puzzle) : puzzle_(puzzle) {
	// 1. Διορθώθηκε: split και εξαγωγή χαρακτήρων από το σωστό string
	auto wds = split_strings(puzzle_);
	if (wds.empty()) {
		equal = "";
		return;
	}

	equal = wds[wds.size() - 1];
	words = wds; // Αρχικοποίηση του words νωρίς για να είναι ασφαλές

	// Έλεγχος 1: Καμία λέξη μεγαλύτερη από το άθροισμα
	for (const std::string &word : words) {
		if (word.size() > equal.size()) {
			throw std::runtime_error("word is longer than allowed!");
		}
	}

	addends_words.assign(words.begin(), words.end() - 1);
	
	int max_addend_size{};
	for (string addend:addends_words){
	    if (addend.size() > static_cast<std::size_t>(max_addend_size)){
	        max_addend_size = addend.size();
	    }
	}
	max_sum = calculate_max_sum(max_addend_size);

	// Έλεγχος 2: Μέχρι 10 μοναδικοί χαρακτήρες
	digits = extract_chars(words); // Το digits περιέχει πλέον όλους τους μοναδικούς χαρακτήρες
	if (digits.size() > 10) {
		throw std::runtime_error("characters must be no more than 10!");
	}

	auto it = std::find(digits.begin(), digits.end(), equal[0]);
	
	
	digit_one_index = it - digits.begin();


	for (string word:addends_words) {
		if (equal.size() <= word.size()) {
			digit_one_index = -1;
		}
	}


	// 2. Διορθώθηκε: Ασφαλής εντοπισμός των leading letters (που δεν μπορούν να είναι 0)
	for (const std::string &word : words) {
		if (word.empty()) continue;

		char leading_char = word[0];

		// Ελέγχουμε αν τον έχουμε ήδη καταγράψει στα no_zero_chars
		auto it = std::find(no_zero_chars.begin(), no_zero_chars.end(), leading_char);

		if (it == no_zero_chars.end()) {
			no_zero_chars.push_back(leading_char);

			// Βρίσκουμε τη θέση (index) αυτού του χαρακτήρα μέσα στο vector 'digits'
			auto digits_it = std::find(digits.begin(), digits.end(), leading_char);
			if (digits_it != digits.end()) {
				no_zero_chars_idx.push_back(digits_it - digits.begin());
			}
		}
	}
}


void Puzzle::print_equation() {
	//not needed here
}

int calculate_int_value(std::map<char, int> &dmap, const string &s) {
	int result{0};
	for (std::size_t i = 0; i != s.size(); ++i ) {
		auto ch_int = dmap.find(s[s.size() - (i +1)]);
		result += ch_int->second * std::pow(10, i);

	}
	return result;
}



bool Puzzle::is_valid_solution(const vector<int> & digits_int)  {
	std::map<char, int> dmap{};
	for (std::size_t d=0; d!=digits.size(); ++d) {
		dmap.insert({digits[d],digits_int[d]});

	}
	vector<int> addends{};
	int equal_value = calculate_int_value(dmap, equal);
	if (equal_value > max_sum) return false;
	
	int value{0};
	for (string addend:addends_words) {
		value += calculate_int_value(dmap, addend);
	}

	if (value == equal_value) {
		solution = dmap;
		return true;

	}

	return false;
}


// TODO: add your solution here

}  // namespace alphametics
