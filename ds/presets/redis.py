from base_container import Shell
from base_pull import Context as _Context


class Context(_Context):
    default_image = 'redis:latest'

    def get_all_commands(self):
        return super(Context, self).get_all_commands() + [
            #
        ]