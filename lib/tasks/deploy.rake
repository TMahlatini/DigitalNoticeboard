# lib/tasks/deploy.rake
namespace :deploy do
    desc "Run all necessary post-deployment tasks"
    task :heroku do
      puts "Starting post-deployment tasks..."
  
      # Run database migrations
      Rake::Task['db:migrate'].invoke
      puts "Database migrations complete."
  
      # Precompile assets
      Rake::Task['assets:precompile'].invoke
      puts "Assets precompiled."
  
      # Clear cache (useful if you are caching data in production)
      Rake::Task['tmp:cache:clear'].invoke
      puts "Cache cleared."
  
      # Optionally seed the database (if you have seed data to run)
      # Uncomment the line below if you want to seed the database after deployment
      # Rake::Task['db:seed'].invoke
      # puts "Database seeded."
  
      # Run any additional custom tasks here
      # For example, you might want to call external APIs, refresh credentials, etc.
      # Rake::Task['your_custom_task'].invoke
  
      puts "Post-deployment tasks completed successfully."
    end
  end
  