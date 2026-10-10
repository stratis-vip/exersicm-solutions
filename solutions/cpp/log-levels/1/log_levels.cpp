#include <string>

namespace log_line {
std::string message(std::string line) {
    auto pos = line.find(" ");
    return line.substr(pos+1, line.size() -1);
    // return the message
}

std::string log_level(std::string line) {
    // return the log level
    auto start = line.find("[");
    auto end = line.find("]");
    return line.substr(start+1, end-1);
    return line;
}

std::string reformat(std::string line) {
    // return the reformatted message
    std::string level = log_level(line);
    auto msg = message(line);
    return msg + " (" + level + ")";
}
}  // namespace log_line
