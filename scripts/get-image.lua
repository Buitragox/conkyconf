-- Example of script: echo "\${image $(playerctl metadata mpris:artUrl sed 's|file:///home/[^/]\+/|~/|') -i 0 -s 100x100}"
-- Functions need to start with "conky_"

---Place an image using ${save_coordinates c}.
---save_coordinates is not documented on https://conky.cc/variables as of Dec/07/2023
---You can find more about it here: https://github.com/brndnmtthws/conky/pull/1055
---@param c number coordinate number
---@param w number width in pixels
---@param h number heigth in pixels
---@return string output the ${image ...} statement
function conky_getMusicImageCoords(c, w, h)
    local imgPath = [[playerctl metadata mpris:artUrl | sed 's|file:///home/[^/]\+/|~/|']]
    local script = string.format([[echo "\${image $(%s) -i %d -s %dx%d}"]],
                                imgPath, c, w, h)
    local file = io.popen(script, "r")
    local output = file:read("*a"):gsub("\n", "")
    file:close()
    return output
end


---Place an image using x,y position
---@param x number x position
---@param y number y position
---@param w number width in pixels
---@param h number heigth in pixels
---@return string output the ${image ...} statement
function conky_getMusicImagePos(x, y, w, h)
    local imgPath = [[playerctl metadata mpris:artUrl | sed 's|file:///home/[^/]\+/|~/|']]
    local script = string.format([[echo "\${image $(%s) -p %d,%d -s %dx%d}"]],
                                imgPath, x, y, w, h)
    local file = io.popen(script, "r")
    local output = file:read("*a"):gsub("\n", "")
    file:close()
    return output
end
