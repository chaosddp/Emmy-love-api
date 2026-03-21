--- @meta love.physics


--- @class love.physics
local m = {}


--- The types of a Body. 
--- @alias BodyType
---| 'static' #Static bodies do not move.
---| 'dynamic' #Dynamic bodies collide with all bodies.
---| 'kinematic' #Kinematic bodies only collide with dynamic bodies.


--- Different types of joints.
--- @alias JointType
---| 'distance' #A DistanceJoint.
---| 'friction' #A FrictionJoint.
---| 'gear' #A GearJoint.
---| 'mouse' #A MouseJoint.
---| 'prismatic' #A PrismaticJoint.
---| 'pulley' #A PulleyJoint.
---| 'revolute' #A RevoluteJoint.
---| 'rope' #A RopeJoint.
---| 'weld' #A WeldJoint.


--- The different types of Shapes, as returned by Shape:getType.
--- @alias ShapeType
---| 'circle' #The Shape is a CircleShape.
---| 'polygon' #The Shape is a PolygonShape.
---| 'edge' #The Shape is a EdgeShape.
---| 'chain' #The Shape is a ChainShape.













return m