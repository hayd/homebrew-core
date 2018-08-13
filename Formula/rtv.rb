class Rtv < Formula
  include Language::Python::Virtualenv

  desc "Command-line Reddit client"
  homepage "https://github.com/michael-lazar/rtv"
  url "https://github.com/michael-lazar/rtv/archive/v1.24.0.tar.gz"
  sha256 "8a792c6112e27876a48db09c18fe3032734066193d6c79614d7df1b83f48e744"
  head "https://github.com/michael-lazar/rtv.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "84adcb966d887fefc66d119731fdebce84c868085c924fcc3cc9b4782431b836" => :high_sierra
    sha256 "dc55c0463214a305eace7fc3521af4925d2768d7798ed9af689388dc9aaf41a3" => :sierra
    sha256 "0af2d7c42cbbabc5e4489b75f5821604d3dff0e005ba6cf567568887d49c7976" => :el_capitan
  end

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", name
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/rtv", "--version"
  end
end
