require 'test_helper'

class DataFactoryTest < ActiveSupport::TestCase

	test "pv_graph_factory" do
		project = Project.find(1)
		param       = Hash.new
		param[:project] = project
		assert_equal PV_GraphFactory.new.getSlideData(param).data, {"PV" => project.currentRevision.map{|evm| evm.pv}}, 'pv'
	end
	
	test "ev_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal EV_GraphFactory.new.getSlideData(param).data, {"EV" => project.currentRevision.map{|evm| evm.ev}}, 'ev'
	end
	
	test "ac_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal AC_GraphFactory.new.getSlideData(param).data, {"AC" => project.currentRevision.map{|evm| evm.ac}}, 'ac'
	end
	
	test "pv_ev_ac_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		tmp = {"PV" => project.currentRevision.map{|evm| evm.pv},
		       "EV" => project.currentRevision.map{|evm| evm.ev},
		       "AC" => project.currentRevision.map{|evm| evm.ac}
		      }
		assert_equal PV_EV_AC_GraphFactory.new.getSlideData(param).data, tmp, 'pv_ev_ac'
	end
	
	test "sv_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal SV_GraphFactory.new.getSlideData(param).data, {"SV" => project.currentRevision.map{|evm| evm.sv}}, 'sv'
	end
	
	
	test "cv_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal CV_GraphFactory.new.getSlideData(param).data, {"CV" => project.currentRevision.map{|evm| evm.cv}}, 'cv'
	end
	
	
	test "sv_cv_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		tmp = {"SV" => project.currentRevision.map{|evm| evm.sv},
		       "CV" => project.currentRevision.map{|evm| evm.cv},
		      }
		assert_equal SV_CV_GraphFactory.new.getSlideData(param).data, tmp, 'sv_cv'
	end
	
	
	test "spi_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal SPI_GraphFactory.new.getSlideData(param).data, {"SPI" => project.currentRevision.map{|evm| evm.spi}}, 'spi'
	end
	
	
	test "cpi_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal CPI_GraphFactory.new.getSlideData(param).data, {"CPI" => project.currentRevision.map{|evm| evm.cpi}}, 'cpi'
	end
	
	test "cr_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal CR_GraphFactory.new.getSlideData(param).data, {"CR" => project.currentRevision.map{|evm| evm.cr}}, 'cr'
	end
	
	test "spi_cpi_cr_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		tmp = {"SPI" => project.currentRevision.map{|evm| evm.spi},
		       "CPI" => project.currentRevision.map{|evm| evm.cpi},
		       "CR"  => project.currentRevision.map{|evm| evm.cr},
		      }
		assert_equal SPI_CPI_CR_GraphFactory.new.getSlideData(param).data, tmp, 'spi_cpi_cr'
	end
	
	test "pc_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal PC_GraphFactory.new.getSlideData(param).data, {"PC" => project.currentRevision.map{|evm| evm.pc}}, 'pc'
	end
	
	test "eac_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal EAC_GraphFactory.new.getSlideData(param).data, {"EAC" => project.currentRevision.map{|evm| evm.eac}}, 'eac'
	end
	
	test "tcpi_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal TCPI_GraphFactory.new.getSlideData(param).data, {"TCPI" => project.currentRevision.map{|evm| evm.tcpi}}, 'tcpi'
	end
	
	test "teac_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal TEAC_GraphFactory.new.getSlideData(param).data, {"TEAC" => project.currentRevision.map{|evm| evm.teac}}, 'teac'
	end
	
	test "tvac_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal TVAC_GraphFactory.new.getSlideData(param).data, {"TVAC" => project.currentRevision.map{|evm| evm.tvac}}, 'tvac'
	end
	
	test "estimeted_completion_date_graph_factory" do
		project         = Project.find(1)
		param           = Hash.new
		param[:project] = project
		assert_equal EstimatedCompletionDate_GraphFactory.new.getSlideData(param).data, {"Estimated_Completion_Date" => project.currentRevision.map{|evm| evm.estimated_completion_date}}, 'e_c_d'
	end
	
end
