require 'meme'
require 'open-uri'
require 'tempfile'

ACCOUNTS_TO_CREATE = 100

namespace :db do
  namespace :seed do
    desc "Seed the database with #{ACCOUNTS_TO_CREATE} accounts"
    task :accounts => :environment do
      1.upto(ACCOUNTS_TO_CREATE) do |i|
        puts "Creating #{i}/#{ACCOUNTS_TO_CREATE}"

        meme_generator = Meme.new(Meme::GENERATORS.keys.sample)
        avatar = open(meme_generator.generate("HNTSVLL", ""))
        begin
          account = Account.create!(:first_name => ['Bob', 'Joe', 'Martin', 'Jane', 'Laura', 'Eric'].sample,
                                    :last_name => ['Smith', 'Ravenclaw', 'Marley', 'Jones', 'Hooptie'].sample,
                                    :email => "foo#{i}@example.com",
                                    :page_url => "http://example.com/#{i}",
                                    :avatar => Rack::Test::UploadedFile.new(avatar.path, "image/jpeg", :binary),
                                    :category_ids => [Category.all.sample.id])

          account.confirm_by_token(account.token)
        ensure
          avatar.close! if avatar
        end
      end
    end
  end
end
