class Kfctl < Formula
  desc "Kubeflow CLI tool"
  homepage "https://www.kubeflow.org"
  url "https://github.com/kubeflow/kubeflow/releases/download/v0.6.2/kfctl_v0.6.2_darwin.tar.gz"
  version "0.6.2"
  sha256 "3e409fad6cf040cd1fbc1ffeb0c47862528e1595e0dde70730d994b0a4b7e3dd"
  head "https://github.com/kubeflow/kubeflow.git"

  bottle :unneeded

  depends_on "kubernetes-cli"

  def install
    bin.install "kfctl"
  end

  test do
    ohai "Verify that `kfctl version` contains \"kfctl v#{version}\" ..."
    assert_match "kfctl v#{version}", shell_output("#{bin}/kfctl version 2>&1")

    ohai "Verify that `kfctl --help` contains \"Available Commands\" ..."
    assert_match "Available Commands", shell_output("#{bin}/kfctl --help 2>&1")
  end
end
