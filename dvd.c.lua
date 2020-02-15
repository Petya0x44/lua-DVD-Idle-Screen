local screen_w, screen_h = guiGetScreenSize()

local img_w, img_h = 150, 68

-- LEFT
local lx, ly = math.random(0, screen_w/2), math.random(0, screen_h) -- начальная позиция логотипа на левой стороне экрана
local lsp = 5 -- скорость перемещения логотипа
local mlx, mly = lsp, lsp -- направление движения логотипа
local lclr = tocolor(255, 255, 255, 255) -- начальный цвет логотипа

-- RIGHT
local rx, ry = math.random(screen_w/2, screen_w), math.random(0, screen_h) -- начальная позиция лого на правой стороне экрана
local rsp = 5 -- скорость перемещения логотипа
local mrx, mry = rsp, rsp -- направление движения логотипа
local rclr = tocolor(255, 255, 255, 255) -- начальный цвет логотипа

local function getRandColor()
	return tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)
end

showChat(false)

addEventHandler("onClientRender", root, function ()
	-- LEFT
	
	dxDrawRectangle(0, 0, screen_w/2, screen_h, tocolor(20, 0, 0, 255))
	
	lx = lx + mlx
	if lx > screen_w/2 - img_w then
		lx = screen_w/2 - img_w
		mlx = -lsp
		lclr = getRandColor()
	elseif lx < 0 then
		lx = 0
		mlx = lsp
		lclr = getRandColor()
	end
	
	ly = ly + mly
	if ly > screen_h - img_h then
		ly = screen_h - img_h
		mly = -lsp
		lclr = getRandColor()
	elseif ly < 0 then
		ly = 0
		mly = lsp
		lclr = getRandColor()
	end
	
	dxDrawImage(lx, ly, img_w, img_h, 'dvd.png', 0, 0, 0, lclr)
	
	-- RIGHT
	
	dxDrawRectangle(screen_w/2, 0, screen_w/2, screen_h, tocolor(0, 0, 20, 255))
	
	rx = rx + mrx
	if rx > screen_w - img_w then
		rx = screen_w - img_w
		mrx = -rsp
		rclr = getRandColor()
	elseif rx < screen_w/2 then
		rx = screen_w/2
		mrx = rsp
		rclr = getRandColor()
	end
	
	ry = ry + mry
	if ry > screen_h - img_h then
		ry = screen_h - img_h
		mry = -rsp
		rclr = getRandColor()
	elseif ry < 0 then
		ry = 0
		mry = rsp
		rclr = getRandColor()
	end
	
	dxDrawImage(rx, ry, img_w, img_h, 'dvd.png', 0, 0, 0, rclr)
end)