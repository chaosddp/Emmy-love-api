---@meta love.physics

---@class love.physics
---Can simulate 2D rigid body physics in a realistic manner. This module is based on Box2D, and this API corresponds to the Box2D API as closely as possible.
local m = {}

--region Body

---@class Body
---Bodies are objects with velocity and position.
local Body = {}
--endregion Body

--region ChainShape

---@class ChainShape
---A ChainShape consists of multiple line segments. It can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.
---
---Unlike the PolygonShape, the ChainShape does not have a vertices limit or has to form a convex shape, but self intersections are not supported.
local ChainShape = {}
---Returns a child of the shape as an EdgeShape.
---@deprecated 
---@param index number @The index of the child.
---@return EdgeShape shape The child as an EdgeShape.
function ChainShape:getChildEdge(index) end

---Gets the vertex that establishes a connection to the next shape.
---
---Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@return number x The x-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
---@return number y The y-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called.
function ChainShape:getNextVertex() end

---Returns a point of the shape.
---@param index number @The index of the point to return.
---@return number x The x-coordinate of the point.
---@return number y The y-coordinate of the point.
function ChainShape:getPoint(index) end

---Returns all points of the shape.
---@return number x1 The x-coordinate of the first point.
---@return number y1 The y-coordinate of the first point.
---@return number x2 The x-coordinate of the second point.
---@return number y2 The y-coordinate of the second point.
function ChainShape:getPoints() end

---Gets the vertex that establishes a connection to the previous shape.
---
---Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@return number x The x-component of the vertex, or nil if ChainShape:setPreviousVertex hasn't been called.
---@return number y The y-component of the vertex, or nil if ChainShape:setPreviousVertex hasn't been called.
function ChainShape:getPreviousVertex() end

---Returns the number of vertices the shape has.
---@return number count The number of vertices.
function ChainShape:getVertexCount() end

---Sets a vertex that establishes a connection to the next shape.
---
---This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@param x number @The x-component of the vertex.
---@param y number @The y-component of the vertex.
function ChainShape:setNextVertex(x, y) end

---Sets a vertex that establishes a connection to the previous shape.
---
---This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@param x number @The x-component of the vertex.
---@param y number @The y-component of the vertex.
function ChainShape:setPreviousVertex(x, y) end

--endregion ChainShape

--region CircleShape

---@class CircleShape
---Circle extends Shape and adds a radius and a local position.
local CircleShape = {}
---Gets the center point of the circle shape.
---@return number x The x-component of the center point of the circle.
---@return number y The y-component of the center point of the circle.
function CircleShape:getPoint() end

---Gets the radius of the circle shape.
---@return number radius The radius of the circle
function CircleShape:getRadius() end

---Sets the location of the center of the circle shape.
---@param x number @The x-component of the new center point of the circle.
---@param y number @The y-component of the new center point of the circle.
function CircleShape:setPoint(x, y) end

---Sets the radius of the circle.
---@param radius number @The radius of the circle
function CircleShape:setRadius(radius) end

--endregion CircleShape

--region Contact

---@class Contact
---Contacts are objects created to manage collisions in worlds.
local Contact = {}
---Gets the child indices of the shapes of the two colliding fixtures. For ChainShapes, an index of 1 is the first edge in the chain.
---Used together with Fixture:rayCast or ChainShape:getChildEdge.
---@return number indexA The child index of the first fixture's shape.
---@return number indexB The child index of the second fixture's shape.
function Contact:getChildren() end

---Gets the two Fixtures that hold the shapes that are in contact.
---@deprecated replaced with: Contact:getShapes
---@return Fixture fixtureA The first Fixture.
---@return Fixture fixtureB The second Fixture.
function Contact:getFixtures() end

---Get the friction between two shapes that are in contact.
---@return number friction The friction of the contact.
function Contact:getFriction() end

---Get the normal vector between two shapes that are in contact.
---
---This function returns the coordinates of a unit vector that points from the first shape to the second.
---@return number nx The x component of the normal vector.
---@return number ny The y component of the normal vector.
function Contact:getNormal() end

---Returns the contact points of the two colliding fixtures. There can be one or two points.
---@return number x1 The x coordinate of the first contact point.
---@return number y1 The y coordinate of the first contact point.
---@return number x2 The x coordinate of the second contact point.
---@return number y2 The y coordinate of the second contact point.
function Contact:getPositions() end

---Get the restitution between two shapes that are in contact.
---@return number restitution The restitution between the two shapes.
function Contact:getRestitution() end

---Returns whether the contact is enabled. The collision will be ignored if a contact gets disabled in the preSolve callback.
---@return boolean enabled True if enabled, false otherwise.
function Contact:isEnabled() end

---Returns whether the two colliding fixtures are touching each other.
---@return boolean touching True if they touch or false if not.
function Contact:isTouching() end

---Resets the contact friction to the mixture value of both fixtures.
function Contact:resetFriction() end

---Resets the contact restitution to the mixture value of both fixtures.
function Contact:resetRestitution() end

---Enables or disables the contact.
---@param enabled boolean @True to enable or false to disable.
function Contact:setEnabled(enabled) end

---Sets the contact friction.
---@param friction number @The contact friction.
function Contact:setFriction(friction) end

---Sets the contact restitution.
---@param restitution number @The contact restitution.
function Contact:setRestitution(restitution) end

--endregion Contact

--region DistanceJoint

---@class DistanceJoint
---Keeps two bodies at the same distance.
local DistanceJoint = {}
---Gets the damping ratio.
---@return number ratio The damping ratio.
function DistanceJoint:getDampingRatio() end

---Gets the response speed.
---@return number Hz The response speed.
function DistanceJoint:getFrequency() end

---Gets the equilibrium distance between the two Bodies.
---@return number l The length between the two Bodies.
function DistanceJoint:getLength() end

---Sets the damping ratio.
---@param ratio number @The damping ratio.
function DistanceJoint:setDampingRatio(ratio) end

---Sets the response speed.
---@param Hz number @The response speed.
function DistanceJoint:setFrequency(Hz) end

---Sets the equilibrium distance between the two Bodies.
---@param l number @The length between the two Bodies.
function DistanceJoint:setLength(l) end

--endregion DistanceJoint

--region EdgeShape

---@class EdgeShape
---A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.
local EdgeShape = {}
---Gets the vertex that establishes a connection to the next shape.
---
---Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@return number x The x-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called.
---@return number y The y-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called.
function EdgeShape:getNextVertex() end

---Returns the local coordinates of the edge points.
---@return number x1 The x-component of the first vertex.
---@return number y1 The y-component of the first vertex.
---@return number x2 The x-component of the second vertex.
---@return number y2 The y-component of the second vertex.
function EdgeShape:getPoints() end

---Gets the vertex that establishes a connection to the previous shape.
---
---Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@return number x The x-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called.
---@return number y The y-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called.
function EdgeShape:getPreviousVertex() end

---Sets a vertex that establishes a connection to the next shape.
---
---This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@param x number @The x-component of the vertex.
---@param y number @The y-component of the vertex.
function EdgeShape:setNextVertex(x, y) end

---Sets a vertex that establishes a connection to the previous shape.
---
---This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.
---@param x number @The x-component of the vertex.
---@param y number @The y-component of the vertex.
function EdgeShape:setPreviousVertex(x, y) end

--endregion EdgeShape

--region Fixture

---@class Fixture
---Fixtures attach shapes to bodies.
local Fixture = {}
--endregion Fixture

--region FrictionJoint

---@class FrictionJoint
---A FrictionJoint applies friction to a body.
local FrictionJoint = {}
---Gets the maximum friction force in Newtons.
---@return number force Maximum force in Newtons.
function FrictionJoint:getMaxForce() end

---Gets the maximum friction torque in Newton-meters.
---@return number torque Maximum torque in Newton-meters.
function FrictionJoint:getMaxTorque() end

---Sets the maximum friction force in Newtons.
---@param maxForce number @Max force in Newtons.
function FrictionJoint:setMaxForce(maxForce) end

---Sets the maximum friction torque in Newton-meters.
---@param torque number @Maximum torque in Newton-meters.
function FrictionJoint:setMaxTorque(torque) end

--endregion FrictionJoint

--region GearJoint

---@class GearJoint
---Keeps bodies together in such a way that they act like gears.
local GearJoint = {}
---Get the Joints connected by this GearJoint.
---@return Joint joint1 The first connected Joint.
---@return Joint joint2 The second connected Joint.
function GearJoint:getJoints() end

---Get the ratio of a gear joint.
---@return number ratio The ratio of the joint.
function GearJoint:getRatio() end

---Set the ratio of a gear joint.
---@param ratio number @The new ratio of the joint.
function GearJoint:setRatio(ratio) end

--endregion GearJoint

--region Joint

---@class Joint
---Attach multiple bodies together to interact in unique ways.
local Joint = {}
---Explicitly destroys the Joint. An error will occur if you attempt to use the object after calling this function.
---
---In 0.7.2, when you don't have time to wait for garbage collection, this function 
---
---may be used to free the object immediately.
function Joint:destroy() end

---Get the anchor points of the joint.
---@return number x1 The x-component of the anchor on Body 1.
---@return number y1 The y-component of the anchor on Body 1.
---@return number x2 The x-component of the anchor on Body 2.
---@return number y2 The y-component of the anchor on Body 2.
function Joint:getAnchors() end

---Gets the bodies that the Joint is attached to.
---@return Body bodyA The first Body.
---@return Body bodyB The second Body.
function Joint:getBodies() end

---Gets whether the connected Bodies collide.
---@return boolean c True if they collide, false otherwise.
function Joint:getCollideConnected() end

---Returns the reaction force in newtons on the second body
---@param x number @How long the force applies. Usually the inverse time step or 1/dt.
---@return number x The x-component of the force.
---@return number y The y-component of the force.
function Joint:getReactionForce(x) end

---Returns the reaction torque on the second body.
---@param invdt number @How long the force applies. Usually the inverse time step or 1/dt.
---@return number torque The reaction torque on the second body.
function Joint:getReactionTorque(invdt) end

---Gets a string representing the type.
---@return JointType type A string with the name of the Joint type.
function Joint:getType() end

---Returns the Lua value associated with this Joint.
---@return any value The Lua value associated with the Joint.
function Joint:getUserData() end

---Gets whether the Joint is destroyed. Destroyed joints cannot be used.
---@return boolean destroyed Whether the Joint is destroyed.
function Joint:isDestroyed() end

---Associates a Lua value with the Joint.
---
---To delete the reference, explicitly pass nil.
---@param value any @The Lua value to associate with the Joint.
function Joint:setUserData(value) end

--endregion Joint

--region MotorJoint

---@class MotorJoint
---Controls the relative motion between two Bodies. Position and rotation offsets can be specified, as well as the maximum motor force and torque that will be applied to reach the target offsets.
local MotorJoint = {}
---Gets the target angular offset between the two Bodies the Joint is attached to.
---@return number angleoffset The target angular offset in radians: the second body's angle minus the first body's angle.
function MotorJoint:getAngularOffset() end

---Gets the target linear offset between the two Bodies the Joint is attached to.
---@return number x The x component of the target linear offset, relative to the first Body.
---@return number y The y component of the target linear offset, relative to the first Body.
function MotorJoint:getLinearOffset() end

---Sets the target angluar offset between the two Bodies the Joint is attached to.
---@param angleoffset number @The target angular offset in radians: the second body's angle minus the first body's angle.
function MotorJoint:setAngularOffset(angleoffset) end

---Sets the target linear offset between the two Bodies the Joint is attached to.
---@param x number @The x component of the target linear offset, relative to the first Body.
---@param y number @The y component of the target linear offset, relative to the first Body.
function MotorJoint:setLinearOffset(x, y) end

--endregion MotorJoint

--region MouseJoint

---@class MouseJoint
---For controlling objects with the mouse.
local MouseJoint = {}
---Returns the damping ratio.
---@return number ratio The new damping ratio.
function MouseJoint:getDampingRatio() end

---Returns the frequency.
---@return number freq The frequency in hertz.
function MouseJoint:getFrequency() end

---Gets the highest allowed force.
---@return number f The max allowed force.
function MouseJoint:getMaxForce() end

---Gets the target point.
---@return number x The x-component of the target.
---@return number y The x-component of the target.
function MouseJoint:getTarget() end

---Sets a new damping ratio.
---@param ratio number @The new damping ratio.
function MouseJoint:setDampingRatio(ratio) end

---Sets a new frequency.
---@param freq number @The new frequency in hertz.
function MouseJoint:setFrequency(freq) end

---Sets the highest allowed force.
---@param f number @The max allowed force.
function MouseJoint:setMaxForce(f) end

---Sets the target point.
---@param x number @The x-component of the target.
---@param y number @The y-component of the target.
function MouseJoint:setTarget(x, y) end

--endregion MouseJoint

--region PolygonShape

---@class PolygonShape
---A PolygonShape is a convex polygon with up to 8 vertices.
local PolygonShape = {}
---Get the local coordinates of the polygon's vertices.
---
---This function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.
---@return number x1 The x-component of the first vertex.
---@return number y1 The y-component of the first vertex.
---@return number x2 The x-component of the second vertex.
---@return number y2 The y-component of the second vertex.
function PolygonShape:getPoints() end

--endregion PolygonShape

--region PrismaticJoint

---@class PrismaticJoint
---Restricts relative motion between Bodies to one shared axis.
local PrismaticJoint = {}
--endregion PrismaticJoint

--region PulleyJoint

---@class PulleyJoint
---Allows you to simulate bodies connected through pulleys.
local PulleyJoint = {}
---Get the total length of the rope.
---@return number length The length of the rope in the joint.
function PulleyJoint:getConstant() end

---Get the ground anchor positions in world coordinates.
---@return number a1x The x coordinate of the first anchor.
---@return number a1y The y coordinate of the first anchor.
---@return number a2x The x coordinate of the second anchor.
---@return number a2y The y coordinate of the second anchor.
function PulleyJoint:getGroundAnchors() end

---Get the current length of the rope segment attached to the first body.
---@return number length The length of the rope segment.
function PulleyJoint:getLengthA() end

---Get the current length of the rope segment attached to the second body.
---@return number length The length of the rope segment.
function PulleyJoint:getLengthB() end

---Get the maximum lengths of the rope segments.
---@return number len1 The maximum length of the first rope segment.
---@return number len2 The maximum length of the second rope segment.
function PulleyJoint:getMaxLengths() end

---Get the pulley ratio.
---@return number ratio The pulley ratio of the joint.
function PulleyJoint:getRatio() end

---Set the total length of the rope.
---
---Setting a new length for the rope updates the maximum length values of the joint.
---@param length number @The new length of the rope in the joint.
function PulleyJoint:setConstant(length) end

---Set the maximum lengths of the rope segments.
---
---The physics module also imposes maximum values for the rope segments. If the parameters exceed these values, the maximum values are set instead of the requested values.
---@param max1 number @The new maximum length of the first segment.
---@param max2 number @The new maximum length of the second segment.
function PulleyJoint:setMaxLengths(max1, max2) end

---Set the pulley ratio.
---@param ratio number @The new pulley ratio of the joint.
function PulleyJoint:setRatio(ratio) end

--endregion PulleyJoint

--region RevoluteJoint

---@class RevoluteJoint
---Allow two Bodies to revolve around a shared point.
local RevoluteJoint = {}
--endregion RevoluteJoint

--region RopeJoint

---@class RopeJoint
---The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.
local RopeJoint = {}
---Gets the maximum length of a RopeJoint.
---@return number maxLength The maximum length of the RopeJoint.
function RopeJoint:getMaxLength() end

---Sets the maximum length of a RopeJoint.
---@param maxLength number @The new maximum length of the RopeJoint.
function RopeJoint:setMaxLength(maxLength) end

--endregion RopeJoint

--region Shape

---@class Shape
---Shapes are solid 2d geometrical objects which handle the mass and collision of a Body in love.physics.
---
---Shapes are attached to a Body via a Fixture. The Shape object is copied when this happens. 
---
---The Shape's position is relative to the position of the Body it has been attached to.
local Shape = {}
---Returns the points of the bounding box for the transformed shape.
---@param tx number @The translation of the shape on the x-axis.
---@param ty number @The translation of the shape on the y-axis.
---@param tr number @The shape rotation.
---@param childIndex? number @The index of the child to compute the bounding box of.
---@return number topLeftX The x position of the top-left point.
---@return number topLeftY The y position of the top-left point.
---@return number bottomRightX The x position of the bottom-right point.
---@return number bottomRightY The y position of the bottom-right point.
function Shape:computeAABB(tx, ty, tr, childIndex) end

---Computes the mass properties for the shape with the specified density.
---@param density number @The shape density.
---@return number x The x postition of the center of mass.
---@return number y The y postition of the center of mass.
---@return number mass The mass of the shape.
---@return number inertia The rotational inertia.
function Shape:computeMass(density) end

---Returns the number of children the shape has.
---@return number count The number of children.
function Shape:getChildCount() end

---Gets the radius of the shape.
---@return number radius The radius of the shape.
function Shape:getRadius() end

---Gets a string representing the Shape.
---
---This function can be useful for conditional debug drawing.
---@return ShapeType type The type of the Shape.
function Shape:getType() end

---Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.
---
---The ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.
---
---The childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.
---
---The world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.
---
---hitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction
---@param x1 number @The x position of the input line starting point.
---@param y1 number @The y position of the input line starting point.
---@param x2 number @The x position of the input line end point.
---@param y2 number @The y position of the input line end point.
---@param maxFraction number @Ray length parameter.
---@param tx number @The translation of the shape on the x-axis.
---@param ty number @The translation of the shape on the y-axis.
---@param tr number @The shape rotation.
---@param childIndex? number @The index of the child the ray gets cast against.
---@return number xn The x component of the normal vector of the edge where the ray hit the shape.
---@return number yn The y component of the normal vector of the edge where the ray hit the shape.
---@return number fraction The position on the input line where the intersection happened as a factor of the line length.
function Shape:rayCast(x1, y1, x2, y2, maxFraction, tx, ty, tr, childIndex) end

---This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.
---@param tx number @Translates the shape along the x-axis.
---@param ty number @Translates the shape along the y-axis.
---@param tr number @Rotates the shape.
---@param x number @The x-component of the point.
---@param y number @The y-component of the point.
---@return boolean hit True if inside, false if outside
function Shape:testPoint(tx, ty, tr, x, y) end

--endregion Shape

--region WeldJoint

---@class WeldJoint
---A WeldJoint essentially glues two bodies together.
local WeldJoint = {}
---Returns the damping ratio of the joint.
---@return number ratio The damping ratio.
function WeldJoint:getDampingRatio() end

---Returns the frequency.
---@return number freq The frequency in hertz.
function WeldJoint:getFrequency() end

---Gets the reference angle.
---@return number angle The reference angle in radians.
function WeldJoint:getReferenceAngle() end

---Sets a new damping ratio.
---@param ratio number @The new damping ratio.
function WeldJoint:setDampingRatio(ratio) end

---Sets a new frequency.
---@param freq number @The new frequency in hertz.
function WeldJoint:setFrequency(freq) end

--endregion WeldJoint

--region WheelJoint

---@class WheelJoint
---Restricts a point on the second body to a line on the first body.
local WheelJoint = {}
---Gets the world-space axis vector of the Wheel Joint.
---@return number x The x-axis coordinate of the world-space axis vector.
---@return number y The y-axis coordinate of the world-space axis vector.
function WheelJoint:getAxis() end

---Returns the current joint translation speed.
---@return number speed The translation speed of the joint in meters per second.
function WheelJoint:getJointSpeed() end

---Returns the current joint translation.
---@return number position The translation of the joint in meters.
function WheelJoint:getJointTranslation() end

---Returns the maximum motor torque.
---@return number maxTorque The maximum torque of the joint motor in newton meters.
function WheelJoint:getMaxMotorTorque() end

---Returns the speed of the motor.
---@return number speed The speed of the joint motor in radians per second.
function WheelJoint:getMotorSpeed() end

---Returns the current torque on the motor.
---@param invdt number @How long the force applies. Usually the inverse time step or 1/dt.
---@return number torque The torque on the motor in newton meters.
function WheelJoint:getMotorTorque(invdt) end

---Returns the damping ratio.
---@return number ratio The damping ratio.
function WheelJoint:getSpringDampingRatio() end

---Returns the spring frequency.
---@return number freq The frequency in hertz.
function WheelJoint:getSpringFrequency() end

---Checks if the joint motor is running.
---@return boolean on The status of the joint motor.
function WheelJoint:isMotorEnabled() end

---Sets a new maximum motor torque.
---@param maxTorque number @The new maximum torque for the joint motor in newton meters.
function WheelJoint:setMaxMotorTorque(maxTorque) end

---Starts and stops the joint motor.
---@param enable boolean @True turns the motor on and false turns it off.
function WheelJoint:setMotorEnabled(enable) end

---Sets a new speed for the motor.
---@param speed number @The new speed for the joint motor in radians per second.
function WheelJoint:setMotorSpeed(speed) end

---Sets a new damping ratio.
---@param ratio number @The new damping ratio.
function WheelJoint:setSpringDampingRatio(ratio) end

---Sets a new spring frequency.
---@param freq number @The new frequency in hertz.
function WheelJoint:setSpringFrequency(freq) end

--endregion WheelJoint

--region World

---@class World
---A world is an object that contains all bodies and joints.
local World = {}
--endregion World

---The types of a Body. 
---@alias BodyType
---| 'static'	#Static bodies do not move.
---| 'dynamic'	#Dynamic bodies collide with all bodies.
---| 'kinematic'	#Kinematic bodies only collide with dynamic bodies.

---Different types of joints.
---@alias JointType
---| 'distance'	#A DistanceJoint.
---| 'friction'	#A FrictionJoint.
---| 'gear'	#A GearJoint.
---| 'mouse'	#A MouseJoint.
---| 'prismatic'	#A PrismaticJoint.
---| 'pulley'	#A PulleyJoint.
---| 'revolute'	#A RevoluteJoint.
---| 'rope'	#A RopeJoint.
---| 'weld'	#A WeldJoint.

---The different types of Shapes, as returned by Shape:getType.
---@alias ShapeType
---| 'circle'	#The Shape is a CircleShape.
---| 'polygon'	#The Shape is a PolygonShape.
---| 'edge'	#The Shape is a EdgeShape.
---| 'chain'	#The Shape is a ChainShape.

---Returns the two closest points between two fixtures and their distance.
---@param fixture1 Fixture @The first fixture.
---@param fixture2 Fixture @The second fixture.
---@return number distance The distance of the two points.
---@return number x1 The x-coordinate of the first point.
---@return number y1 The y-coordinate of the first point.
---@return number x2 The x-coordinate of the second point.
---@return number y2 The y-coordinate of the second point.
function m.getDistance(fixture1, fixture2) end

---Returns the meter scale factor.
---
---All coordinates in the physics module are divided by this number, creating a convenient way to draw the objects directly to the screen without the need for graphics transformations.
---
---It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters.
---@return number scale The scale factor as an integer.
function m.getMeter() end

---Creates a new body.
---
---There are three types of bodies. 
---
---* Static bodies do not move, have a infinite mass, and can be used for level boundaries. 
---
---* Dynamic bodies are the main actors in the simulation, they collide with everything. 
---
---* Kinematic bodies do not react to forces and only collide with dynamic bodies.
---
---The mass of the body gets calculated when a Fixture is attached or removed, but can be changed at any time with Body:setMass or Body:resetMassData.
---@param world World @The world to create the body in.
---@param x? number @The x position of the body.
---@param y? number @The y position of the body.
---@param type? BodyType @The type of the body.
---@return Body body A new body.
function m.newBody(world, x, y, type) end

---Creates a new ChainShape.
---@param loop boolean @If the chain should loop back to the first point.
---@param x1 number @The x position of the first point.
---@param y1 number @The y position of the first point.
---@param x2 number @The x position of the second point.
---@param y2 number @The y position of the second point.
---@param ... number @Additional point positions.
---@return ChainShape shape The new shape.
---@overload fun(loop:boolean, points:table):ChainShape
function m.newChainShape(loop, x1, y1, x2, y2, ...) end

---Creates a new CircleShape.
---@param radius number @The radius of the circle.
---@return CircleShape shape The new shape.
---@overload fun(x:number, y:number, radius:number):CircleShape
function m.newCircleShape(radius) end

---Creates a DistanceJoint between two bodies.
---
---This joint constrains the distance between two points on two bodies to be constant. These two points are specified in world coordinates and the two bodies are assumed to be in place when this joint is created. The first anchor point is connected to the first body and the second to the second body, and the points define the length of the distance joint.
---@param body1 Body @The first body to attach to the joint.
---@param body2 Body @The second body to attach to the joint.
---@param x1 number @The x position of the first anchor point (world space).
---@param y1 number @The y position of the first anchor point (world space).
---@param x2 number @The x position of the second anchor point (world space).
---@param y2 number @The y position of the second anchor point (world space).
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return DistanceJoint joint The new distance joint.
function m.newDistanceJoint(body1, body2, x1, y1, x2, y2, collideConnected) end

---Creates a new EdgeShape.
---@param x1 number @The x position of the first point.
---@param y1 number @The y position of the first point.
---@param x2 number @The x position of the second point.
---@param y2 number @The y position of the second point.
---@return EdgeShape shape The new shape.
function m.newEdgeShape(x1, y1, x2, y2) end

---Creates and attaches a Fixture to a body.
---
---Note that the Shape object is copied rather than kept as a reference when the Fixture is created. To get the Shape object that the Fixture owns, use Fixture:getShape.
---@param body Body @The body which gets the fixture attached.
---@param shape Shape @The shape to be copied to the fixture.
---@param density? number @The density of the fixture.
---@return Fixture fixture The new fixture.
function m.newFixture(body, shape, density) end

---Create a friction joint between two bodies. A FrictionJoint applies friction to a body.
---@param body1 Body @The first body to attach to the joint.
---@param body2 Body @The second body to attach to the joint.
---@param x number @The x position of the anchor point.
---@param y number @The y position of the anchor point.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return FrictionJoint joint The new FrictionJoint.
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, collideConnected?:boolean):FrictionJoint
function m.newFrictionJoint(body1, body2, x, y, collideConnected) end

---Create a GearJoint connecting two Joints.
---
---The gear joint connects two joints that must be either  prismatic or  revolute joints. Using this joint requires that the joints it uses connect their respective bodies to the ground and have the ground as the first body. When destroying the bodies and joints you must make sure you destroy the gear joint before the other joints.
---
---The gear joint has a ratio the determines how the angular or distance values of the connected joints relate to each other. The formula coordinate1 + ratio * coordinate2 always has a constant value that is set when the gear joint is created.
---@param joint1 Joint @The first joint to connect with a gear joint.
---@param joint2 Joint @The second joint to connect with a gear joint.
---@param ratio? number @The gear ratio.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return GearJoint joint The new gear joint.
function m.newGearJoint(joint1, joint2, ratio, collideConnected) end

---Creates a joint between two bodies which controls the relative motion between them.
---
---Position and rotation offsets can be specified once the MotorJoint has been created, as well as the maximum motor force and torque that will be be applied to reach the target offsets.
---@param body1 Body @The first body to attach to the joint.
---@param body2 Body @The second body to attach to the joint.
---@param correctionFactor? number @The joint's initial position correction factor, in the range of 1.
---@return MotorJoint joint The new MotorJoint.
---@overload fun(body1:Body, body2:Body, correctionFactor?:number, collideConnected?:boolean):MotorJoint
function m.newMotorJoint(body1, body2, correctionFactor) end

---Create a joint between a body and the mouse.
---
---This joint actually connects the body to a fixed point in the world. To make it follow the mouse, the fixed point must be updated every timestep (example below).
---
---The advantage of using a MouseJoint instead of just changing a body position directly is that collisions and reactions to other joints are handled by the physics engine. 
---@param body Body @The body to attach to the mouse.
---@param x number @The x position of the connecting point.
---@param y number @The y position of the connecting point.
---@return MouseJoint joint The new mouse joint.
function m.newMouseJoint(body, x, y) end

---Creates a new PolygonShape.
---
---This shape can have 8 vertices at most, and must form a convex shape.
---@param x1 number @The x position of the first point.
---@param y1 number @The y position of the first point.
---@param x2 number @The x position of the second point.
---@param y2 number @The y position of the second point.
---@param x3 number @The x position of the third point.
---@param y3 number @The y position of the third point.
---@param ... number @You can continue passing more point positions to create the PolygonShape.
---@return PolygonShape shape A new PolygonShape.
---@overload fun(vertices:table):PolygonShape
function m.newPolygonShape(x1, y1, x2, y2, x3, y3, ...) end

---Creates a PrismaticJoint between two bodies.
---
---A prismatic joint constrains two bodies to move relatively to each other on a specified axis. It does not allow for relative rotation. Its definition and operation are similar to a  revolute joint, but with translation and force substituted for angle and torque.
---@param body1 Body @The first body to connect with a prismatic joint.
---@param body2 Body @The second body to connect with a prismatic joint.
---@param x number @The x coordinate of the anchor point.
---@param y number @The y coordinate of the anchor point.
---@param ax number @The x coordinate of the axis vector.
---@param ay number @The y coordinate of the axis vector.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return PrismaticJoint joint The new prismatic joint.
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, ax:number, ay:number, collideConnected?:boolean):PrismaticJoint
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, ax:number, ay:number, collideConnected?:boolean, referenceAngle?:number):PrismaticJoint
function m.newPrismaticJoint(body1, body2, x, y, ax, ay, collideConnected) end

---Creates a PulleyJoint to join two bodies to each other and the ground.
---
---The pulley joint simulates a pulley with an optional block and tackle. If the ratio parameter has a value different from one, then the simulated rope extends faster on one side than the other. In a pulley joint the total length of the simulated rope is the constant length1 + ratio * length2, which is set when the pulley joint is created.
---
---Pulley joints can behave unpredictably if one side is fully extended. It is recommended that the method  setMaxLengths  be used to constrain the maximum lengths each side can attain.
---@param body1 Body @The first body to connect with a pulley joint.
---@param body2 Body @The second body to connect with a pulley joint.
---@param gx1 number @The x coordinate of the first body's ground anchor.
---@param gy1 number @The y coordinate of the first body's ground anchor.
---@param gx2 number @The x coordinate of the second body's ground anchor.
---@param gy2 number @The y coordinate of the second body's ground anchor.
---@param x1 number @The x coordinate of the pulley joint anchor in the first body.
---@param y1 number @The y coordinate of the pulley joint anchor in the first body.
---@param x2 number @The x coordinate of the pulley joint anchor in the second body.
---@param y2 number @The y coordinate of the pulley joint anchor in the second body.
---@param ratio? number @The joint ratio.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return PulleyJoint joint The new pulley joint.
function m.newPulleyJoint(body1, body2, gx1, gy1, gx2, gy2, x1, y1, x2, y2, ratio, collideConnected) end

---Shorthand for creating rectangular PolygonShapes. 
---
---By default, the local origin is located at the '''center''' of the rectangle as opposed to the top left for graphics.
---@param width number @The width of the rectangle.
---@param height number @The height of the rectangle.
---@return PolygonShape shape A new PolygonShape.
---@overload fun(x:number, y:number, width:number, height:number, angle?:number):PolygonShape
function m.newRectangleShape(width, height) end

---Creates a pivot joint between two bodies.
---
---This joint connects two bodies to a point around which they can pivot.
---@param body1 Body @The first body.
---@param body2 Body @The second body.
---@param x number @The x position of the connecting point.
---@param y number @The y position of the connecting point.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return RevoluteJoint joint The new revolute joint.
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, collideConnected?:boolean, referenceAngle?:number):RevoluteJoint
function m.newRevoluteJoint(body1, body2, x, y, collideConnected) end

---Creates a joint between two bodies. Its only function is enforcing a max distance between these bodies.
---@param body1 Body @The first body to attach to the joint.
---@param body2 Body @The second body to attach to the joint.
---@param x1 number @The x position of the first anchor point.
---@param y1 number @The y position of the first anchor point.
---@param x2 number @The x position of the second anchor point.
---@param y2 number @The y position of the second anchor point.
---@param maxLength number @The maximum distance for the bodies.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return RopeJoint joint The new RopeJoint.
function m.newRopeJoint(body1, body2, x1, y1, x2, y2, maxLength, collideConnected) end

---Creates a constraint joint between two bodies. A WeldJoint essentially glues two bodies together. The constraint is a bit soft, however, due to Box2D's iterative solver.
---@param body1 Body @The first body to attach to the joint.
---@param body2 Body @The second body to attach to the joint.
---@param x number @The x position of the anchor point (world space).
---@param y number @The y position of the anchor point (world space).
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return WeldJoint joint The new WeldJoint.
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, collideConnected?:boolean):WeldJoint
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, collideConnected?:boolean, referenceAngle?:number):WeldJoint
function m.newWeldJoint(body1, body2, x, y, collideConnected) end

---Creates a wheel joint.
---@param body1 Body @The first body.
---@param body2 Body @The second body.
---@param x number @The x position of the anchor point.
---@param y number @The y position of the anchor point.
---@param ax number @The x position of the axis unit vector.
---@param ay number @The y position of the axis unit vector.
---@param collideConnected? boolean @Specifies whether the two bodies should collide with each other.
---@return WheelJoint joint The new WheelJoint.
---@overload fun(body1:Body, body2:Body, x1:number, y1:number, x2:number, y2:number, ax:number, ay:number, collideConnected?:boolean):WheelJoint
function m.newWheelJoint(body1, body2, x, y, ax, ay, collideConnected) end

---Creates a new World.
---@param xg? number @The x component of gravity.
---@param yg? number @The y component of gravity.
---@param sleep? boolean @Whether the bodies in this world are allowed to sleep.
---@return World world A brave new World.
function m.newWorld(xg, yg, sleep) end

---Sets the pixels to meter scale factor.
---
---All coordinates in the physics module are divided by this number and converted to meters, and it creates a convenient way to draw the objects directly to the screen without the need for graphics transformations.
---
---It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters. The default meter scale is 30.
---@param scale number @The scale factor as an integer.
function m.setMeter(scale) end

return m