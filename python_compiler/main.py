import sys
import os
from parser import Parser, CommandType
from code_writer import CodeWriter


# for testing purposes
if __name__ == "__main__":
    # get input from command line
    file_name = sys.argv[1]

    files = []

    if file_name.endswith(".vm"):
        files.append(file_name)

    else:
        for filename in os.listdir(file_name):
            if filename.endswith(".vm"):
                files.append(os.path.join(file_name, filename))

    c = CodeWriter("finobacci_output.asm")
    # c = CodeWriter("nested_output.asm")
    for file in files:
        # get file name instead of path
        file_name = file_name.split("/")[-1]
        c.set_filename(file_name)
        if not c.initialized:
            c.write_init()
            c.initialized = True
        p = Parser(file)

        while p.has_more_commands():
            p.advance()

            if p.command_type == CommandType.ARITHMETIC:
                c.write_arithmetic(p.current_command)

            elif (
                p.command_type == CommandType.PUSH
                or p.command_type == CommandType.POP
            ):
                c.write_push_pop(p.command_type, p.arg1, p.arg2)

            elif p.command_type == CommandType.LABEL:
                print("label: ", p.arg1)
                c.write_label_assembly(p.arg1)

            elif p.command_type == CommandType.GOTO:
                c.write_goto_assembly(p.arg1)

            elif p.command_type == CommandType.IF:
                c.write_if_goto_assembly(p.arg1)

            elif p.command_type == CommandType.FUNCTION:
                c.write_function_assembly(p.arg1, p.arg2)

            elif p.command_type == CommandType.RETURN:
                c.write_return_assembly()

            elif p.command_type == CommandType.CALL:
                c.write_call_assembly(p.arg1, p.arg2)

    c.close()
