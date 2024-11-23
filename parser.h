#ifndef PARSER_H
#define PARSER_H

#include <string>
#include "Command.h"
#include <iostream>
#include <fstream>
#include <queue>
#include <map>

using namespace C;

namespace P
{

    class Parser
    {
        public:
            // the input file
            std::queue<std::string> instructions;

            std::map<std::string, Command> CommandMap;

            // current command
            std::string currentCommand;

            // constuctor will take in a source file
            Parser(std::string source);

            // has more commands
            bool has_more_commands();

            // advance 
            // returns the next command if hasMoreCommands returns true
            void advance();

            // returns the command type 
            Command commandType();

            // return the first argument of the current command
            std::string arg1();

            // return the second argument of the current command
            int arg2();


    };
}

#endif
