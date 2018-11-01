
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    name = "test",
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension('pyharu', ['pyharu/pyharu.pyx'], libraries=['hpdf', 'z', 'png'])], # accepts a glob pattern
)
