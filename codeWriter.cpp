#include "codeWriter.h"
#include "Command.h"

#include <iostream>
#include <fstream>
#include <map>
#include <string>

using namespace std;
using namespace W;
using namespace C;




CodeWriter::CodeWriter(std::string fileName)
{
    outputfile = std::ofstream(fileName);
    // find the . in filename and make filename the substring before the .
    int dotIndex = fileName.find(".");
    if (dotIndex != -1)
    {
        filename = fileName.substr(0, dotIndex);
    }
    //filename = fileName;
    commandNumber = "0";
    hackVariable["local"] = "LCL";
    hackVariable["argument"] = "ARG";
    hackVariable["this"] = "THIS";
    hackVariable["that"] = "THAT";
    hackVariable["temp"] = "5";
}


std::string CodeWriter::notAssembly()
{
    string assembly = "// not \n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "M=!M\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}

std::string CodeWriter::addAssembly()
{
    string assembly = "// add \n";
    assembly += "@SP";
    assembly += "\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "M=D+M\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}

std::string CodeWriter::subAssembly()
{
    string assembly = "// sub \n";
    assembly += "@SP";
    assembly += "\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "M=M-D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}

std::string CodeWriter::negAssembly()
{
    string assembly = "// neg \n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@0\n";
    assembly += "D=A-D\n";
    assembly += "@SP\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}


// @SP
// M=M-1 // 0 is 257
// A=M // a is 257
// D=M // D is value on top of stack
// // place this value in a variable
// @placeholder
// M=D // put d in placeholder
// @SP // go back to stack
// M=M-1 // get the next value
// A=M
// D=M // D now holds the value on the stack
// @placeholder
// D=D&M // D now holds the value of the 2 and values
// @SP
// A=M
// M=D // put D on the value of the stack

std::string CodeWriter::andAssembly()
{
    string assembly = "// and \n";
    assembly += "@SP";
    assembly += "\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@placeholder\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@placeholder\n";
    assembly += "D=D&M\n";
    assembly += "@SP\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}



std::string CodeWriter::orAssembly()
{
    string assembly = "// or \n";
    assembly += "@SP";
    assembly += "\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@placeholder\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@placeholder\n";
    assembly += "D=D|M\n";
    assembly += "@SP\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}

std::string CodeWriter::eqAssembly()
{
    cout << commandNumber << endl;
    string assembly = "// eq \n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=D-M\n";
    cout<<"debugging"<<endl;
    cout<<"command number: "<<commandNumber<<endl;
    cout << "line to add " << "@true" + commandNumber + "\n";
    assembly += "@true" + commandNumber + "\n";
    assembly += "D;JEQ\n";
    assembly += "@false" + commandNumber + "\n";
    assembly += "0;JMP\n";
    assembly += "(true" + commandNumber + ")" + "\n";
    assembly += "@0\n";
    assembly += "D=A-1\n";
    assembly += "@end" + commandNumber + "\n";
    assembly += "0;JMP\n";
    assembly += "(false" + commandNumber + ")" + "\n";
    assembly += "@0\n";
    assembly += "D=A\n";
    assembly += "(end" + commandNumber + ")" + "\n";
    assembly += "@SP\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}


std::string CodeWriter::compareAssembly(std::string greaterLess)
{
    std::string hackJump = "JGT";
    if (greaterLess == "lt")
    {
        hackJump = "JLT";
    }
    string assembly = "//" + hackJump + "\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M-D\n";
    assembly += "@true" + commandNumber + "\n";
    assembly += "D;" + hackJump + "\n";
    assembly += "@false" + commandNumber + "\n";
    assembly += "0;JMP\n";
    assembly += "(true" + commandNumber + ")" + "\n";
    assembly += "@0\n";
    assembly += "D=A-1\n";
    assembly += "@end" + commandNumber + "\n";
    assembly += "0;JMP\n";
    assembly += "(false" + commandNumber + ")" + "\n";
    assembly += "@0\n";
    assembly += "D=A\n";
    assembly += "(end" + commandNumber + ")" + "\n";
    assembly += "@SP\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M+1\n";
    return assembly;
}



// write the assembly code that implements push or pop
void CodeWriter::writePushPop(C::Command pushPop, std::string segment, int index)
{
    if (pushPop == C::C_PUSH)
    {
        outputfile << pushAssembly(index, segment);
    }
    else
    {
        outputfile << popAssembly(index, segment);
    }
}
// pop segment i
// @2 // this is my offset
// D=A // D not holds my offset for the address
// @LCL // go to the base address of local
// D=D+M // D now holds the address of the target i.e 1017
// @target
// M=D // target now holds 1017
// @SP
// M=M-1
// A=M
// D=M // D now holds the value of the value on top of the stack
// @target
// A=M // now A is 1017
// M=D // 1017 will now hold the value that was at the top of the stack

std::string CodeWriter::popAssembly(int arg, std::string segment)
{
    std::string input_arg = to_string(arg);
    string assembly = "// pop " + segment + " " + input_arg + "\n";
    string targetAddress = "D=D+M\n";
    if (segment == "temp")
    {
        targetAddress = "D=D+A\n";
    }

    if (segment == "pointer")
    {
        if (arg == 0)
        {
            segment = "this";
        }
        else {
            segment = "that";
        }
        targetAddress = "D=A\n";
    }
    string hackSegment = hackVariable[segment] + "\n";

    if (segment == "static")
    {
        hackSegment = filename + "." + input_arg + "\n";
        // write the assembly here for a pop into hackSegment
        assembly += "@SP\n";
        assembly += "M=M-1\n";
        assembly += "A=M\n";
        assembly += "D=M\n"; // d now holds value on to of stack
        assembly += "@";
        assembly += hackSegment; // A is now the varriable
        assembly += "M=D\n"; // set the value at this variable to d
        return assembly;
    }

    assembly += "@";
    assembly += input_arg;
    assembly += "\n";
    assembly += "D=A\n";
    assembly += "@";
    assembly += hackSegment;
    assembly += targetAddress;
    assembly += "@target\n";
    assembly += "M=D\n";
    assembly += "@SP\n";
    assembly += "M=M-1\n";
    assembly += "A=M\n";
    assembly += "D=M\n";
    assembly += "@target\n";
    assembly += "A=M\n";
    assembly += "M=D\n";
    return assembly;
}

std::string CodeWriter::pushAssembly(int arg, std::string segment)
{
    std::string input_arg = to_string(arg);
    string assembly = "// push " + segment + " " + input_arg + "\n";
    string targetAddress = "A=D+M\n";
    if (segment == "temp")
    {
        targetAddress = "A=D+A\n";
    }
    if (segment == "pointer")
    {
        if (arg == 0)
        {
            segment = "this";
        }
        else {
            segment = "that";
        }
        // take what is at address this or that
        targetAddress = "\n";
    }
    string hackSegment = hackVariable[segment] + "\n";
    if (segment == "static")
    {
        hackSegment = filename + "." + input_arg + "\n";
        assembly += "@";
        assembly += hackSegment; // go to the address of the variable
        assembly += "D=M\n"; // D now holds the value in the variable
        assembly += "@SP\n"; // go to the stack pointer and put D
        assembly += "A=M\n";
        assembly += "M=D\n";
        assembly += "@SP\n";
        assembly += "M=M+1\n";
        return assembly;
    }


    assembly += "@";
    assembly += input_arg; // 1 or 0
    assembly += "\n";
    assembly += "D=A\n";
    if (segment == "constant")
    {
        assembly += "@SP\n";
        assembly += "A=M\n";
        assembly += "M=D\n";
        assembly += "@SP\n";
        assembly += "M=M+1\n";
    }
    else
    {
        assembly += "@";
        assembly += hackSegment;
        assembly += targetAddress;
        assembly += "D=M\n";
        assembly += "@SP\n";
        assembly += "A=M\n";
        assembly += "M=D\n";
        assembly += "@SP\n";
        assembly += "M=M+1\n";
    };
    return assembly;
}

void CodeWriter::writeArithmetic(std::string command)
{
    int commandTrack = stoi(commandNumber);
    commandNumber = to_string(commandTrack + 1);
    //outputfile << commandMap[command];
    // based on the command, write the assembly code
    if (command == "add")
    {
        outputfile << addAssembly();
    }
    else if (command == "sub")
    {
        outputfile << subAssembly();
    }
    else if (command == "neg")
    {
        outputfile << negAssembly();
    }
    else if (command == "not")
    {
        outputfile << notAssembly();
    }
    else if (command == "and")
    {
        outputfile << andAssembly();
    }
    else if (command == "or")
    {
        outputfile << orAssembly();
    }
    else if (command == "eq")
    {
        outputfile << eqAssembly();
    }
    else if (command == "gt")
    {
        outputfile << compareAssembly("gt");
    }
    else if (command == "lt")
    {
        outputfile << compareAssembly("lt");
    }
}
