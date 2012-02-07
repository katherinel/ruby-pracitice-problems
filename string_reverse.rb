#!/usr/bin/env ruby

def string_reverse(input_string)
  l = input_string.length
  while l > 0
    l -= 1
    print input_string[l,1]
  end
end

string_reverse("Katherine")