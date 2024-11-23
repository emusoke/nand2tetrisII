#include "parser.h"
#include <iostream>
#include <fstream>
#include <map>

using namespace P;
using namespace C;
using namespace std;




Parser::Parser(std::string source){
    // ugly but works
    CommandMap["add"] = C_ARITHMETIC;
    CommandMap["sub"] = C_ARITHMETIC;
    CommandMap["neg"] = C_ARITHMETIC;
    CommandMap["eq"] = C_ARITHMETIC;
    CommandMap["gt"] = C_ARITHMETIC;
    CommandMap["lt"] = C_ARITHMETIC;
    CommandMap["and"] = C_ARITHMETIC;
    CommandMap["or"] = C_ARITHMETIC;
    CommandMap["not"] = C_ARITHMETIC;
    CommandMap["push"] = C_PUSH;
    CommandMap["pop"] = C_POP;

    string line;
    ifstream VmFile(source);
    while (getline (VmFile, line))
    {
        if(line.substr(0,2) != "//" && !line.empty())
        {
            instructions.push(line);
        }
    }
    VmFile.close();
    advance();
}


bool Parser::has_more_commands(){
    if(instructions.empty())
    {
        return false;
    }
    else
    {
        return true;
    }
};

void Parser::advance()
{
    currentCommand = instructions.front();
    instructions.pop();
}

Command Parser::commandType()
{
    string arg0;
    int spaceIndex = currentCommand.find_first_of(" ");
    if (spaceIndex == std::string::npos)
    {
        arg0 = currentCommand;
    }
    else
    {
        arg0 = currentCommand.substr(0,spaceIndex);
    }
    return CommandMap[arg0];
}

std::string Parser::arg1(){
    Command currentCommandType = commandType();
    if (currentCommandType == C_ARITHMETIC)
    {
        return currentCommand;
    }
    else
    {
        int arg1Index = currentCommand.find_first_of(" ") + 1;
        string arg = currentCommand.substr(arg1Index);
        return arg.substr(0, arg.find_first_of(" "));
    }
}

int Parser::arg2()
{
    int arg2Index = currentCommand.find_last_of(" ") + 1;
    string arg = currentCommand.substr(arg2Index);
    return stoi(arg);
}
