require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "root renders the landing page" do
    get root_path
    assert_response :success
    assert_select "h1", /third semester law/
    assert_select ".subject-card", Subject.all.size
    assert_select "#datesheet tbody tr", Exam.all.size
    assert_select "#datesheet td", "10/12/2026"
  end
end
