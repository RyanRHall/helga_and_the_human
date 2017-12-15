namespace :db do
  desc "Sync with remote DB"
  task sync: :environment do
    `rake db:drop`
    `rake db:create`
    `heroku pg:backups:capture`
    `heroku pg:backups:download`
    `pg_restore --verbose --clean --no-acl --no-owner -h localhost -U ryan -d helga_the_van_development latest.dump`
    file_path = File.join(Rails.root, 'latest.dump')
    File.delete(file_path)
  end

end
