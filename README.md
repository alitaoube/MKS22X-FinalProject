# Plants v. Zombies (PvZ)

## Instructions

## Devlog

### 2019/5/18

Created LivingThing class

### 2019/5/19

Created Zombie and Plant abstract classes.
Extended Zombie and Plant classes with Peashooter and Garden Zombie classes.

Added Moveable, Displayable, and Collideable interfaces and implemented them in Zombie and Plant classes.

### 2019/5/20

Added the sun counter and plant roster images to the setup function. Created sun class and methods in the main file that generate suns and allow the user to pick them up. When the user clicks on a sun it disappears and the sun counter goes up by 25.

### 2019/5/21
Reformatted the make sun method to be based off its own timer to know when it needs to make a sun. Also modified constructors in some classes like GardenZombie so that they only take in an x and y coordinate to make it easier to create them.

### 2019/5/22
Added the ability to place a peashooter on the board. Also created the board class so the board will be able to add all the plants and zombi to the game. This standardizes the way plants and zombies will become part of the game so we don't actually make mistakes when adding them in in all the methods we will be doing that in.

### 2019/5/23
Made sure that the sun counter was adjusted when the user places a plant on the board. Also centered the images on the squares. Started working on the pea class and got the peashooters to shoot the zombies only when there is a zombie in their lane.

### 2019/5/24
Started writing a method to make the peas stop and disappear when they hit a zombie but didn't make much progress.

### 2019/5/25
Coded the peas to stop and disappear once they hit the zombie. This involved looping through the list of all the peas on the board and determining if they are touching a zombie. Also made the sun generate at the top of the screen and then fall down until they hit a certain randomly determined point, like in the real game.

### 2019/26/2019
Added the feature of being able to put a sunflower on the board as well as a peashooter. This entailed reformatting the method that selected the plant to be added as well as the method that actually added the plant. These methods were reformatted in such a way that adding in other plants will be as simple as generating a constructor for that plant and importing an image.
