# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :web, %w{deploy@139.162.61.88}
role :app, %w{deploy@139.162.61.88}
role :db,  %w{deploy@139.162.61.88}

# Define server(s)
server '139.162.61.88', user: 'deploy', roles: %w{web}, port: 44445