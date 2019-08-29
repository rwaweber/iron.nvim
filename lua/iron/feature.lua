local feature = {}
features._store = {}

features.enable = function(flag)
  features._store[flag] = true
end

features.disable = function(flag)
  features._store[flag] = false
end

features.check = function(flag)
  return features._store[flag] or false
end


return feature
