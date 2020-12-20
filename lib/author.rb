class Author

  attr_accessor :name, :posts

  def initialize(name)
    @name = name
    @posts = []
  end

  def posts
    Post.all.select do |post|
      post.author == self
    end
  end

  def add_post(post)
    @posts << post
    post.author = self
  end

  def add_post_by_title(post)
    post = Post.new(post)
    post.author = self
  end

  def self.post_count
    Post.all.length
  end

end