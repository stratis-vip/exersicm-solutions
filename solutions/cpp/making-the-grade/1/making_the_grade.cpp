#include <array>
#include <string>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    // TODO: Implement round_down_scores
    std::vector<int> result;
    for (double d:student_scores)
        result.push_back(static_cast<int>(d));
    return result;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    // TODO: Implement count_failed_students
    int count{0};
    for (int s:student_scores)
        if (s <= 40) count++; 
    return count;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    // TODO: Implement letter_grades
    int interval = (highest_score - 40 ) / 4;
    std::array<int, 4> res;
    for (int i = 0; i != 4; ++i){
        res[i] = 41 + interval * i;
    }
    return res;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {
    // TODO: Implement student_ranking
    std::vector<std::string> result;
    for (std::size_t i =0; i != student_scores.size(); ++i)
        result.push_back(std::to_string(i + 1) + ". " + student_names[i] +
                         ": " + std::to_string(student_scores[i]));
    return result;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {
    // TODO: Implement perfect_score
    for (std::size_t i = 0; i != student_scores.size(); ++i)
        if (student_scores[i] == 100) return student_names[i];
    return "";
}
