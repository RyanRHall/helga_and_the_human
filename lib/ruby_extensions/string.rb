class String
  def digest
    Digest::SHA256.hexdigest self
  end
end
