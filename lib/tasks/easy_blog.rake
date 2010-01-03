# Easy Blog
# Author: Abhishek Shukla

# Feel Free to modify the application as per your requirement....
# NOTE: The program does not take any responsibilites to loss of data.

namespace :easyblog do

  desc "Prepare the database and load default application settings"
  task :setup => :environment do
    proceed = true
    if ActiveRecord::Migrator.current_version > 0
      puts "\n\t\tYou have requested a database reset.\n
            This will IRREVERSIBLY DESTROY any data in your database.\n
            Are you sure you want to do this?\n\n"
      loop do
        print "Continue [yes/no]: "
        proceed = STDIN.gets.strip
        break unless proceed.blank?
      end
    end
    if proceed.eql?("yes")
      Rake::Task["db:migrate:reset"].invoke
      Rake::Task["easyblog:setup:admin"].invoke
    end
  end

  namespace :setup do

    desc "Creates an admin account."
    task :admin => :environment do
      username  = ENV['USERNAME']
      password  = "user"
      email     = ""
      unless username && !password.blank? && !email.blank?
        loop do
          puts "\ Please enter the required information."
          username ||= "user"
          print "\nUsername [#{username}]: "
          reply     = STDIN.gets.strip
          username  = reply unless reply.blank?

          print "Password [#{password}]: "
          echo = lambda { |toggle| return if RUBY_PLATFORM =~ /mswin/; system(toggle ? "stty echo && echo" : "stty -echo") }
          echo.call(false)
          begin
            echo.call(false)
            reply = STDIN.gets.strip
            password = reply unless reply.blank?
          ensure
            echo.call(true)
          end

          loop do
            print "Email: "
            email = STDIN.gets.strip
            email = (email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)
            if email
              break unless email.blank?
            else
              puts "Please enter a valid email address"
            end
          end

          puts "\nThe admin user will be created with the following credentials:\n\n"
          puts "  Username: #{username}"
          puts "  Password: #{'*' * password.length}"
          puts "     Email: #{email}\n\n"
          loop do
            print "Continue [yes/no/exit]: "
            reply = STDIN.gets.strip
            break unless reply.blank?
          end
          break if reply =~ /y(?:es)*/i
          redo if reply =~ /no*/i
          puts "No admin user was created."
          exit
        end
      end
      user = User.new
      user.update_attributes(:username => username, :password => password, :email => email)
      user.update_attribute(:admin, true) # Mass assignments don't work for :admin because of the attr_protected
      puts "Admin user has been created."
    end
  end

end