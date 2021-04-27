describe Fastlane::Actions::SimulatorAddRootCertAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The simulator_add_root_cert plugin is working!")

      Fastlane::Actions::SimulatorAddRootCertAction.run(nil)
    end
  end
end
