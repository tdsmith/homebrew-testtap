require 'formula'

class Sometrash < Formula
  homepage 'http://hasseg.org/trash/'
  url 'https://github.com/ali-rantakari/trash/archive/v0.8.4.tar.gz'
  sha1 'e70ebeba684fd1fd126d912e3528115fbb2fb7be'

  resource "emoji" do
    url "https://gist.githubusercontent.com/tdsmith/e8b46f5a7ce49b63fb7f/raw/2ca68554549ff98e1109414c0f2623b3a5c81e5f/utf16-emoji.Md"
    sha1 "24cb9e418d1db2a05ce07ce9383ada9d360e93c3"
  end

  conflicts_with 'osxutils', :because => 'both install a trash binary'

  def install
    system "make"
    system "make docs"
    bin.install "trash"
    man1.install "trash.1"
  end

  test do
    resource("emoji").stage(testpath)
    system "cat", "utf16-emoji.Md"
    system "#{bin}/trash", "utf16-emoji.Md"
  end
end
