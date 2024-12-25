# Use the official Tomcat 10.1.33 image as the base image
FROM tomcat:10.1.33

# Remove the default ROOT web application (optional, to avoid conflict)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file into Tomcat's webapps directory
COPY target/realestate.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for Tomcat
EXPOSE 8082

# Start Tomcat server
CMD ["catalina.sh", "run"]
