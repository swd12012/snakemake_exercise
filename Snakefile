rule all:
    input:
        "mtcars.sqlite3",
        "mtcars.png"


rule makeDatabase:
    input:
        "mtcars.R"
    output:
        "mtcars.sqlite3"
    shell:
        "Rscript {input}"

rule makeFigure:
    input:
        "mtcars.sqlite3",
        pyscript = "mtcars.py"
    output:
        "mtcars.png"
    shell:
        "python {input.pyscript}"