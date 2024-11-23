#ifndef CODEWRITER_H
#define CODEWRITER_H

#include <string>
#include "Command.h"
#include <iostream>
#include <fstream>
#include <map>

namespace W
{
    class CodeWriter
    {
        public:
            std::string filename;
            std::ofstream outputfile;

            // opens the output file for processing
            CodeWriter(std::string outfile);

            // this function must return the assembly code based on the bytecode command to the output file
            void writeArithmetic(std::string command);

            // write the assembly code that implements push or pop
            void writePushPop(C::Command pushPop, std::string segment, int index);

            // function that closes the file that we have been writting to
            void close();

        private:
            std::map<std::string,std::string> commandMap;
            std::map<std::string, std::string> hackVariable;
            std::string commandNumber;
            std::string pushAssembly(int input, std::string memorySegment);
            std::string popAssembly(int input, std::string memorySegment);
            std::string addAssembly();
            std::string subAssembly();
            std::string andAssembly();
            std::string notAssembly();
            std::string compareAssembly(std::string greaterOrLess);
            std::string orAssembly();
            std::string negAssembly();
            std::string eqAssembly();
    };
}

#endif
