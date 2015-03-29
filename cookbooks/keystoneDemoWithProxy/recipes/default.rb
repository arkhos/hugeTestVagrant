package 'nodejs'
package 'npm'
package 'mongodb'
package 'git-all'
package 'nginx-light'

bash 'create nodejs alternative bin' do
	user 'root'
	code <<-EOH
	ln -f -s /usr/bin/nodejs /usr/bin/node
	EOH
end

git '/opt/keystone-demo' do
  repository 'git://github.com/JedWatson/keystone-demo.git'  
  reference 'master'
  action :sync
end

bash 'install and configure keystone-demo ' do
	user 'root'
	cwd '/opt/keystone-demo'
	code <<-EOH
	npm install
	npm install pm2 -g
	pm2 start keystone.js
	pm2 startup ubuntu
	EOH
end

file '/etc/nginx/sites-available/default' do
   action :delete
end

cookbook_file '/etc/nginx/sites-available/default' do
   source "default"
   action :create
end

service 'nginx' do
   action :restart
end
