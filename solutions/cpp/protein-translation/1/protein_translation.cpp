#include "protein_translation.h"
#include <string>
#include <vector>
#include <map>
#include <algorithm>

using std::string;
using std::vector;
using std::map;

namespace protein_translation {

map<string, string> proteins_map = {{"AUG", "Methionine"},
                                    {"UUU", "Phenylalanine"},
                                    {"UUC", "Phenylalanine"},
                                    {"UUA", "Leucine"},
                                    {"UUG",	"Leucine"},
                                    {"UCU", "Serine"},
                                    {"UCC", "Serine"},
                                    {"UCA", "Serine"},
                                    {"UCG",	"Serine"},
                                    {"UAU", "Tyrosine"},
                                    {"UAC",	"Tyrosine"},
                                    {"UGU", "Cysteine"},
                                    {"UGC",	"Cysteine"},
                                    {"UGG",	"Tryptophan"}};
vector<string> stop = {"UAA", "UAG", "UGA"};
    
bool is_stop(const string &amino){
    auto found = std::find(stop.begin(), stop.end(), amino);
    return found != stop.end();
}    

vector<string> get_proteins(const string &p){
    if (p.empty()) return {};

    vector<string> result{};
    string protein{};
    for (char c:p){
        protein += c;
        if (protein.size() == 3){
            result.push_back(protein);
            protein = "";
        }
    }
    return result;
}
    
// TODO: add your solution here
vector<string> proteins(const string &s){
    if (s.empty()) return {};
    vector<string> result;
    vector<string> codons = get_proteins(s);

    for (auto codon:codons){
        if (is_stop(codon)) {
            break;
        }
        auto found = proteins_map.find(codon);
        if (found != proteins_map.end()){
            result.push_back(found->second);
        }
    }
    return result;
}
}  // namespace protein_translation
