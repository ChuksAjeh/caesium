//
// Created by chuks on 09/09/2026.
//

#include <gtest/gtest.h>
#include "caesium/decoder/csv_reader.h"

TEST(CsvReader, OpensCleanFixture) {
    CSVReader reader;
    testing::internal::CaptureStdout();
    reader.read_csv_file(FIXTURES_DIR "/ticks_clean.csv");
    EXPECT_FALSE(testing::internal::GetCapturedStdout().empty());
}