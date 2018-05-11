class Curlftpfs < Formula
  desc "Filesystem for accessing FTP hosts based on FUSE and libcurl"
  homepage "https://github.com/bmwiedemann/curlftpfs/"
  url "https://github.com/bmwiedemann/curlftpfs/archive/3f97a8a82c3003ffcf693334365bbd21aa9e3063.zip"
  sha256 "b8ae839a4ec61193c9ab85e8e71692bcfb2315c5d3709ed032009dfca767d169"

  head "https://github.com/bmwiedemann/curlftpfs.git", :branch => :master

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on :x11
  depends_on :osxfuse
  depends_on "glib"

  def install
    ENV.append "CPPFLAGS", "-D__off_t=off_t"
    system "autoreconf", "-fvi"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
