require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "project test" do
		pj = Project.find(1)
		
		assert_equal pj.currentRevision.size, 5,        'current Revision size is not 5'
		assert_equal pj.currentEvm.id, 5,               'current Evm is not 5'
		
		tmp = pj.currentRevision.map{|evm| evm.revision}
		assert_equal tmp, [1, 1, 1, 2, 2]
	end

  # test "the truth" do
  #   assert true
  # end
end
