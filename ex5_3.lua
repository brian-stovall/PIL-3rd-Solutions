function allbutfirst(...)
  results = {}
  args = {...}
  for i = 2, #args do
    table.insert(results, args[i])
  end
  return results
end

for _ , thing in pairs(allbutfirst(1,"whatever",3,4,"arglebargle",6,7,8,9,10)) do
  print(thing)
end
