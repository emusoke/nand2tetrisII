class CommandType:
    ARITHMETIC = 0
    PUSH = 1
    POP = 2
    LABEL = 3
    GOTO = 4
    IF = 5
    FUNCTION = 6
    RETURN = 7
    CALL = 8


COMMAND_MAP = {
    "add": CommandType.ARITHMETIC,
    "sub": CommandType.ARITHMETIC,
    "neg": CommandType.ARITHMETIC,
    "eq": CommandType.ARITHMETIC,
    "gt": CommandType.ARITHMETIC,
    "lt": CommandType.ARITHMETIC,
    "and": CommandType.ARITHMETIC,
    "or": CommandType.ARITHMETIC,
    "not": CommandType.ARITHMETIC,
    "push": CommandType.PUSH,
    "pop": CommandType.POP,
    "label": CommandType.LABEL,
    "goto": CommandType.GOTO,
    "if-goto": CommandType.IF,
    "function": CommandType.FUNCTION,
    "return": CommandType.RETURN,
    "call": CommandType.CALL,
}


class Parser:
    def __init__(self, file_name: str):
        self.current_command = ""
        with open(file_name, "r") as f:
            # self.lines = f.readlines()
            self.lines = [
                line for line in f.readlines() if line[:2] != "//" and len(line) > 1
            ]

    def has_more_commands(self):
        return len(self.lines) > 0

    def advance(self):
        self.current_command = self.lines.pop(0)

    @property
    def command_type(self):
        command = self.current_command.split()[0]
        return COMMAND_MAP[command]

    @property
    def arg1(self):
        if self.command_type == CommandType.ARITHMETIC:
            return self.current_command.split()[0]
        else:
            return self.current_command.split()[1]

    @property
    def arg2(self):
        return self.current_command.split()[2]
