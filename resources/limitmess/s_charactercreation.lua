--[[
    Copyright (C) 2018  Timon Sliepenbeek

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    ]]

-- Handle character creation.
function makeCharacter( playerSource, skin, characterName )
  outputChatBox( "1", playerSource )
  --if isLoggedIn( playerSource ) == true then -- Make sure the player is logged in when using the command.
    outputChatBox( "2", playerSource )
    if skin and characterName then
      outputChatBox( "3B", playerSource )
      local status, error = createCharacter( skin, characterName )
      if status == true then -- Was the character created succesfully?
        outputChatBox( "5", playerSource )
        spawn( playerSource, skin, characterName ) -- Continue spawning the player.
      else
        -- Handle error 1 to 3
      end
    else
      outputChatBox( "3A", playerSource )
      exports.chat:displayInstructionMsg( playerSource, "/" .. commandName .. " [skin ID] [character name]")
    end
  --end
end

-- event:attemptCharacterCreation - Clientside event used to try and create a character.

-- Create a new character.
function createCharacter( skin, characterName )
  -- Check if the entered name matches all requirements for a real character name.
  if string.len( characterName ) > 1 and string.len( characterName ) < 22 and string.sub( characterName, 1, 1 ) ~= " " and characterName:match( "%A" ) then
    outputChatBox( playerSource, "charactername is ok")
    -- Create the character in the database.
      -- If something went wrong when trying to create the character in the database error is 2.
    -- Add the character to characters table.
      -- If something went wrong when trying to add the character to the characters table return 3.
    return true
  else
    return false, 1 -- Returns 1 if the charactername was wrong
end

-- Spawn character into the world.
function spawn( playerSource, skin, characterName )
  spawnPlayer( playerSource, 0, 0, 0, 0, skin )
  setPlayerName( playerSource, characterName )
  -- Set the player as logged in.
end
