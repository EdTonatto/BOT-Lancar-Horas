import sys
from cx_Freeze import setup, Executable


base = None
if sys.platform == "win32":
    base = "Console"

executables = [
        Executable("BOT-Lancar-Horas.py", base=base)
]

buildOptions = dict(
        packages = [],
        includes = ["getpass", "selenium", "time", "csv"],
        include_files = [],
        excludes = []
)

setup(
    name = "BOT Lançamento de Horas",
    version = "1.0",
    description = "BOT Lançamento de Horas",
    options = dict(build_exe = buildOptions),
    executables = executables
 )
