# Common Git Commands

## Updating and Syncing

- `git pull`: Fetch and merge changes from a remote repository.

## Making Changes - Should be done in this order

- `git add .`: Stage a file for commit.
- `git commit -m "Commit message"`: Commit your changes with a descriptive message.
- `git push`: Push your commits to a remote repository.

- `git status`: Check the status of your repository and see which files have changed. Use this command if you are stuck, it can point you in the right direction.

## Additional GearSwap Commands

- `//gs r`: Reload the GearSwap addon.
- `//gs export`: Export your current GearSwap settings.
- `//lua load gearswap`: Load the GearSwap Lua script.
- `//lua unload gearswap`: Unload the GearSwap Lua script.
- `//exec init`: Execute the GearSwap initialization script.

- `//gs disable sub`: Disable sub weapon in GearSwap.
- `//gs disable main`: Disable main weapon in GearSwap.
- `//gs enable sub`: Enable sub weapon in GearSwap.
- `//gs enable main`: Enable main weapon in GearSwap.

## GearSwap Additional Commands

- `//lua u gearswap`: Update the GearSwap Lua script.
- `//lua l gearswap`: Load the GearSwap Lua script.
- `//gs r`: Reload the GearSwap addon.
- `//gs export`: Export your current GearSwap settings.
- `//gs disable ring1`: Disable ring1 in GearSwap.
- `//gs enable ring1`: Enable ring1 in GearSwap.
- `//gs equip sets.name`: Equip the gear set named "name".

## GearSwap Input Commands

- `^`: Ctrl
- `!`: Alt
- `@`: Win
- `#`: Apps
- `~`: Shift

## Misc. commands

- `//gs disable sub`, `//gs disable main`, `//gs enable sub`, `//gs enable main`
- `//sm save`
- //put this in windower/scripts folder and then in game type //exec seal
- `//send @all input /item \"Abdhaljs Seal\" <me>`

- `//gs equip sets.precast.RA`

- `//gs c burstmode`
- `/console gs c burstmode` : Put this in a macro
- `//gs showswaps` will show equipment swaps for each state

- `//switch to fudo` switch between characters
- `//gs showswaps` Shows when your gear successfully changes and what it changes to

## Macro Send commands

- `/console send Rialyn /item 'PoisonPotion' <me>` : Tell character to do something from a Macro
- `send @all input /item 'Item' <me>` : all characters to use item
