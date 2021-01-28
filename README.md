### Advanced Informatics 2021 

#### Week 4 Lab Exercise

Output for the week:

![mtcars.png](https://github.com/swd12012/snakemake_exercise/blob/main/mtcars.png)

##### Exercise Questions

1. To delete all the output from a `snakemake` workflow, you can run `snakemake -j1 --delete-all-output`, since I have an `all` rule.

2. To delete the output from a specific `rule`, you can run `snakemake -j1 {rule} --delete-all-output`.

3. The citation for `snakemake` is [Köster, Johannes and Rahmann, Sven. “Snakemake - A scalable bioinformatics workflow engine”. Bioinformatics 2012.](https://academic.oup.com/bioinformatics/article/28/19/2520/290322).

##### Demonstrating that `touch`ing files reruns the relevant rules

If I `touch mtcars.R`, this is the output that I get:

```bash
snakemake -j1 -np

Building DAG of jobs...
Job counts:
    count   jobs
    1   all
    1   makeDatabase
    1   makeFigure
    3

[Thu Jan 28 14:33:07 2021]
rule makeDatabase:
    input: mtcars.R
    output: mtcars.sqlite3
    jobid: 1

Rscript mtcars.R

[Thu Jan 28 14:33:07 2021]
rule makeFigure:
    input: mtcars.sqlite3, mtcars.py
    output: mtcars.png
    jobid: 2

python mtcars.py

[Thu Jan 28 14:33:07 2021]
localrule all:
    input: mtcars.sqlite3, mtcars.png
    jobid: 0

Job counts:
    count   jobs
    1   all
    1   makeDatabase
    1   makeFigure
    3
This was a dry-run (flag -n). The order of jobs does not reflect the order of execution.
```

If I `touch mtcars.sqlite3`:

```bash
Building DAG of jobs...
Job counts:
    count   jobs
    1   all
    1   makeFigure
    2

[Thu Jan 28 14:33:38 2021]
rule makeFigure:
    input: mtcars.sqlite3, mtcars.py
    output: mtcars.png
    jobid: 2

python mtcars.py

[Thu Jan 28 14:33:38 2021]
localrule all:
    input: mtcars.sqlite3, mtcars.png
    jobid: 0

Job counts:
    count   jobs
    1   all
    1   makeFigure
    2
This was a dry-run (flag -n). The order of jobs does not reflect the order of execution.
```

If I `touch mtcars.py`:

```bash
Building DAG of jobs...
Job counts:
    count   jobs
    1   all
    1   makeFigure
    2

[Thu Jan 28 14:33:58 2021]
rule makeFigure:
    input: mtcars.sqlite3, mtcars.py
    output: mtcars.png
    jobid: 2

python mtcars.py

[Thu Jan 28 14:33:58 2021]
localrule all:
    input: mtcars.sqlite3, mtcars.png
    jobid: 0

Job counts:
    count   jobs
    1   all
    1   makeFigure
    2
This was a dry-run (flag -n). The order of jobs does not reflect the order of execution.
```