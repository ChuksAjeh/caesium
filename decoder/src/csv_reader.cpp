//
// Created by chuks on 09/09/2026.
//

#include "caesium/decoder/csv_reader.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>


//This file reads csv files and outputs the data
void read_csv_file(const std::string& file_path)
{
    if (file_path.empty())
    {
        std::cerr << "Error: File path is empty." << '\n';
        return;
    }
    std::ifstream file(file_path);
    if (!file.is_open())
    {
        std::cerr << "Error: Unable to open file." << '\n';
        return;
    }

    std::string header_line;
    if (!std::getline(file, header_line))
    {
        std::cerr << "Error: File is empty, no header found." << '\n';
        return;
    }
    if (!header_line.empty() && header_line.back() == '\r') // strip CRLF line endings
    {
        header_line.pop_back();
    }

    std::vector<std::string> headers;
    std::stringstream header_stream(header_line);
    std::string column;
    while (std::getline(header_stream, column, ','))
    {
        headers.push_back(column);
    }

    for (const auto& header : headers)
    {
        std::cout << header << '\n';
    }
}
