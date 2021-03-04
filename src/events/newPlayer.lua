--[[ src/events/newPlayer.lua ]]--
eventNewPlayer = function(name)
    game.data[name]={
        played = 0,
        won = 0,
        lang = "EN",
        skin = 1
    }

    banned[name] = 0
    loaData(name)
    for i=0,300 do
        tfm.exec.bindKeyboard(name,i,true,true)
    end

    game.things[name]={
        delay=os.time(),
        image=tfm.exec.addImage("177d168a0b8-png.25303","!1000", 150, 100, name),
        banner=3
    }

    if not contains(game.playerCount, name) then
        table.insert(game.playerCount, name)
    end
	--game.playerCount = game.playerCount + 1
	ui.addTextArea(3, "<a href='event:menu'><p align='center'><font size='13'>"..translate(name, "menutxt").." »", name, 9, 29, 57, 22, 0x324650, 0x23343d, 1, false)	
    
    if #game.playerCount > 1 then
        game.canStart = true
        ui.removeTextArea(6854)
    elseif #game.playerCount == 2 then
        game.newGame()
        tfm.exec.newGame(maps[math.random(#maps)])
    else
        tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
    end

    if game.isRoom then
        sendMessage(translate(name,"welcome"), name)
    end

    eventTextAreaCallback(0,name,"help")
end
