--Utilities File

function mem_read(addr)
    return memory.readbyte(addr);
end

function disp_text(offset, text)
    local REAL_OFF = 9;
    gui.text(0, offset*REAL_OFF, text);
end

function random_bool()
    return math.random(1, 10) > 5;
end

function gauss_rand(minv, maxv, fh)
    return math.floor((minv + (maxv - minv) * math.random()^fh));
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function contains_winner(table)
    for i=1,#table do
        if table[i].has_won then
            return true;
        end
    end
    return false;
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function bti(bl)
    return (bl and 1) or 0
end

function btis(bl)
    return (bl and "1") or "0"
end

function ctrl_tbl_btis(tbl)
    return (
        btis( tbl.up    )..
        btis( tbl.down  )..
        btis( tbl.left  )..
        btis( tbl.right )..
        btis( tbl.A     )..
        btis( tbl.B     ))
end
