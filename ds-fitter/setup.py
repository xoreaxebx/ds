from setuptools import find_packages
from setuptools import setup

setup(
    name='dsjk-fitter',
    version='0.0.2',
    author='',
    author_email='',
    url='',
    description='',
    packages=find_packages(exclude=('tests', )),
    install_requires=[
        'dsjk-core',
    ],
    include_package_data=True,
    zip_safe=False,
)
