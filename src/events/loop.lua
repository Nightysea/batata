--[[ src/events/loop.lua ]]-- 
eventLoop = function(current, remaining)
    if tfm.get.room.xmlMapInfo and tfm.get.room.xmlMapInfo.mapCode==game.startMap and #game.playerCount>=2 then
        tfm.exec.newGame(game.maps[math.random(#game.maps)])
    end
 
    for n in pairs(tfm.get.room.playerList) do
        if banned[n]==1 then
            ui.addTextArea(555555, "", n, -300, -16, 3000, 3000, 0x000001, 0x000001, 1, false)
            ui.addTextArea(555556, "<B><R>BAN</R></B>", n, 400, 200, nil, nil, nil, nil, 1, false)
        end
    end
 
    if #game.playerCount > 1 then
        game.canStart = true
        ui.removeTextArea(6854)
    else
        if not phrased then
            tfm.exec.setUIMapName(game.phrases[math.random(#game.phrases)])
            phrased=true
        end
    end
 
    if game.canStart then
        ui.removeTextArea(6854)
        if tfm.get.room.xmlMapInfo then
            ui.setMapName("#batata <G>| <J>"..tfm.get.room.xmlMapInfo.author.."<G> - @"..tfm.get.room.xmlMapInfo.mapCode)
        else
            ui.setMapName("#batata<G> - @0")
        end
        
        if game.isStarted then
 
            local alive, Alive = 0, {}
 
            for name, player in pairs(tfm.get.room.playerList) do
                if not player.isDead then
                    alive = alive + 1
                    Alive = name
                end
            end
 
            if alive == 1 then
                game.isFinished = true
 
                for i,v in pairs(tfm.get.room.playerList) do
                    sendMessage(translate(i,"finishedRound"):format(Alive), i)
                end
 
                tfm.exec.giveCheese(Alive)
                tfm.exec.playerVictory(Alive)
                tfm.exec.setGameTime(6)
 
                
            end
 
            if remaining <= 0 then game.newGame() end
 
            if not game.isFinished then
            ui.addTextArea(10, "<p align=\"center\"><font size=\"25\"><J><B>"..math.floor(game.currentTime/2), nil, 367, 355, 46, 39, 0x000001, 0x000000, 0.8, false)
            game.currentTime = game.currentTime - 1
 
            local particles = {2, 13}
            for i = 1, 3 do
                if tfm.get.room.playerList[game.potato] then
                    tfm.exec.displayParticle(particles[math.random(#particles)], tfm.get.room.playerList[game.potato].x or 1, tfm.get.room.playerList[game.potato].y - math.random(5, 15) or 1, math.random(-2, 2), math.random(-2, 2))
                end 
            end
 
            if game.currentTime == 0 then
                if alive == 2 then
                    game.currentTime = game.explosionTime * 2
                    tfm.exec.killPlayer(game.potato)
 
                    local i = 1
                    while(game.potato == Alive) do
                        i = i + 1
                    end
 
                    game.isFinished = true
                    tfm.exec.giveCheese(Alive)
                    tfm.exec.playerVictory(Alive)
                    tfm.exec.setGameTime(6)
 
                    for k,v in pairs(tfm.get.room.playerList) do
                        sendMessage(translate(k,"finishedRound"):format(Alive), k)
                        
                    end
                else
                    game.currentTime = game.explosionTime * 2
                    tfm.exec.killPlayer(game.potato)
                end
            end
        end
    else
        if current >= 5000 then
            game.setPotato(game.highScore())
            game.isStarted = true
            if game.potato then
                tfm.exec.setPlayerScore(game.potato, 0) end
            end
        end
    end
end
