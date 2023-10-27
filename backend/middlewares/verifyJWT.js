//verifying accessToken before going to controller
const verifyJWT = (req, res, next) => {
  const authHeader = req.headers.authorization || req.headers.Authorization;
  if (!authHeader?.startsWith("Bearer "))
    return res
      .status(401)
      .json({ status: "failed", message: "No access token provided" });
  const token = authHeader.split(" ")[1];
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) => {
    if (err)
      return res.status(403).json({
        status: "failed",
        message: "Invalid access token",
      }); //invalid token
    req.id = decoded.id,
    req.email = decoded.email,
    req.role = decoded.role;
    next();
  });
};
module.exports = verifyJWT;
