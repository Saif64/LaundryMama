const verifyAdmin = (req, res, next) => {
  // Check if the user has a role.
  if (!req?.role) {
    // The user does not have a role. Return a 401 Unauthorized error with a message.
    return res.status(401).json({ message: "Need to sign in first" });
  }

  // Check if the user has the ADMIN role.
  if (req.role !== "ADMIN") {
    // The user does not have the ADMIN role. Return a 401 Unauthorized error with a message.
    return res.status(401).json({ message: "Insufficient privileges" });
  }

  // The user has the ADMIN role. Call next().
  next();
};
module.exports=verifyAdmin