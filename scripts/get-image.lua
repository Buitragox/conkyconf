-- Example of script: echo "\${image $(playerctl metadata mpris:artUrl sed 's|file:///home/[^/]\+/|~/|') -p 100,100 -i 0 -s 100x100}"
-- Functions need to start with "conky_"

---Place an image using ${save_coordinates c}
---@param c number coordinate number
---@param w number width in pixels
---@param h number heigth in pixels
---@return string the ${image ...} statement
function conky_getMusicImageCoords(c, w, h)
    local imgPath = [[playerctl metadata mpris:artUrl | sed 's|file:///home/[^/]\+/|~/|']]
    local script = string.format([[echo "\${image $(%s) -i %d -s %dx%d}"]],
                                imgPath, c, w, h)
    local file = io.popen(script, "r")
    local output = file:read("*a"):gsub("\n", "")
    file:close()
    return output
end

function conky_getMusicImagePos(x, y, w, h)
    local imgPath = [[playerctl metadata mpris:artUrl | sed 's|file:///home/[^/]\+/|~/|']]
    local script = string.format([[echo "\${image $(%s) -p %d,%d -s %dx%d}"]],
                                imgPath, x, y, w, h)
    local file = io.popen(script, "r")
    local output = file:read("*a"):gsub("\n", "")
    file:close()
    return output
end
