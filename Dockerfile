FROM node

# Create a directory for the application
RUN mkdir -p /usr/src/app

# Set the working directory to the application directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Copy the rest of the application code to the working directory
COPY ./api .

# Expose the application's port
EXPOSE 8090

# Run the application
CMD ["ls"]