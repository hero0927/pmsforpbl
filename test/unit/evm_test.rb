require 'test_helper'

class EvmTest < ActiveSupport::TestCase
	test "evm nil" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => 656
			})
		assert_nil evm.ev,   'ev not nil'
		assert_nil evm.ac,   'ac not nil'
		assert_nil evm.sv,   'sv not nil'
		assert_nil evm.cv,   'cv not nil'
		assert_nil evm.spi,  'spi not nil'
		assert_nil evm.cpi,  'cpi not nil'
		assert_nil evm.cr,   'cr not nil'
		assert_nil evm.pc,   'pc not nil'
		assert_nil evm.eac,  'eac not nil'
		assert_nil evm.tcpi, 'tcpi not nil'
		assert_nil evm.teac, 'teac not nil'
		assert_nil evm.tvac, 'tvac not nil'
		assert_nil evm.estimated_completion_date, 'estimated_completion_date not nil'
	end
	
	test "pv less than zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => -100
			})
		assert !evm.save, 'Success to save'
	end
	
	test "pv near by zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => -0.1
		})
		assert !evm.save, 'Success to save'
		
		evm.pv = 0
		assert evm.save, 'Failed to save'
		
		evm.pv = 0.1
		assert evm.save, 'Failed to save'
	end
	
	test "bac less than zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => -100,
			:pv  => 656
			})
		assert !evm.save, 'Success to save'
	end
	
	test "bac near by zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => -1,
			:pv  => 656
		})
		assert !evm.save, 'Success to save'
		
		evm.bac = 0
		assert !evm.save, 'Success to save'
		
		evm.bac = 1
		assert evm.save, 'Failed to save'
	end
	
	test "sac less than zero" do
		evm = Evm.new({
			:sac => -100,
			:bac => 656,
			:pv  => 656
		})
		assert !evm.save, 'Success to save'
	end
	
	test "sac near by zero" do
		evm = Evm.new({
			:sac => -1,
			:bac => 656,
			:pv  => 656
		})
		assert !evm.save, 'Success to save'
		
		evm.sac = 0
		assert !evm.save, 'Success to save'
		
		evm.sac = 1
		assert evm.save, 'Failed to save'
	end
	
	test "ev ac not nil" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => 340,
			:ev  => 322.6,
			:ac  => 342.96
		})
		assert_not_nil evm.ev, 'ev nil'
		assert_not_nil evm.ac, 'ac nil'
		assert_equal   evm.sv,   (evm.ev - evm.pv),   'sv not correct'
		assert_equal   evm.cv,   (evm.ev - evm.ac),   'cv not correct'
		assert_equal   evm.spi,  (evm.ev / evm.pv),   'spi not correct'
		assert_equal   evm.cpi,  (evm.ev / evm.ac),   'cpi not correct'
		assert_equal   evm.cr,   (evm.spi * evm.cpi), 'cr not correct'
		assert_equal   evm.pc,   (evm.ev / evm.bac * 100), 'pc not correct'
		assert_equal   evm.eac,  (evm.bac / evm.cpi), 'eac not correct'
		assert_equal   evm.tcpi, ((evm.bac - evm.ev) / (evm.bac - evm.ac)), 'tcpi not correct'
		assert_equal   evm.teac, (evm.sac / evm.spi),  'teac not correct'
		assert_equal   evm.tvac, (evm.sac - evm.teac), 'tvac not correct'
	end
	
	test "pv equals zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => 0.0,
			:ev  => 322.6,
			:ac  => 342.96
		})
		assert_nil evm.spi,  'spi not nil'
		assert_nil evm.cr,   'cr not nil'
		assert_nil evm.teac, 'teac not nil'
		assert_nil evm.tvac, 'tvac not nil'
	end
	
	test "ev equals zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => 340,
			:ev  => 0,
			:ac  => 342.96
		})
		assert_nil evm.eac,  'eac not nil'
		assert_nil evm.teac, 'teac not nil'
		assert_nil evm.tvac, 'tvac not nil'
	end
	
	test "ac equals zero" do
		evm = Evm.new({
			:sac => 116,
			:bac => 656,
			:pv  => 340,
			:ev  => 322.6,
			:ac  => 0
		})
		assert_nil evm.cpi, 'cpi not nil'
		assert_nil evm.cr,  'cr not nil'
		assert_nil evm.eac, 'eac not nil'
	end
end
