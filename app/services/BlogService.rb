class BlogService
    attr_reader :blog, :array

    def initialize(blog)
        @blog = blog
        @array = []
    end

    def alles
        if blog.concept?
            blog.published! 
        elsif blog.archived?
        else
            blog.concept!
        end
    end
end