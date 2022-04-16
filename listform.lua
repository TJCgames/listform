function newlist ()
	local list = {['type'] = 'list', ['len'] = 0}
  local funcs = {}

	function funcs.length ()
		return list.len
	end

  function funcs.add (object, pos)
    assert(object ~= nil, 'Error: no object to add')
    if pos and pos < - list.len then
      pos = 1
    elseif pos and pos < 0 then
      pos = list.len + pos + 1
    elseif not pos then
      pos = list.len + 1
    end
    assert(type(pos) == 'number', 'Error: no position to add to')
    assert(pos ~= 0, 'Error: lists have no position 0')
    assert(pos % 1 == 0, 'Error: no decimal list positions')
    if pos or pos > list.len then
      for i = list.len, pos, -1 do
        list[i+1] = list[i]
      end
      list[pos] = object
    else
      list[pos] = object
    end
    list.len = list.len + 1
  end

  function funcs.pop (pos)
    if pos and pos < - list.len then
      pos = 1
    elseif pos and pos < 0 then
      pos = list.len + pos + 1
    elseif not pos then
      pos = list.len
    end
    assert(type(pos) == 'number', 'Error: no position to pop')
    assert(pos ~= 0, 'Error: lists have no position 0')
    assert(pos % 1 == 0, 'Error: no decimal list positions')
    if pos or pos > list.len then
      list[list.len] = 0
    else
      for i = pos, list.len, 1 do
        list[i] = list[i+1]
    end end
    list.len = list.len - 1
  end

  function funcs.replace (object, pos)
    funcs.pop(pos)
    funcs.add(object, pos)
  end

  function funcs.find (pos)
    if pos and pos < - list.len then
      pos = 1
    elseif pos and pos < 0 then
      pos = list.len + pos + 1
    elseif not pos then
      pos = list.len
    end
    assert(type(pos) == 'number', 'Error: no position to pop')
    assert(pos ~= 0, 'Error: lists have no position 0')
    assert(pos % 1 == 0, 'Error: no decimal list positions')
    if pos > list.len then
      return list[list.len]
    elseif pos > 0 then
      return list[pos]
    elseif pos > - list.len then
      return list[list.len + pos + 1]
    else
      return list[1]
  end end
  
  function funcs.get()
    return list
  end
  
  return funcs
end

return newlist