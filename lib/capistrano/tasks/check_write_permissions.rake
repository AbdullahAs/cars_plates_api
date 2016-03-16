# # lib/capistrano/tasks/agent_forwarding.rake
# desc "Check if agent forwarding is working"
# task :forwarding do
#   on roles(:all) do |h|
#     if test("env | grep SSH_AUTH_SOCK")
#       info "Agent forwarding is up to #{h}"
#     else
#       error "Agent forwarding is NOT up to #{h}"
#     end
#   end
# end

# desc "Report Uptimes"
# task :uptime do
#   on roles(:all) do |host|
#     execute :any_command, "with args", :here, "and here"
#     info "Host #{host} (#{host.roles.to_a.join(', ')}):\t#{capture(:uptime)}"
#   end
# end

# desc "Create Important File"
# file 'important.txt' do |t|
#   sh "touch #{t.name}"
# end
# desc "Upload Important File"
# task :upload => 'important.txt' do |t|
#   on roles(:all) do
#     upload!(t.prerequisites.first, '/tmp')
#   end
# end

# after :finishing, :notify