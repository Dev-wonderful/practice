from invoke import task


@task
def hello(c):
    print("Hello from tasks.py, called by the invoke command in fabfile")
    print("The number of files you have in your root directory is: ", end="")
    c.run("ls -1 ~ | wc -l")
