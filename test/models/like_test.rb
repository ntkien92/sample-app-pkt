require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id: 1, micropost_id: 1)
  end

  test 'should be valid' do
    assert @like.valid?
  end

  test 'should require a user_id for like' do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test 'should require a micropost_id for like' do
    @like.micropost_id = nil
    assert_not @like.valid?
  end
end
