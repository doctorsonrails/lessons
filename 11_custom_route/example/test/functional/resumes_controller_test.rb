require 'test_helper'

class ResumesControllerTest < ActionController::TestCase
  setup do
    @resume_section = resume_sections(:one)
    @resume_section = resume_sections(:two)
    @resume_section = resume_sections(:three)
  end

  test "should get index" do
    get :show
    assert_response :success
    assert_not_nil assigns(:resume_sections)
  end
end