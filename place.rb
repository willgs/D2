# Define place class
class Place
  def initialize(name, neighbors, mrealrub, mfakerub)
    @name = name
    @neighbors = neighbors
    @mrubs = [mrealrub, mfakerub]
  end
end
