# Plants v. Zombies (PvZ)

## Instructions

## Devlog

#### 2019/5/18
  *Ali*
    -Created LivingThing class
    -Created the zombie class, which was then made into an abstract class to allow       for easier implementation of cone and bucket zombies. The zombies were then         made moveable and displayable
    -The Collideable interface was also created to allow for collisions between           zombies and plants, and the LivingThing class implemented it.

#### 2019/5/19

Created Zombie and Plant abstract classes.
Extended Zombie and Plant classes with Peashooter and Garden Zombie classes.

Added Moveable, Displayable, and Collideable interfaces and implemented them in Zombie and Plant classes.

### 2019/5/20

Sam - Added the sun counter and plant roster images to the setup function. Created sun class and methods in the main file that generate suns and allow the user to pick them up. When the user clicks on a sun it disappears and the sun counter goes up by 25.

### 2019/5/21
*Ali*
- Added images for the Suns and Plants
- Implemented the font used in the actual game

Sam - Reformatted the make sun method to be based off its own timer to know when it needs to make a sun.

Also modified constructors in some classes like GardenZombie so that they only take in an x and y coordinate to make it easier to create them.

### 2019/5/22
*Ali*
  - Worked on the collision of plants and zombies. Was not totally successfuly, as     zombies sometimes glitched through the plant.
Sam - Added the ability to place a peashooter on the board. Also created the board class so the board will be able to add all the plants and zombi to the game. This standardizes the way plants and zombies will become part of the game so we don't actually make mistakes when adding them in in all the methods we will be doing that in.

### 2019/5/23  
*Ali*
  -Continued working on the collision between plants and zombies. Furthered it by      no longer looping through a Collideable interface because it was unnecessary        given the scarcity of things to loop through.
Sam - Made sure that the sun counter was adjusted when the user places a plant on the board. Also centered the images on the squares. Started working on the pea class and got the peashooters to shoot the zombies only when there is a zombie in their lane.

### 2019/5/24
*Ali*
  -Added a ListOfPlants and ListOfZombies to keep track of all the things that need    to be updated and displayed.
  -Added plantLanes, which is similar to the already existing zombieLanes, as it      keeps track of the exact position of each plant. This is to make collision          detection easier.
  -Successfully implemented zombies colliding with plants due to the plantLanes.
Sam - Started writing a method to make the peas stop and disappear when they hit a zombie but didn't make much progress.

### 2019/5/25
Sam - Coded the peas to stop and disappear once they hit the zombie. This involved looping through the list of all the peas on the board and determining if they are touching a zombie. Also made the sun generate at the top of the screen and then fall down until they hit a certain randomly determined point, like in the real game.

### 2019/5/26
*Ali*
  -Changed the isTouching method to make it rely on rows and cols instead of x and    y. This further simplified collision detection.
  -Altered the distance that the zombie stops from the plant.
  -Randomized the drop position of the suns by implementing a finalX and finalY       that were set at creation, and the starting x and y were always the finalX and 0.   The sun would then travel until it reached the finalX.
Added the feature of being able to put a sunflower on the board as well as a peashooter. This entailed reformatting the method that selected the plant to be added as well as the method that actually added the plant. These methods were reformatted in such a way that adding in other plants will be as simple as generating a constructor for that plant and importing an image.

### 2019/5/27

Sam - merged some of the newly created plant behavior with the zombie behavior.

### 2019/5/28

Sam - Pair programmed with Ali to try to merge our code together so that we would both be able to work on the same version

### 2019/5/29

Sam - Pair programmed with Ali in class to try to standardize out code to make it easier to add new features on. This included starting to add update methods to all objects that change throughout the program to make it easier to modify their behavior.

### 2019/5/30

Sam - Pair programmed with Ali in class to get the zombies to stop when they hit a plant. At home I simplified the draw method in order to make it easier to read. I also added an update method to the sunflower class so the zombies eat it now. I was able to merge all of this behavior to the master so that me and Ali can continue from the same place.
