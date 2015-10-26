require 'test_helper'
# class Like test
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

  test 'should like and unlike a micropost' do
    michael = users(:michael)
    archer  = users(:archer)
    orange  = microposts(:orange)
    assert_not michael.liked?(orange)
    michael.like(orange)
    archer.like(orange)
    assert michael.liked?(orange)
    assert orange.likers.include?(michael)
    michael.unlike(orange)
    assert_not michael.liked?(orange)
  end
end
