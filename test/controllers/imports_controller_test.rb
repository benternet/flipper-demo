require 'test_helper'

class ImportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @list = lists(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get new_list_import_url(@list)
    assert_response :success
  end

  test "should redirect to list after create" do
    file = Rack::Test::UploadedFile.new('test/fixtures/files/import.csv')
    post list_imports_url(@list), params: { file: file }

    assert_redirected_to list_url(@list)
  end
end
