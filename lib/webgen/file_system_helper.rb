class FileSystemHelper

  def OutputAscii
    text = File.open('../resources/webgen_ascii.txt').read
    text.each_line do  |line|
      puts line
    end
  end

end