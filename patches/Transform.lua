---class_fields---

--- @operator mul(Transform): Transform

---class_methods---

--- result = tA * tB is equivalent to result = tA:clone():apply(tB). It maps to the matrix multiplication operation that Transform:apply performs.
--- The * operator creates a new Transform object, so it is not recommended to use it heavily in per-frame code.
--- @param other Transform
--- @return Transform
function Transform:__mul(other) end
