require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "confirm" do
    @expected.subject = 'OrderMailer#confirm'
    @expected.body    = read_fixture('confirm')
    @expected.date    = Time.now

    assert_equal @expected.encoded, OrderMailer.create_confirm(@expected.date).encoded
  end

end
