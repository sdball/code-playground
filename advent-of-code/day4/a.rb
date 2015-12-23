require "digest/md5"

input = "iwrupvqb"

1.upto(10_000_000) do |n|
  if Digest::MD5.hexdigest("#{input}#{n}").slice(0,5) == "00000"
    puts n
    break
  end
end
