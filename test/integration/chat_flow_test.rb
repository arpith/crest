require 'test_helper'
require 'json'

class ChatFlowTest < ActionDispatch::IntegrationTest
  test "can send message" do
    message = {"sender": "u1", "receiver": "u2", "text": "hi"}
    post '/messages', params: message, as: :json
    json = JSON.parse(response.body)['message']
    assert_response 201
    assert_equal message[:sender], json['sender']
    assert_equal message[:receiver], json['receiver']
    assert_equal message[:text], json['text']
  end

  test "can list message" do
    message = {"sender": "u1", "receiver": "u2", "text": "hi"}
    post '/messages', params: message, as: :json
    assert_response 201
    message = JSON.parse(response.body)['message']
    get '/messages', params: {user1: 'u1', user2: 'u2'}
    assert_response :success
    json = JSON.parse(response.body)
    messages = json['messages']
    assert_includes(messages, message)
  end

end
