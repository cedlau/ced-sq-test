#include <gtest/gtest.h>

#include "../src/buggies.h"
#include "../src/utils.h"

TEST(TEST_buggies, init) {
    Buggy* buggy = new Buggy();
    EXPECT_TRUE(buggy != 0);
}


TEST(TEST_utils, PrintText_Comment) {
    PrintText("#coucou");
}