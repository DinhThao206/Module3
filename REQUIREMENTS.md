# 📦 Project Dependencies & Requirements

## System Requirements

### Operating System
- Windows 10/11 / macOS / Linux
- Minimum 4GB RAM
- 2GB free disk space

### Software Requirements

#### Java Development Kit (JDK)
- **Version**: JDK 17 LTS or higher
- **Download**: https://www.oracle.com/java/technologies/downloads/
- **Verification**: `java -version`

#### Apache Tomcat
- **Version**: Tomcat 10.0 or higher (supports Jakarta EE)
- **Download**: https://tomcat.apache.org/download-10.cgi
- **Port**: Default 8080

#### MySQL / MariaDB
- **Version**: MySQL 8.0+ / MariaDB 10.5+
- **Download**: https://www.mysql.com/downloads/
- **Verification**: `mysql --version`

#### Gradle
- **Version**: Gradle 7.0+
- **Bundled**: Project includes Gradle wrapper (gradlew)
- **Download**: https://gradle.org/releases/

---

## Project Dependencies

### Build Tool
```gradle
id "java"

dependencies {
    // Jakarta Servlet API
    compileOnly 'jakarta.servlet:jakarta.servlet-api:5.0.0'
    
    // Jakarta Server Pages (JSP)
    compileOnly 'jakarta.servlet.jsp:jakarta.servlet.jsp-api:3.0.0'
    
    // Jakarta Standard Tag Library (JSTL)
    compileOnly 'jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api:2.0.0'
    runtimeOnly 'org.glassfish.web:jakarta.servlet.jsp.jstl:2.0.0'
    
    // MySQL Connector
    runtimeOnly 'mysql:mysql-connector-java:8.0.32'
    
    // Testing
    testImplementation 'junit:junit:4.13.2'
}
```

### External Libraries Used
```
Jakarta EE 9 (Servlet 5.0, JSP 3.0, JSTL 2.0)
MySQL Connector Java 8.0
```

---

## Database Requirements

### MySQL Installation
```bash
# Windows
choco install mysql

# macOS
brew install mysql

# Linux (Ubuntu/Debian)
sudo apt-get install mysql-server
```

### Start MySQL Service
```bash
# Windows
net start MySQL80

# macOS
brew services start mysql-community@8.0

# Linux
sudo systemctl start mysql
```

### Create Database
```sql
CREATE DATABASE truyen_online;
USE truyen_online;

-- Tables will be created by scripts provided
```

---

## Environment Variables Setup

### Windows
```batch
# Set JAVA_HOME
setx JAVA_HOME "C:\Program Files\Java\jdk-17"

# Set CATALINA_HOME
setx CATALINA_HOME "C:\apache-tomcat-10.0.xx"

# Add to PATH
setx PATH "%PATH%;%JAVA_HOME%\bin;%CATALINA_HOME%\bin"
```

### macOS / Linux
```bash
# Add to ~/.bash_profile or ~/.zshrc
export JAVA_HOME=/usr/libexec/java_home -v 17
export CATALINA_HOME=/path/to/apache-tomcat-10.0.xx
export PATH=$JAVA_HOME/bin:$CATALINA_HOME/bin:$PATH
```

---

## Gradle Build Configuration

### Build Properties
```gradle
plugins {
    id 'java'
    id 'war'
}

group = 'com.librarymanagement'
version = '1.0-SNAPSHOT'

sourceCompatibility = '17'

repositories {
    mavenCentral()
}

tasks.named('war') {
    from 'src/main/webapp'
}
```

---

## Ports & Configuration

### Default Ports
- **Tomcat**: 8080
- **MySQL**: 3306
- **Application**: http://localhost:8080/Tomcat-test

### Tomcat Configuration (server.xml)
```xml
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
```

---

## Browser Compatibility

### Recommended Browsers
- Chrome 90+
- Firefox 85+
- Safari 14+
- Edge 90+

### Minimum Requirements
- CSS3 Support
- JavaScript ES6+
- Cookies enabled

---

## IDE Recommendations

### IntelliJ IDEA
- Version: 2021.3+
- Plugins: Tomcat, Gradle
- Configuration: Auto-detected

### Eclipse
- Version: 2021-12+
- Plugins: Eclipse for Java EE Developers
- Configuration: Manual Tomcat setup

### Visual Studio Code
- Extensions: Extension Pack for Java
- Plugins: Tomcat for Java

---

## Installation Steps

### 1. Clone/Download Project
```bash
git clone <repository-url>
cd Tomcat-test
```

### 2. Configure Database
Edit `src/main/java/util/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/truyen_online";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### 3. Build Project
```bash
# Windows
gradlew build

# macOS/Linux
./gradlew build
```

### 4. Deploy WAR
```bash
# Copy to Tomcat
cp build/libs/Tomcat-test-1.0-SNAPSHOT.war $CATALINA_HOME/webapps/
```

### 5. Start Tomcat
```bash
# Windows
catalina.bat start

# macOS/Linux
catalina.sh start
```

### 6. Access Application
```
http://localhost:8080/Tomcat-test/
```

---

## Troubleshooting

### Issue: Gradle build fails
**Solution**:
- Clear cache: `gradlew clean`
- Check Java version: `java -version` (should be 17+)
- Rebuild: `gradlew build`

### Issue: MySQL connection error
**Solution**:
- Start MySQL service
- Verify credentials in DBConnection.java
- Check MySQL is running on port 3306

### Issue: Tomcat deployment error
**Solution**:
- Check Tomcat logs: `$CATALINA_HOME/logs/catalina.out`
- Verify WAR file exists in webapps/
- Restart Tomcat

### Issue: Page not found (404)
**Solution**:
- Check context path: `/Tomcat-test`
- Verify servlet URLs in web.xml
- Check JSP file exists in webapp/views/

---

## Version Compatibility Matrix

| Component | Tested Version | Minimum | Maximum |
|-----------|---|---|---|
| Java | 17 | 17 | 19 |
| Tomcat | 10.0.27 | 10.0 | 10.1 |
| MySQL | 8.0.32 | 8.0 | 8.1 |
| Gradle | 7.6 | 7.0 | 8.0 |
| Jakarta EE | 9.1 | 9.0 | 10.0 |

---

## Performance Requirements

### Minimum Hardware
- **CPU**: Dual-core processor
- **RAM**: 4GB
- **Storage**: 2GB free space
- **Network**: Broadband internet (for dependencies)

### Recommended Hardware
- **CPU**: Quad-core processor
- **RAM**: 8GB
- **Storage**: SSD with 10GB free space
- **Network**: 100 Mbps connection

---

## Security Recommendations

- [ ] Use HTTPS in production
- [ ] Change default admin password
- [ ] Enable MySQL authentication
- [ ] Restrict database user permissions
- [ ] Use environment variables for secrets
- [ ] Keep dependencies updated
- [ ] Enable Tomcat security manager
- [ ] Use WAF (Web Application Firewall)

---

## Maintenance

### Regular Tasks
- Monitor Tomcat logs weekly
- Backup database daily
- Update dependencies monthly
- Review security patches quarterly

### Log Locations
- Tomcat: `$CATALINA_HOME/logs/`
- Application logs: Check Tomcat console

---

## Getting Help

- **Documentation**: See README.md
- **Issues**: Check DEPLOYMENT_CHECKLIST.md
- **Logs**: Review Tomcat logs
- **FAQ**: Visit project wiki

---

**Last Updated**: May 2026
**Status**: Production Ready ✅
