// Compile with: g++ -std=c++11 -o runner examples/case.cpp
// Run with ./runner

#include "../utest.hpp"
#include <vector>

uTest() {
    test([]{
        Warn(1 == 2);
        Warn(1 == 1);
    });

    test([&]{
        std::vector<int> vec;
        Assert(vec.empty());

        vec.push_back(1);
        vec.push_back(2);

        Assert(vec.size() == 2);
        Assert(vec[0] == 1 && vec[1] == 2);
        Assert(vec.size() > 2);
    });
}
