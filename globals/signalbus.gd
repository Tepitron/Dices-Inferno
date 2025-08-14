extends Node

## Emitted by UI when throw button is pressed
## Handled by Main to throw dice
signal throw_button_pressed

## Emitted by: variables.gd
## Handled by:
## - UI to change the PointsLabel's text
signal points_changed

signal dice_bought
