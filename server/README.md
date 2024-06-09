# Server

(Backend repo). Clone of Udemy, an e-learning platform, built using SpringBoot + Vue 3 + Typescript. With CreditCard and
PayPal checkout (both powered by **Braintree Payments**). Uses Spring Security & Spring Session Redis (via cookies[^1]
or sessionID Headers) for auth, instead of stateless JWT Tokens. CSRF protection is enabled. You can easily customize
these settings in [SecurityConfig](src/main/java/com/utc2/onlinelearning/config/SecurityConfig.java). By default, the
app runs on port 9000.

## Requirements

- Java 11 or higher
- MySQL 8.0
- Redis Server (latest stable)
- [Google OAuth Credentials](https://developers.google.com/identity/gsi/web/guides/get-google-api-clientid) (for Google
  Login)
- [Braintree Developer](https://developer.paypal.com/braintree/docs) Account + API Keys. (for Payments)
- (OPTIONAL) Free PayPal Business Account.

### Environmental Variables

You MUST set these variables on your Local or Cloud ENV before you launch this SpringBoot app. **💡TIP**: During
dev/test, you can pass them via `args`, OR store inside your IDE: e.g. In either Eclipse or IntelliJ IDE, in the top
toolbar, find the **"Run"** menu > **Edit/Run Configuration** > **Environment** > **Environmental Variables**. Add (+)
each key and its value, then click **Apply**. 

```properties
FRONTEND_ROOT_URL = ${FRONTEND_ROOT_URL}

# Environment variable for database
MYSQL_PASSWORD = ${MYSQL_PASSWORD}
MYSQL_HOST = ${MYSQL_HOST}?connectionTimeZone=UTC
MYSQL_USERNAME = ${MYSQL_USERNAME}
# OR, set this
spring.jpa.properties.hibernate.jdbc.time_zone=UTC

# Environment variable for redis
REDIS_HOST = ${REDIS_HOST}
REDIS_PASSWORD = ${REDIS_PASSWORD}
REDIS_PORT = ${REDIS_PORT}

# below are for Google OAuth
GOOGLE_CLIENT_ID = ${GOOGLE_CLIENT_ID}
GOOGLE_CLIENT_SECRET = ${GOOGLE_CLIENT_SECRET}

# below are for Braintree Payments
BT_MERCHANT_ID = ${BT_MERCHANT_ID}
BT_PUBLIC_KEY = ${BT_PUBLIC_KEY}
BT_PRIVATE_KEY = ${BT_PRIVATE_KEY}

# For production, set these:
SPRING_PROFILES_ACTIVE=prod
PORT=#{for Spring server}
```

## Important ⚠

Please examine the files [application.yml](src/main/resources/application.yml) (default),
 (meant for _production_). Replace all the necessary
Spring Application properties with yours. But for sensitive info (like Passwords or API Keys), **DON'T PASTE THEM IN
THERE DIRECTLY**❌ . It's safer to store them as Environmental Variables instead (see section above), then either
declare them as `property.name = ${ENV_KEY_NAME}`, OR refer them directly in your source code as shown
in [BraintreeConfig](src/main/java/com/utc2/onlinelearning/config/BraintreeConfig.java).

## Database Setup

This is the primary database. All DateTimes are stored and queried in UTC only. (**Hint: USE `java.time.Instant` as Type
for all Datetime fields**). Handle timezone conversion on your Frontend! For your convenience, I have included a
[mysqldump file](src/main/resources/data_onlinelearning.sql) which contains sample data for testing.

- CREATE new schema (any name is OK), with charset `utf8mb4`.
- Springboot will create all tables and indexes automatically on the Very First launch.
- To maintain consistent time-zone (UTC) with your Java server, ensure your JDBC connection URL has
  parameter `connectionTimeZone=UTC`. See example below. For native @Query's, use UTC_TIMESTAMP() or UTC_DATE().

## Quick Start 🚀

### With Maven (natively)

I assume you have requirements listed above. And both your DB's are running. Using your terminal, execute the commands
below. That's it! Server will be available at http://localhost:9000

```bash
./mvnw clean package
java -jar target/onlinelearning.jar
```

## Payments Handling

All payments are securely handled by **Braintree Payments** (owned by PayPal), which also supports cards, Apple Pay,
GooglePay, Venmo and many other methods. This project implements Credit-Card and PayPal Checkout only, in _Sandbox_
(Dev) mode: **No actual money is deducted at Checkout**. Make sure you obtain a set of 3 API Keys from
your own Braintree Dev Account and store them as ENV variables: `BT_MERCHANT_ID`, `BT_PUBLIC_KEY` and `BT_PRIVATE_KEY`.
For Braintree tutorials and samples, please check their [official docs](https://developer.paypal.com/braintree/docs).
