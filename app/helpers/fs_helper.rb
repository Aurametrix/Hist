module FsHelper
  def top_level(f)
    f.parent.nil?
  end
end
