#pragma once

#include <functional>
#include <iostream>
#include <map>
#include <string>
#include <string>
#include <tuple>
#include <vector>

namespace Color {
const std::string DEFAULT = "\033[0m";
const std::string BOLD = "\033[1m";
const std::string UNDERLINE = "\033[4m";
const std::string BLACK = "\033[30m";
const std::string RED = "\033[31m";
const std::string GREEN = "\033[32m";
const std::string YELLOW = "\033[33m";
const std::string BLUE = "\033[34m";
const std::string MAGENTA = "\033[35m";
const std::string CYAN = "\033[36m";
const std::string WHITE = "\033[37m";
const std::string BACKGROUND_BLACK = "\033[40m";
const std::string BACKGROUND_RED = "\033[41m";
const std::string BACKGROUND_GREEN = "\033[42m";
const std::string BACKGROUND_YELLOW = "\033[43m";
const std::string BACKGROUND_BLUE = "\033[44m";
const std::string BACKGROUND_MAGENTA = "\033[45m";
const std::string BACKGROUND_CYAN = "\033[46m";
const std::string BACKGROUND_WHITE = "\033[47m";
}

namespace Info {
const std::string WARN_TEXT = Color::YELLOW + "Warning " + Color::DEFAULT;
const std::string ASSERT_TEXT = Color::RED + "Failure " + Color::DEFAULT;
const std::string LEFT_NOTIFY = Color::WHITE + " » " + Color::DEFAULT;
const std::string RIGHT_NOTIFY = Color::WHITE + " «" + Color::DEFAULT;
const std::string LEFT_WARN = Color::YELLOW + " » " + Color::DEFAULT;
const std::string RIGHT_WARN = Color::YELLOW + " «" + Color::DEFAULT;
const std::string LEFT_FAIL = Color::RED + " » " + Color::DEFAULT;
const std::string RIGHT_FAIL = Color::RED + " «" + Color::DEFAULT;
const std::string TOTAL_SUCCESS = Color::GREEN + "SUCCESS" + Color::DEFAULT;
const std::string TOTAL_WARNING = Color::YELLOW + "WARNING" + Color::DEFAULT;
const std::string TOTAL_FAILURE = Color::BOLD + Color::RED + "FAILURE" + Color::DEFAULT;
const std::string SEPARATOR = Color::GREEN + " - " + Color::DEFAULT;
} // namespace Info

