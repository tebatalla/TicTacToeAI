# Tic-tac-toe AI

Tic-tac-toe super computer that uses binary trees and Depth First Search (DFS)
to evaluate outcomes in order to never lose :).

## Play the super computer

To play, run
```
$ ruby lib/super_computer_player.rb
```

## How does it work?
Before it makes a move, the super computer builds [child boards](./lib/tic_tac_toe_node.rb:24) that are simply all the moves the computer can make 
for that turn. The computer recursively builds further child boards of these 
boards in evaluating whether or not the end outcome of a particular child node 
could ever lead to [victory](./lib/tic_tac_toe_node.rb:11) or a 
[draw](./lib/super_computer_player.rb:1@) if there are no more winning nodes. 
