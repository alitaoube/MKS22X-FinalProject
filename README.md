# Plants v. Zombies (PvZ)

## Instructions

## Devlog

##### 2019/5/18
  *Ali*
    -Created LivingThing class
    -Created the zombie class, which was then made into an abstract class to allow       for easier implementation of cone and bucket zombies. The zombies were then         made moveable and displayable
    -The Collideable interface was also created to allow for collisions between           zombies and plants, and the LivingThing class implemented it.

##### 2019/5/19

Created Zombie and Plant abstract classes.
Extended Zombie and Plant classes with Peashooter and Garden Zombie classes.

Added Moveable, Displayable, and Collideable interfaces and implemented them in Zombie and Plant classes.

##### 2019/5/20

Sam - Added the sun counter and plant roster images to the setup function. Created sun class and methods in the main file that generate suns and allow the user to pick them up. When the user clicks on a sun it disappears and the sun counter goes up by 25.

##### 2019/5/21
*Ali*
- Added images for the Suns and Plants
- Implemented the font used in the actual game

Sam - Reformatted the make sun method to be based off its own timer to know when it needs to make a sun.

Also modified constructors in some classes like GardenZombie so that they only take in an x and y coordinate to make it easier to create them.

##### 2019/5/22
*Ali*
  - Worked on the collision of plants and zombies. Was not totally successfuly, as zombies sometimes glitched through the plant.
  
Sam - Added the ability to place a peashooter on the board. Also created the board class so the board will be able to add all the plants and zombi to the game. This standardizes the way plants and zombies will become part of the game so we don't actually make mistakes when adding them in in all the methods we will be doing that in.

##### 2019/5/23  
*Ali*
  - Continued working on the collision between plants and zombies. Furthered it by no longer looping through a Collideable interface     because it was unnecessary given the scarcity of things to loop through.
Sam - Made sure that the sun counter was adjusted when the user places a plant on the board. Also centered the images on the squares. Started working on the pea class and got the peashooters to shoot the zombies only when there is a zombie in their lane.

##### 2019/5/24
*Ali*
  - Added a ListOfPlants and ListOfZombies to keep track of all the things that need to be updated and displayed.
  - Added plantLanes, which is similar to the already existing zombieLanes, as it keeps track of the exact position of each plant. This  is to make collision detection easier.
  - Successfully implemented zombies colliding with plants due to the plantLanes.
Sam - Started writing a method to make the peas stop and disappear when they hit a zombie but didn't make much progress.

##### 2019/5/25
Sam - Coded the peas to stop and disappear once they hit the zombie. This involved looping through the list of all the peas on the board and determining if they are touching a zombie. Also made the sun generate at the top of the screen and then fall down until they hit a certain randomly determined point, like in the real game.

##### 2019/5/26
*Ali*
  - Changed the isTouching method to make it rely on rows and cols instead of x and y This further simplified collision detection.
  - Altered the distance that the zombie stops from the plant.
  - Randomized the drop position of the suns by implementing a finalX and finalY that were set at creation, and the starting x and y  were always the finalX and 0. The sun would then travel until it reached the finalX.
  - The plant was then given the ability to kill the zombie, which would then properly remove the zombie from the appropriate lists.
  - The sun was capped at 10
  - An update method was implemented to allow for more simplicity, as you wouldn't have to loop through move, display, collide, etc.
  
Added the feature of being able to put a sunflower on the board as well as a peashooter. This entailed reformatting the method that selected the plant to be added as well as the method that actually added the plant. These methods were reformatted in such a way that adding in other plants will be as simple as generating a constructor for that plant and importing an image.

##### 2019/5/27

Sam - merged some of the newly created plant behavior with the zombie behavior.

##### 2019/5/28

*Pair programming - to try to merge our code together so that we would both be able to work on the same version. This included starting to add update methods. The draw method was also simplified to make it easier to read, an update method was added to the sunflower class, and the zombies successfully fully stop when they hit a plant.*

##### 2019/5/29

*Ali*
  - Implemented cone Zombie class, as well as a makeConeZombie method in the Board class. 
  - Fixed an error that forced zombies to stop when an adjacent zombie was planted.
  - Moved the hitZombie method to the peas class, instead of the peashooter class.
  - Added an update method to the Peas class to detect when to update.

##### 2019/5/31

*Ali*
  - Added a bucketHead class, as well as the createBucketHead method in the Board class. 
  - Worked on allowing zombies to continue moving after they kill the plant.
  - Worked on the gameOver function. This clears the entire board after zombies make it past the last line of plants, and displays the gameOver image.
  
 *Pair programming - updated the zombie update method so that it no longer takes in a plant parameter, and instead loops through the plantLanes. Also implemented a makeSunflower method, as well as an update method to the sunflower class so that it can be eaten by zombies. Also worked on fixing redundancies with the isTouching method.*

##### 2019/6/01

*Ali*
  - Implemented the walnut class, properly resized image, and fixed the collision value.
  - Reworked collisions entirely, so that zombies check if *they* are touching the plant, instead of the other way around.
  
  
##### 2019/6/02

*Ali*
  - Finished implementing the walnut class, and merged it with the cherry class implemented by Sam.
  - Reintroduced the game ending feature.
  - Added a new sunflower image, removed the white space, and centered it.
  - Fixed an error that allowed cherry bombs to be planted regardless of sun amount.
  - Added all images for peashooter to be implemented using the *Sprite System* (to be highlighted below
  - Successfully cycled through all images for the peashooter using the sprite system.
  - Began reworking the centering of the images. Instead of using imageMode(CORNER), which placed the corner at the given x y values, used imageMode(CENTER). Did this for zombie, peashooter, sun, and walnut. 
  - Fixed the mismatched hitting of the zombies by the pea.
  
##### 2019/6/03

*Ali*
  - Completely removed the obselete modImage and replaced it with resize.
  - Added all sunflower images for the sprite system.
  - Fixed major lag caused by a hidden delay, that quickly racked up into a noticeable delay.
  - Override the display method for zombies.
  - Reworked how cone zombies are created. Instead of having their own sprites, they just use those of the garden zombie and place a hat on top.
  - Added sunflower animation using the Sprite System.
  - Reworked bucket zombies in a similar manner to cone zombies.
  - Implemented the Sprite System for the Walnut.
  - Added a kill method in the Zombie class to simplify the code substantially.
  - Implemented the zombies' hats falling off when they are injured.
  - Fixed the cherry bombs and implemented the sprite system for them.
  - Implemented the lawnmower class, which had two constructors, one that made one lawnmower, and the other that made all 5 and implemented them.
  - Implemented the moving of the lawnmower after they are triggered by the zombies, as well as them killing all the zombies in their path.
  - Fixed an error that caused the lawnmowers to ignore certain zombies.
  - Implemented the real image of the sun.
  - Added a snowpea class, as well as an Spea class, the former extended the green peashooter and the later extended the Pea class. They differed based on the image used. Also, the snowpea has to make the zombies turn blue, as well as decrease their speed temporarily, which was achieved with a timer.
  - Removed the type from the snowpea.

##### 2019/06/04

 *Ali*
   - Successfully changed the values of the zombies when they were hit by peas.
   - Reintroduced lawnmowers and the sun falling.
   - Made the zombies only turn blue and slow down for a set period of time, as well as not turn the whole screen blue.
   - Added Sprite System for snowpeas.
   - Fixed an issue that caused peashooters to quickly change size when they were touched.
   - Fixed collection of the sun by adding it to a ListOfSun.
   - Fixed an error that caused the game to crash when the last zombie in the row was hit.
   - Added potato mine class, allowed it some time to rearm, and then switch to the exploding version. The potato mine was fixed to kill itself and the zombies.
   - Implemented an image that pops up after the potato mine is activated, and an image that pops up after the cherry bomb is detonated.
   - Fixed an error that made potato mines invincible.
   - Began implemented the chomper, giving it three stages - idle, eating, and its recharge mode. Successfully implemented the chomper through this method.
   - Began implementing the shovel, and allowed it be dragged. Implemented it removing the plant when it is dragged over it.
   
   
