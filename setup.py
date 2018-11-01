
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    name = "pyharu",
    version = '0.2',
    description = 'Python bindings for libhpdf (aka Haru PDF C library)',
    author = 'Kais Ben Salah',
    url = 'https://github.com/kaisbe/pyharu',
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension('pyharu', ['pyharu/pyharu.pyx'], libraries=['hpdf', 'z', 'png'])], # accepts a glob pattern
)
