# Step 1: Use the official Node.js image as the base image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json
COPY package*.json ./

# Step 4: Install dependencies, including development dependencies
RUN npm install --legacy-peer-deps

# Step 5: Copy the rest of the application code into the container
COPY . .

# Step 6: Install nodemon globally for live reloading
RUN npm install -g nodemon

# Step 7: Expose the port the app will run on
EXPOSE 3000

# Step 8: Command to run the app in development mode
CMD ["npm", "run", "start:dev"]