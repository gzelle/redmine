require "spec_helper"

describe "FileChecksums" do

  def assert_checksum(expected, filename)
    filepath = Rails.root.join(filename)
    checksum = Digest::MD5.hexdigest(File.read(filepath))
    assert checksum.in?(Array(expected)), "Bad checksum for file: #{filename}, local version should be reviewed: checksum=#{checksum}, expected=#{Array(expected).join(" or ")}"
  end
  it "should core issue model checksum" do
    # "notified_users", "visible_condition" and "visible?" methods are overridden
    # and should be reviewed if this test breaks
    # 4.0.0, 4.0.6 and 4.1.0 are ok
    assert_checksum %w(71289d390f3afbd70f0e284382875e5d 7bf3334c6f62ec6c6baec7ca883b8019 0436c38146aea3ca0be29b9a89a41dc4), "app/models/issue.rb"
  end

  # tests have been added to the issue_helper_patch_test file, no need to check the checksum
  #def test_core_issues_helper_checksum
    # "show_detail" method is overridden
    # assert_checksum %w(9ef285e8ecc7986993cd31d8bd84b156), "app/helpers/issues_helper.rb"
  #end

  it "should core query model checksum" do
    # "project_statement" method is overridden
    # and should be reviewed if this test breaks
    # 4.0.0 and 4.1.1 are ok
    assert_checksum %w(57279103006a6e28cc3fa5fedd51b637 9a8c112af47dc4f8401740e88bea52df), "app/models/query.rb"
  end

  it "should core issue query model checksum" do
    # "versions" method is overridden
    # and should be reviewed if this test breaks
    # 4.0.0, 4.0.6 and 4.1.0 are ok
    assert_checksum %w(4a37e52846b3a14ccac44e03104afa1e ef4a2baaa3a69ba6de09dd52609aff7a a5e63ecd0d6ef15580c4db80cb5ec1a1), "app/models/issue_query.rb"
  end

  it "should core edit and new form js checksum" do
    # "new.js.erb" and "edit.js.erb" are completely overridden
    # and should be reviewed if these tests breaks
    # 4.0.0 is ok
    assert_checksum %w(2567d0882238652fc51e905d6ebe4b9c), "app/views/issues/new.js.erb"
    assert_checksum %w(0a92d0609b883d43daf5e825bc08cb01), "app/views/issues/edit.js.erb"
  end

  it "should check acts_as_activity_provider" do
    # "acts_as_activity_provider.rb" is completely overridden
    # and should be reviewed if these tests breaks
    # 4.0.2 is ok
    assert_checksum %w(baf7e02c5b9c33b30d657fe2693f724e 05d45dd431e17984ad8dd93366d4eda9), "lib/plugins/acts_as_activity_provider/lib/acts_as_activity_provider.rb"
  end

end
