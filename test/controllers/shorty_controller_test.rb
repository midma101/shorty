require 'test_helper'

class ShortyControllerTest < ActionDispatch::IntegrationTest
  test "blank input doesn't create a Url" do
    post "/shorty",
      params: { shorty: { url: ""} }
    assert_empty Url.all
  end

  test "bad input doesn't create a Url" do
    post "/shorty",
      params: { shorty: { url: "this isn't a url"} }
    assert_empty Url.all
  end

  test "valid input creates a Url" do
    post "/shorty",
      params: { shorty: { url: "http://dia.com"} }
    assert_not_empty Url.all
  end
end
