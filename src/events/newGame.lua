--[[ src/events/newGame.lua ]]--
eventNewGame = function()
    phrased=false
    game.round=game.round+1

    if game.round<=1 then
        for a,b in pairs(tfm.get.room.playerList) do
            tfm.exec.addImage("177d168a0b8-png.25303","&-1000", 150, 100, a, -1000)
            system.newTimer(function() tfm.exec.removeImage(-1000, a) end, 3000, false)
        end
    end

    for n,p in pairs(tfm.get.room.playerList) do
        system.newTimer(function() 
            if #game.playerCount>3 then
                game.data[n].played=game.data[n].played+1
                savData(n)
            end
        end, 500, false)
    end

    if game.canStart then
        ui.removeTextArea(6854)
        tfm.exec.setGameTime(#game.playerCount*20)
        game.delay = os.time()
        game.isStarted = false
        game.isFinished = false
        game.currentTime = game.explosionTime * 2
    end
end
