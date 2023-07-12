from fabric import Connection
from invoke import task


@task
def hello(c, name, lint=False):
    # conn = Connection('localhost')
    c.run(f'echo "Hello {name}"')
    if lint:
        linting(c)


@task
def linting(c):
    c.run("invoke hello")
    print("Checking your python files for proper formatting")
    result = c.run("pycodestyle *.py")
    if result.return_code == 0:
        print("linting succesful")
