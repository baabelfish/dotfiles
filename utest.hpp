#pragma once

#include "misc.hpp"
#include "runner.hpp"

static std::vector<Runner> _RUNNERS;

/**
 * @brief Adds a test to be run.
 *
 * @param f A function to run. Use assert-macros for testing.
 *
 */
void test(std::function<void()> f) {
    _RUNNERS.emplace_back("", f);
}

void _PRINTCON(std::string file, std::size_t line, std::string condition, std::string effect) {
    std::cout << "[" << file << "]" << ":" << line << ": \"" << Color::BOLD << Color::GREEN << condition << Color::DEFAULT << "\" -> " << effect << Color::DEFAULT << std::endl;
}

/**
 * @brief Stops when untrue.
 *
 * @param CONDITION Expression to test.
 *
 */
#define Assert(CONDITION)\
if (!(CONDITION)) {\
    _PRINTCON(__FILE__, __LINE__, (#CONDITION), Color::RED + Color::BOLD + "FAILURE");\
    throw std::runtime_error(#CONDITION);\
}

/**
 * @brief Prints a warning when untrue.
 *
 * @param CONDITION Expression to test.
 *
 * @return
 */
#define Warn(CONDITION)\
if (!(CONDITION)) {\
    _PRINTCON(__FILE__, __LINE__, (#CONDITION), Color::YELLOW + Color::BOLD + "WARNING");\
}

/**
 * @brief An initializer for the test. Only one per file.
 *
 */
#define uTest()\
void _INITIALIZE();\
int main() {\
    _INITIALIZE();\
    for (auto& x : _RUNNERS) {\
        if (!x.run()) return 1;\
    }\
    std::cout << std::endl;\
    return 0;\
}\
void _INITIALIZE()
