
# Context

This will be a shopping cart that will be built with a rigidbody 3d. The goal of the feeling of the shopping cart to have it feel goofy as we are a troll driving the shopping cart.

# Design

## Systems

  * **Driving**
      * This is the main mechanic of the cart. It consists of steering (Left Joystick), Gas (Right Trigger) and Brake (Left Trigger).
      * The shopping cart needs to be able to turn even when you are not pressing gas.
      * Holding brake when the cart is stopped will make it reverse.
      * The top speed of the shopping cart changes based on the weight of the items in the cart. The heavier the cart, the lower the top speed.
      * On downhill slopes, the cart can go above its top speed. Heavier carts speed up faster downhill than lighter carts.

  * **Drifting**
      * This system will be similar to Mario Kart drifting (no boost, just the feel).
      * The player must be above a minimum speed to enter a drift.
      * When drifting the cart will begin to slide, and while sliding the speed of the cart will decrease.

  * **Air Controls**
      * When in the air, the player can use the **Left Joystick** to do flips and spins.
      * We will record the tricks done during each jump. Based on the score, the player gets a boost when they land.
      * If the player lands badly (upside down or on their side), they get no boost.

  * **Tricks**
      * Each trick is stored as a `TrickData` resource so new tricks can be added without changing code.
      * All tricks are listed in one `TrickLibrary` resource that the cart references.
      * Each trick stores: name, axis (flip / spin / roll), direction, degrees of rotation needed, score
      * Trick data is read-only at runtime. The current rotation progress is stored on the cart, not on the resource.

  * **Self Righting**
      * If a player does not flip their cart back properly after a set amount of time, the cart will flip back over soit can drive again.
      * Flip type: The cart will rotate back to its drivable state

## Inputs

We will be using godots input system which can be accessed Project -> Project Settings -> Input Map


| Action                | Controller    | Keyboard         |
| --------------------- | ------------- | ---------------- |
| **Driving Controls**  |               |                  |
| Steer                 | Left stick    | A / D            |
| Gas                   | Right Trigger | W                |
| Break / Reverse       | Left Trigger  | S                |
| Drift                 | B             | Spacebar         |
| Air Tricks            | Left Stick    | W / S / A / D    |
|                       |               |                  |
| **Shooting Controls** |               |                  |
| Aiming                | Right Stick   | Mouse location   |
| Shoot                 | Left Bumper   | Left Mouse Click |

## Variables Needed for the Vehicle

  **Max Speed** - Float - The top speed of an empty cart (m/s). This is a fixed tuning value.

  **Max Weight Speed** - Float - How much of the Max Speed a fully loaded cart loses (for example 0.4 = a full cart has 60% of its speed). 

  **Max Weight** - Float - The weight (kg) at which the cart counts as fully loaded.

  **Acceleration** - Float - How fast the cart speeds up (m/s per second).

  **Brake Force** - Float - How fast the cart slows down when brake is pressed (m/s per second).

  **Reverse Speed** - Float - The top speed when reversing (m/s).

  **Rolling Friction** - Float - How fast the cart slows down when no pedal is pressed (m/s per second).

  **Turn Speed** - Float - How fast the cart rotates when steering (degrees per second).

  **LateralGrip** - Float - The overall grip of the cart when not drifting.

  **StationaryRearGrip** - Float - How strongly the rear wheels hold their place when the cart turns while stopped, so
  it pivots around the back wheels like a real cart.

  **MinimumDriftSpeed** - Float - The minimum speed (m/s) required for a player to drift.

  **DriftingGrip** - Float - The grip of the shopping cart during a drift.

  **DriftSpeedReduction** - Float - How much the cart's speed is reduced per second of drifting (m/s per second).

  **AirSpinRate** - Float - How fast the cart rotates in the air, used for both flips and spins (degrees per second).

  **SelfRightDelay** - Float - How long (seconds) the cart must be stuck upside down before it flips back over.




## Edge cases

  - When the cart is reversing make sure it turns the same as going forwards
  - Make sure self righting works if your on edges, up against walls or on top of an item.
  - When pressing gas and break at the same time the cart will begin to slow down. If the players speed is 0 then nothing will happen.
  - A cart will always be able to climb any slops. If they procced to go down a ramp they should go faster then a cart with no items
  - If a cart is doing tricks Items should not fall out. If they land poorly or crash items will fall out
  - If 2 carts collide they should both have a small impulse that knock them back

# Research and testing

How are you going to test this feature at different stages of development?


