describe Fastlane::Actions::SimulatorAddRootCertAction do
  describe '#run' do
    context "given a single device" do
      it 'runs the correct shell commands' do
        certificate_path = "path-to-cert.pem"

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with('xcrun simctl list | grep Booted', any_args)
          .and_return("iPhone 8 (F9CC69F6-9471-47BF-8FED-2788BB391E8B) (Booted)")

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with("xcrun simctl keychain F9CC69F6-9471-47BF-8FED-2788BB391E8B add-root-cert #{certificate_path}", any_args)
          .and_return(0)

        Fastlane::Actions::SimulatorAddRootCertAction.run(certificate_path: certificate_path)
      end
    end
    context "given a multiple devices" do
      it 'runs the correct shell commands' do
        certificate_path = "path-to-cert.pem"

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with('xcrun simctl list | grep Booted', any_args)
          .and_return("iPhone 8 (F9CC69F6-9471-47BF-8FED-2788BB391E8B) (Booted)
            iPhone 11 Pro Max (D0F220A0-0293-4F7B-B991-1A7587A0DCB2) (Booted)
            iPad (7th generation) (F056F8A3-92CB-40EB-8878-2564163129D6) (Booted)")

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with("xcrun simctl keychain F9CC69F6-9471-47BF-8FED-2788BB391E8B add-root-cert #{certificate_path}", any_args)
          .and_return(0)

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with("xcrun simctl keychain D0F220A0-0293-4F7B-B991-1A7587A0DCB2 add-root-cert #{certificate_path}", any_args)
          .and_return(0)

        expect(Fastlane::Actions::SimulatorAddRootCertAction).to receive(:sh)
          .with("xcrun simctl keychain F056F8A3-92CB-40EB-8878-2564163129D6 add-root-cert #{certificate_path}", any_args)
          .and_return(0)

        Fastlane::Actions::SimulatorAddRootCertAction.run(certificate_path: certificate_path)
      end
    end
  end
end
