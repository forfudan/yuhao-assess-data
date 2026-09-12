local filter = {}

function filter.init(env)
end

---@param translation Translation
---@param env Env
function filter.func(translation, env)
  for candidate in translation:iter() do
    candidate.comment = candidate.comment .. string.format("%d %d", candidate.start, candidate._end) .. " [" .. candidate.quality .. "]"
    yield(candidate)
  end
end

return filter