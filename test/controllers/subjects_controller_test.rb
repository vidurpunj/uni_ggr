require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "each subject has its own page" do
    Subject.all.each do |subject|
      get subject_path(subject)
      assert_response :success
      assert_select "h1", subject.name
    end
  end

  test "landing page cards link to subject pages" do
    get root_path
    Subject.all.each do |subject|
      assert_select "a.subject-card[href=?]", subject_path(subject)
    end
  end

  test "unknown subject returns 404" do
    get "/subjects/nope"
    assert_response :not_found
  end
end
