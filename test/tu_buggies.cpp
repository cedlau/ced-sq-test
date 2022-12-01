#include <gtest/gtest.h>

#include "../src/buggies.h"

TEST(TEST_buggies, init) {
    Buggy* buggy = new Buggy();
    EXPECT_TRUE(buggy != 0);
}
