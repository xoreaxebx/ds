from __future__ import unicode_literals
import sys

try:
    import docker
    import docker.errors
    from docker.types import Mount
    # TODO: check version >= 3.1.0
except ImportError:
    print('Install docker-py with `pip install docker`')
    sys.exit(1)

from .contexts import BaseDockerContext
from .contexts import DockerContext
from .contexts import ExternalContext
from .contexts import BuildContext
from .contexts import PullContext
from .naming import ContainerNaming
from .naming import ImageNaming
from .naming import DefaultNaming
from .mixins import UserMixin
from .mixins import HomeMountsMixin
from .mixins import ProjectMountMixin
