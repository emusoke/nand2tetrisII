import sys
from parser import Parser, CommandType
from code_writer import CodeWriter


# for testing purposes
if __name__ == "__main__":
    # get input from command line
    file_name = sys.argv[1]
    p = Parser(file_name)
    comma_index = file_name.index(".")
    output_file_name = file_name[:comma_index] + ".asm"
    c = CodeWriter(output_file_name)

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
            c.write_label_assembly(p.arg1)

        elif p.command_type == CommandType.GOTO:
            c.write_goto_assembly(p.arg1)

        elif p.command_type == CommandType.IF:
            c.write_if_goto_assembly(p.arg1)

        elif p.command_type == CommandType.FUNCTION:
            c.write_function_assembly(p.arg1, p.arg2)

        elif p.command_type == CommandType.RETURN:
            c.write_return_assembly()

    c.close()
