# Server

(Backend repo). Clone of Udemy, an e-learning platform, built using SpringBoot + Vue 3 + Typescript. With CreditCard and
PayPal checkout (both powered by **Braintree Payments**). Uses Spring Security & Spring Session Redis (via cookies[^1]
or sessionID Headers) for auth, instead of stateless JWT Tokens. CSRF protection is enabled. You can easily customize
these settings in [SecurityConfig](src/main/java/com/davistiba/wedemyserver/config/SecurityConfig.java). By default, the
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
each key and its value, then click **Apply**. If using Docker CLI, follow this quick
[official guide.](https://docs.docker.com/engine/reference/commandline/run/#env)

```properties
FRONTEND_ROOT_URL = ${FRONTEND_ROOT_URL}

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
and [application-prod.yml](src/main/resources/application-prod.yml) (meant for _production_). Replace all the necessary
Spring Application properties with yours. But for sensitive info (like Passwords or API Keys), **DON'T PASTE THEM IN
THERE DIRECTLY**❌ . It's safer to store them as Environmental Variables instead (see section above), then either
declare them as `property.name = ${ENV_KEY_NAME}`, OR refer them directly in your source code as shown
in [BraintreeConfig](src/main/java/com/davistiba/wedemyserver/config/BraintreeConfig.java).

## Database Setup

### MySQL 8.0.x

This is the primary database. All DateTimes are stored and queried in UTC only. (**Hint: USE `java.time.Instant` as Type
for all Datetime fields**). Handle timezone conversion on your Frontend! For your convenience, I have included a
[mysqldump file](src/main/resources/data_wedemy.sql) which contains sample data for testing.

- CREATE new schema (any name is OK), with charset `utf8mb4`.
- Springboot will create all tables and indexes automatically on the Very First launch.
- To maintain consistent time-zone (UTC) with your Java server, ensure your JDBC connection URL has
  parameter `connectionTimeZone=UTC`. See example below. For native @Query's, use UTC_TIMESTAMP() or UTC_DATE().

  ```properties
  # Environment variable for database
  MYSQL_PASSWORD = ${MYSQL_PASSWORD}
  MYSQL_HOST = ${MYSQL_HOST}?connectionTimeZone=UTC
  MYSQL_USERNAME = ${MYSQL_USERNAME}
  # OR, set this
  spring.jpa.properties.hibernate.jdbc.time_zone=UTC
  ```

### Redis v6.0 (or higher)

This project uses Redis for 2 main tasks: Caching, and Storing login sessions. You can download latest Redis (macOS &
Linux) from https://redis.io/download. Windows users may download the latest native installer (.msi)
from [this GitHub repo](https://github.com/tporadowski/redis/releases). Alternatively, you could pull its official
Docker image.
Another option you could try is Redis Cloud at: https://redis.com/try-free/. Remember to replace Redis credentials
inside application.yml (or in your ENV variables).
```properties
# Environment variable for redis
REDIS_HOST = ${REDIS_HOST}
REDIS_PASSWORD = ${REDIS_PASSWORD}
REDIS_PORT = ${REDIS_PORT}
```
| Tip 💡 | Redis now has an OFFICIAL cross-platform desktop GUI client: RedisInsight. Download it free [here](https://redis.com/redis-enterprise/redis-insight/) |

## Quick Start 🚀

### With Maven (natively)

I assume you have requirements listed above. And both your DB's are running. Using your terminal, execute the commands
below. That's it! Server will be available at http://localhost:9000

```bash
./mvnw clean package
java -jar target/wedemyserver.jar
```

### With Docker

I have attached [Dockerfile](Dockerfile) for the Spring server only. You will need to set up MySQL & Redis
separately. Refer to official Docker docs on how to pass Env variables.

```bash
  # Build image
  docker build -t wedemy-server .
  # Start container
  docker run --name "wedemy" -d -p9000:9000 wedemy-server
```

Tip💡 : If using Docker Desktop (latest), before starting container, you can fill in the ENV vars in the GUI directly.
See [screenshot](src/main/resources/docker_env.PNG)

## Deploying your App 🌍

This App can be easily deployed within few minutes, straight from GitHub to your Cloud PaaS of choice. You can either
use the [Dockerfile](Dockerfile) provided, or natively as a pure Java app. Popular PaaS with CI/CD for Java
include: Heroku, AWS ElasticBeanstalk, Google App Engine, Azure Web Apps. The following may **require** a Dockerfile:
Dokku, Railway, Render.com, Fly.io. Please note, you will also need a **separate** MySQL & Redis instance!

## Payments Handling

All payments are securely handled by **Braintree Payments** (owned by PayPal), which also supports cards, Apple Pay,
GooglePay, Venmo and many other methods. This project implements Credit-Card and PayPal Checkout only, in _Sandbox_
(Dev) mode: **No actual money is deducted at Checkout**. Make sure you obtain a set of 3 API Keys from
your own Braintree Dev Account and store them as ENV variables: `BT_MERCHANT_ID`, `BT_PUBLIC_KEY` and `BT_PRIVATE_KEY`.
For Braintree tutorials and samples, please check their [official docs](https://developer.paypal.com/braintree/docs).

## License

[MIT License](LICENSE)

---

[^1]: In production, for Browser clients, ensure both your Backend and Frontend share the same _ROOT_ domain (same-site
policy), AND set property `session.cookie.Secure=true` (strictly https) for Session Cookies to work properly. Learn
more at [WebDev](https://web.dev/samesite-cookies-explained/). Alternatively, you can replace Cookies **entirely** with
special Header X-AUTH-TOKEN (by Spring; expires too). See file SecurityConfig.java.
