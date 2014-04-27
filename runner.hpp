#pragma once

#include <functional>
#include <string>

class Runner {
public:
    Runner(std::string task, std::function<void()> test):
        m_test(test),
        m_task(task) {}

    bool run() {
        try {
            m_test();
        } catch(std::runtime_error& e) {
            return false;
        }
        return true;
    }

private:
    std::function<void()> m_test;
    std::string m_task;
};
