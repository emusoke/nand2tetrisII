from parser import CommandType

HACK_SEGMENTS = {
    "local": "LCL",
    "argument": "ARG",
    "this": "THIS",
    "that": "THAT",
    # "pointer": "3",
    "temp": "5",
    # "static": "16",
    "constant": "\n",
    "static": "\n",
}


class CodeWriter:
    def __init__(self, file):
        self.file = open(file, "w")
        index = file.index(".")
        self.filename = file[:index]
        self.command_number = "0"

        def _add_assembly(self):
            return (
                "// add \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "M=D+M\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _sub_assembly(self):
            return (
                "// sub \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "M=M-D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _not_assembly(self):
            return (
                "// not \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "M=!M\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _neg_assembly(self):
            return (
                "// neg \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@0\n"
                + "D=A-D\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _and_assembly(self):
            return (
                "// and \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@placeholder\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@placeholder\n"
                + "D=D&M\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _or_assembly(self):
            return (
                "// or \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@placeholder\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@placeholder\n"
                + "D=D|M\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def label_assembly(self, arg1):
            return f"label {arg1}"

        def _eq_assembly(self):
            return (
                "// eq \n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=D-M\n"
                + "@true"
                + self.command_number
                + "\n"
                + "D;JEQ\n"
                + "@false"
                + self.command_number
                + "\n"
                + "0;JMP\n"
                + "(true"
                + self.command_number
                + ")"
                + "\n"
                + "@0\n"
                + "D=A-1\n"
                + "@end"
                + self.command_number
                + "\n"
                + "0;JMP\n"
                + "(false"
                + self.command_number
                + ")"
                + "\n"
                + "@0\n"
                + "D=A\n"
                + "(end"
                + self.command_number
                + ")"
                + "\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        def _compare_assembly(self, greater_less):
            hack_jump = "JGT"
            if greater_less == "lt":
                hack_jump = "JLT"
            return (
                "//"
                + hack_jump
                + "\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M-D\n"
                + "@true"
                + self.command_number
                + "\n"
                + "D;"
                + hack_jump
                + "\n"
                + "@false"
                + self.command_number
                + "\n"
                + "0;JMP\n"
                + "(true"
                + self.command_number
                + ")"
                + "\n"
                + "@0\n"
                + "D=A-1\n"
                + "@end"
                + self.command_number
                + "\n"
                + "0;JMP\n"
                + "(false"
                + self.command_number
                + ")"
                + "\n"
                + "@0\n"
                + "D=A\n"
                + "(end"
                + self.command_number
                + ")"
                + "\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        self.arithmetic_assembly = {
            "add": _add_assembly,
            "sub": _sub_assembly,
            "neg": _neg_assembly,
            "not": _not_assembly,
            "and": _and_assembly,
            "or": _or_assembly,
            "eq": _eq_assembly,
            "gt": _compare_assembly,
            "lt": _compare_assembly,
        }

    def write_arithmetic(self, command):
        command_number = int(self.command_number) + 1
        clean_command = command.strip()
        self.command_number = str(command_number)
        assembly_function = self.arithmetic_assembly[clean_command]
        if clean_command == "gt" or clean_command == "lt":
            self.file.write(assembly_function(self, clean_command))
        else:
            self.file.write(assembly_function(self))

    def write_push_assembly(self, segment, arg):
        assembly = "// push " + segment + " " + arg + "\n"
        target_address = "A=D+M\n"

        if segment == "temp":
            target_address = "A=D+A\n"

        if segment == "pointer":
            if arg == "0":
                segment = "this"
            else:
                segment = "that"

            target_address = "\n"

        hack_segment = HACK_SEGMENTS[segment] + "\n"

        if segment == "static":
            hack_segment = self.filename + "." + arg + "\n"
            return (
                assembly
                + "@"
                + hack_segment
                + "D=M\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        base_assembly = "@" + arg + "\n" + "D=A\n"

        if segment == "constant":
            return (
                assembly
                + base_assembly
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

        else:
            return (
                assembly
                + base_assembly
                + "@"
                + hack_segment
                + target_address
                + "D=M\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
            )

    def _label_assembly(self, arg1):
        return f"({arg1})\n"

    def _goto_assembly(self, arg1):
        return (
            f"// go to {arg1}\n"
            + f"@{arg1}\n"
            + "0;JMP\n"
        )

    def _function_assembly(self, arg1, arg2):
        push_assembly = ""
        for i in range(int(arg2)):
            push_assembly += f"push local {i}\n"
        return (
            f"// function {arg1}\n"
            + f"({arg1})\n"
            + push_assembly
        )

    def _return_assembly(self):
        return (
            "// return \n"
            + "@LCL\n"  # endFrame = LCL
            + "D=M\n"
            + "@endFrame\n"
            + "M=D\n"

            + "// retAddr = *(endFrame - 5)\n"
            + "@5\n"  # retAddr = *(endFrame - 5)
            + "D=A\n"
            + "@endFrame\n"
            + "D=A-D\n"
            + "@retAddr\n"
            + "M=D\n"

            # pop assembly
            + "// *ARG = pop()\n"
            + "@0"
            + "\n"
            + "D=A\n"
            + "@ARG"
            + "D=D+M\n"
            + "@target\n"
            + "M=D\n"
            + "@SP\n"
            + "M=M-1\n"
            + "A=M\n"
            + "D=M\n"
            + "@target\n"
            + "A=M\n"
            + "M=D\n"

            "// SP = ARG + 1\n"
            + "@ARG\n"
            + "D=A\n"
            + "@SP\n"
            + "M=D+1\n"

            + "// THAT = *(endFrame - 1)\n"
            + "@endFrame\n"
            + "A=A-1\n"
            + "D=A\n"
            + "@THAT\n"
            + "M=D\n"

            + "// THIS = *(endFrame - 2)\n"
            + "@2\n"
            + "D=A\n"
            + "@endframe\n"
            + "A=A-D\n"
            + "D=A\n"
            + "@THIS\n"
            + "M=D\n"


            + "// ARG = *(endFrame - 3)\n"
            + "@3\n"
            + "D=A\n"
            + "@endframe\n"
            + "A=A-D\n"
            + "D=A\n"
            + "@ARG\n"
            + "M=D\n"


            + "// LCL = *(endFrame - 4)\n"
            + "@4\n"
            + "D=A\n"
            + "@endframe\n"
            + "A=A-D\n"
            + "D=A\n"
            + "@LCL\n"
            + "M=D\n"

            + "// goto retAddr\n"
            + "@retAddr\n"
            + "A=M\n"
            + "0;JMP\n"
        )

    def _if_goto_assembly(self, arg1):
        return (
            "// if-goto " + arg1 + "\n"
            "@SP\n"
            + "M=M-1\n"
            + "A=M\n"
            + "D=M\n"
            + f"@{arg1}\n"
            + "D;JGT\n"
        )

    def write_pop_assembly(self, segment, arg):
        assembly = "// pop " + segment + " " + arg + "\n"
        target_address = "D=D+M\n"

        if segment == "pointer":
            if arg == "0":
                segment = "this"
            else:
                segment = "that"

            target_address = "D=A\n"

        hack_segment = HACK_SEGMENTS[segment] + "\n"

        if segment == "temp":
            target_address = "D=D+A\n"

        if segment == "static":
            hack_segment = self.filename + "." + arg + "\n"
            return (
                assembly
                + "@SP\n"
                + "M=M-1\n"
                + "A=M\n"
                + "D=M\n"
                + "@"
                + hack_segment
                + "M=D\n"
            )

        return (
            assembly
            + "@"
            + arg
            + "\n"
            + "D=A\n"
            + "@"
            + hack_segment
            + target_address
            + "@target\n"
            + "M=D\n"
            + "@SP\n"
            + "M=M-1\n"
            + "A=M\n"
            + "D=M\n"
            + "@target\n"
            + "A=M\n"
            + "M=D\n"
        )

    def write_push_pop(self, command, arg1, arg2):
        if command == CommandType.PUSH:
            self.file.write(self.write_push_assembly(arg1, arg2))
        else:
            self.file.write(self.write_pop_assembly(arg1, arg2))

    def write_label_assembly(self, arg1):
        self.file.write(self._label_assembly(arg1))

    def write_goto_assembly(self, arg1):
        self.file.write(self._goto_assembly(arg1))

    def write_if_goto_assembly(self, arg1):
        self.file.write(self._if_goto_assembly(arg1))

    def write_function_assembly(self, arg1, arg2):
        self.file.write(self._function_assembly(arg1, arg2))

    def write_return_assembly(self):
        self.file.write(self._return_assembly())

    def close(self):
        self.file.close()
