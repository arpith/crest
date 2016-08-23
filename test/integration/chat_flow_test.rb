require 'test_helper'
require 'json'

class ChatFlowTest < ActionDispatch::IntegrationTest
  test "can send message" do
    message = {"sender": "u1", "receiver": "u2", "text": "hi"}
    post '/messages', params: message, as: :json
    json = JSON.parse(response.body)
    assert_response :success
    assert_equal message[:sender], json['sender']
    assert_equal message[:receiver], json['receiver']
    assert_equal message[:text], json['text']
  end

  test "can list message" do
    message = {"sender": "u1", "receiver": "u2", "text": "hi"}
    post '/messages', params: message, as: :json
    id = JSON.parse(response.body)['id']
    get '/messages', params: {user1: 'u1', user2: 'u2'}
    assert_response :success
    json = JSON.parse(response.body)
    i = json.index { |m| m['id'] == id }
    resp_message = json[i]
    assert_equal message[:sender], resp_message['sender']
    assert_equal message[:receiver], resp_message['receiver']
    assert_equal message[:text], resp_message['text']
  end

end
