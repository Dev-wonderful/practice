from fabric import Connection
from invoke import task


@task
def install(c, host=None, web=False, db=False):
	"""Install all servers or any specified one
		--web to install Nginx
		--db to install MySQL
		--host: format - user@hostIP:portnumber
	"""
	if host:
		# format: [user@]host[:port] - deploy@web1:2202
		c = Connection(host)
	if web:
		nginx(c)
	elif db:
		mysql(c)
	else:
		nginx(c)
		mysql(c)

@task
def nginx(c):	
	c.run('echo "Installing Nginx Server....."')
	failed = c.run('sudo ./install_nginx.sh').failed
	if not failed:
		c.run('echo "..................Installation Complete.................."')
	else:
		c.run('echo "Installation Failed......................................"')

@task
def mysql(c):	
	c.run('echo "Installing MySQL................................................."')
	failed = c.run('sudo ./install_mysql.sh').failed
	if not failed:
		c.run('echo "...................Installation Complete................."')
	else:
		c.run('echo "Installation Failed......................................"')

