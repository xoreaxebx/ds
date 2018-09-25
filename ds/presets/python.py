from base_container import Exec
from base_pull import Context as _Context


class Context(_Context):
    default_image = 'python:3.5'

    def get_all_commands(self):
        return super(Context, self).get_all_commands() + [
            Pip,
            PipFreeze,
        ]


class Pip(Exec):
    user = 0

    def get_command_args(self):
        return 'pip',


class PipFreeze(Exec):
    def get_command_args(self):
        return 'pip', 'freeze',