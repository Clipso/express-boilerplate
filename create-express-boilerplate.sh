#!/bin/bash

# Prompt the user to enter the directory name
read -p "Enter the directory name for your Express.js project: " directory_name

# Create a new directory with the specified name
mkdir "$directory_name"

# Navigate to the project directory
cd "$directory_name"

# Initialize a new Node.js project
npm init -y

# Install Express.js as a dependency
npm install express nodemon dotenv express-validator @prisma/client date-fns

# Create the directories and files
mkdir controllers routes

# Create an index.js file in the root directory
cat <<EOL > index.js
const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
 
app.get("/", (req, res) => {
  res.send("Hello, Express!");
});

app.listen(port, () => {
  console.log(\`Server is running on port \${port}\`);
});
EOL

# Create a sample controller file in the controllers directory
cat <<EOL > controllers/sampleController.js
module.exports = {
  getSampleData: (req, res) => {
    res.send("Sample Data");
  },
};
EOL

# Create a sample route file in the routes directory
cat <<EOL > routes/sampleRoute.js
const express = require("express");
const router = express.Router();
const sampleController = require("../controllers/sampleController");

router.get("/sample", sampleController.getSampleData);

module.exports = router;
EOL

# Display a message indicating that the boilerplate has been created
echo "Express.js boilerplate has been created in the '$directory_name' directory."

# Set execution permission for the script
chmod +x "$0"
