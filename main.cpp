#include <iostream>
#include "Command.h"
#include "codeWriter.h"
#include "parser.cpp"
#include "codeWriter.cpp"
#include <sstream>

using namespace std;
using namespace W;
using namespace C;


// We need a parser class and codewriter class

int main(){
    Command x;
    Parser p = Parser("pointer.vm");
    CodeWriter c("python_pointer.asm");

    bool step = true;
    while(step)
    {
        if (p.commandType() == C_ARITHMETIC)
        {
            c.writeArithmetic(p.currentCommand);
        }
        else if (p.commandType() == C_PUSH || p.commandType() == C_POP) {
            c.writePushPop(p.commandType(), p.arg1(), p.arg2());
        }

        if (!p.has_more_commands())
        {
            step = false;
        }
        else {
            p.advance();
        }
    }
    c.outputfile.close();
}
