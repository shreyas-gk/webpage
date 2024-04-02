# Using node:19.7.0-alpine base image
FROM node:19.7-alpine
# Set the default Node environment to production
ENV NODE_ENV production
# Creating a new directory named 'labone' in the root
RUN mkdir /labone
# Changing ownership of'labone' directory to the 'node' user and group as indicated
RUN chown -R node:node /labone
# Setting the 'labone' directory as the working directory
WORKDIR /labone
 
# Setting the user to 'node'
USER node
 
# Copy all source files to the 'labone' directory and also changing file ownership
COPY --chown=node:node . /labone
# Run npm install to install Node.js package
RUN npm install
# Expose port 3000
EXPOSE 3000
# Set the default execution command for the container
CMD ["node", "src/index.js"]
