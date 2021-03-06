--[[ src/events/playerLeft.lua ]]--
eventPlayerLeft = function(name)
    local n = {}

    for i,v in pairs(tfm.get.room.playerList) do if not v.isDead and not #game.playerCount==1 then table.insert(n,i) end end

    if game.potato == name then
        game.setPotato(game.highScore())
        game.currentTime = game.explosionTime * 2
    end

    if contains(game.playerCount, name) then
        table.delete(game.playerCount, name)
    end
    
    if #game.playerCount < 2 then
        game.canStart = false
        phrased=false
        tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
        for player,v in pairs(tfm.get.room.playerList) do
            sendMessage(translate(player,"minPlayers"),player)
            ui.addTextArea(6854,"<p align='center'><font size='50' face='Freestyle Script' color='#FFFFFF'>"..translate(player,"wtP"),player,449,207,nil,nil,nil,nil,0,false)
        end
        tfm.exec.newGame(game.startMap)
    else
        isAlone=false
    end
end
