require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class SimulatorAddRootCertHelper
      # class methods that you define here become available in your action
      # as `Helper::SimulatorAddRootCertHelper.your_method`
      #
    end
  end
end
