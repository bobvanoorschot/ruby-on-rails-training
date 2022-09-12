# frozen_string_literal: true

namespace :blog do
  desc 'Update hide and show'
  task update_comments_show: :environment do
    Blog.find_each do |blog|
      BlogService.new(blog).alles
    end
  end
end
