require 'fastlane/action'
require_relative '../helper/simulator_add_root_cert_helper'

module Fastlane
  module Actions
    class SimulatorAddRootCertAction < Action
      def self.run(params)
        uuid_regex = /[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/

        certificate_path = params[:certificate_path]
        UI.user_error!("Couldn't find certificate") if certificate_path.nil?
        UI.user_error!("Couldn't find certificate at path `#{certificate_path}`") unless File.exist?(certificate_path)

        simulators = Actions.sh("xcrun simctl list | grep Booted", error_callback: ->(result) {
          UI.crash!("Could not detect any Booted simulators. Check that `xcrun simctl list` is working.")
        }) 

        simulators.scan(uuid_regex).each { |uuid|
          Actions.sh "xcrun simctl keychain #{uuid} add-root-cert #{certificate_path}"
        }
      end

      def self.description
        "Easily add a root cert to your simulators with Fastlane"
      end

      def self.authors
        ["Nico Richard"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
        # No return value
      end

      def self.details
        # Optional:
        "Xcode command line tools `simctl` abstraction to allow for automated installation of certificates into your simulators. For SSL proxying, and corporate security."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :certificate_path,
                                  env_name: "SIMULATOR_ADD_ROOT_CERT_PATH",
                               description: "Relative path to a root certificate",
                                  optional: false,
                                      type: String)          
        ]
      end

      def self.is_supported?(platform)
        [:ios].include?(platform)
      end
    end
  end
end
