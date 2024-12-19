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
        #self.filename = file[:index]
        self.command_number = "0"
        self.initialized = False
        self._function_increment = 0
        self._current_function = ""

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
        return f"({self.filename[:-3]}.{self._current_function}${arg1})\n"

    def _goto_assembly(self, arg1):
        go_to = f"{self.filename[:-3]}.{self._current_function}${arg1}\n"
        return (
            f"// go to {arg1}\n"
            + f"@{go_to}\n"
            + "0;JMP\n"
        )

    def _go_to_function_assembly(self, arg1):
        return (
            f"// go to {arg1}\n"
            + f"@{arg1}\n"
            + "0;JMP\n"
        )

    def _function_name_assembly(self, arg1):
        return (
            f"// function {self.filename[:-3]}.{arg1}\n"
            + f"({self.filename[:-3]}.{arg1})\n"
        )

    def _return_assembly(self):
        return (
            "// return \n"
            + "@LCL\n"  # endFrame = LCL
            + "D=M\n"
            + "@R13\n"
            + "M=D\n"

            + "// retAddr = *(endFrame - 5)\n"
            + "@5\n"  # retAddr = *(endFrame - 5)
            + "D=A\n"
            + "@R13\n"
            + "D=M-D\n"
            + "A=D\n"
            + "D=M\n"
            + "@R15\n"
            + "M=D\n"

            # pop assembly
            + "// *ARG = pop()\n"
            + "@0"
            + "\n"
            + "D=A\n"
            + "@ARG\n"
            + "D=D+M\n"
            + "@R14\n"
            + "M=D\n"
            + "@SP\n"
            + "M=M-1\n"
            + "A=M\n"
            + "D=M\n"
            + "@R14\n"
            + "A=M\n"
            + "M=D\n"

            "// SP = ARG + 1\n"
            + "@ARG\n"
            + "D=M\n"
            + "@SP\n"
            + "M=D+1\n"

            + "// THAT = *(endFrame - 1)\n"
            + "@R13\n"
            + "A=M-1\n"
            + "D=M\n"
            + "@THAT\n"
            + "M=D\n"

            + "// THIS = *(endFrame - 2)\n"
            + "@2\n"
            + "D=A\n"
            + "@R13\n"
            + "A=M-D\n"
            + "D=M\n"
            + "@THIS\n"
            + "M=D\n"


            + "// ARG = *(endFrame - 3)\n"
            + "@3\n"
            + "D=A\n"
            + "@R13\n"
            + "A=M-D\n"
            + "D=M\n"
            + "@ARG\n"
            + "M=D\n"


            + "// LCL = *(endFrame - 4)\n"
            + "@4\n"
            + "D=A\n"
            + "@R13\n"
            + "A=M-D\n"
            + "D=M\n"
            + "@LCL\n"
            + "M=D\n"

            + "// goto retAddr\n"
            + "@R15\n"
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

    def _save_segment(self, segment):
        return (
            "// save segments\n"
            + "@"
            + segment + "\n"
            + "D=M\n"
            + "@SP\n"
            + "A=M\n"
            + "M=D\n"
            + "@SP\n"
            + "M=M+1\n"
        )

    def _reposition_arg(self, n_args):
        offset = str(5 + int(n_args))
        return (
            "// reposition arg\n"
            + f"@{offset}\n"
            + "D=A\n"
            + "@SP\n"
            + "D=M-D\n"
            + "@ARG\n"
            + "M=D\n"
        )

    def _reposition_lcl(self):
        return (
            "// reposition local\n"
            + "@SP\n"
            + "D=M\n"
            + "@LCL\n"
            + "M=D\n"
        )

    def _add_local_variable(self):
        return (
            "@SP\n"
            + "A=M\n"
            + "M=0\n"
            + "@SP\n"
            + "M=M+1\n"
        )

    def call_assembly_return_label(self, reference):
        reference = f"{self.filename[:-3]}.{self._current_function}$ret.{self._function_increment}"
        return (
                f"@{reference}\n"
                + "D=A\n"
                + "@SP\n"
                + "A=M\n"
                + "M=D\n"
                + "@SP\n"
                + "M=M+1\n"
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
        self._current_function = arg1
        self.file.write(self._function_name_assembly(arg1))
        self.file.write("\n")
        self.file.write(f"// Adding {arg2} local variables\n")

        for i in range(int(arg2)):
            self.file.write(self._add_local_variable())

    def write_return_assembly(self):
        self.file.write(self._return_assembly())

    def set_filename(self, filename):
        self.filename = filename

    def write_call_assembly(self, arg1, arg2):
        self.file.write(f"// call {arg1}\n")
        self.file.write("// set return address label\n")
        # self.file.write(self.write_push_assembly("constant", "0"))
        reference = f"{self.filename[:-3]}.{self._current_function}$ret.{self._function_increment}"
        self.file.write(self.call_assembly_return_label(reference))
        self._function_increment += 1
        self.file.write(self._save_segment("LCL"))
        self.file.write(self._save_segment("ARG"))
        self.file.write(self._save_segment("THIS"))
        self.file.write(self._save_segment("THAT"))
        self.file.write(self._reposition_arg(arg2))
        self.file.write(self._reposition_lcl())
        function_entry = f"{self.filename[:-3]}.{arg1}"
        # print("function entry", function_entry)
        self.file.write(self._go_to_function_assembly(function_entry))
        self.file.write(f"({reference})\n")

    def write_init(self):
        self.file.write(
            "// init\n"
            + "@256\n"
            + "D=A\n"
            + "@SP\n"
            + "M=D\n"
        )
        self.write_call_assembly("Sys.init", "0")

    def close(self):
        self.file.close()
