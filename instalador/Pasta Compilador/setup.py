import sys
from cx_Freeze import setup, Executable


base = None
if sys.platform == "win32":
    base = "Console"

executables = [
        Executable("./../../src/BOT-Lancar-Horas.py", base=base, icon="./../Pasta Arquivos/BOT-Lancar-Horas_Icone.ico")
]

buildOptions = dict(
        packages = [],
        includes = ["getpass", "selenium", "time", "csv"],
        include_files = [],
        excludes = [],
        build_exe = './../../build/'
)

setup(
    name = "BOT Lançamento de Horas",
    version = "1.1",
    description = "BOT Lançamento de Horas",
    options = dict(build_exe = buildOptions),
    executables = executables
 )
