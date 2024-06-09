<h1>
<div align="center"><img src="src/assets/logo_final_purple.png" alt="wedemy-logo"/> </div>
<div>Online Learning</div>
</h1>

(Frontend Repo). Clone of Udemy, PWA (progressive web app) built using Vue 3, Vite, Typescript, Pinia, and Element Plus.
At checkout, payments are securely handled by **Braintree Payments** (owned by PayPal), which also supports cards, Apple
Pay, GooglePay, Venmo and many other methods. This project implements Credit-Card and PayPal Checkout only. This is the
Student-facing web app -- does NOT include Instructor or Admin panel. Users may log in with either email/password or
with Google.

## Install

```sh
# Requires node 16.x or higher
npm install
```

## Usage

In local development, the app runs on port 5173 by default. You can change it in [vite.config.ts](vite.config.ts).
Create an `.env` file at project root directory and fill in appropriate values (see `.env.sample`).

```sh
npm run dev
```

For production, run `npm run build`, then follow official Vite guide
on [deployment](https://vitejs.dev/guide/static-deploy.html), depending on your hosting of choice. Remember to set ENV
variables on your target Cloud platform.

## Required 3rd party Services

- [Google OAuth Credentials](https://console.developers.google.com/apis/credentials) (for Google Login)
- [Braintree Developer](https://developer.paypal.com/braintree/docs) Account (for payments handling)
- (OPTIONAL) Free PayPal Business Account.

## Resources - learn more

- [Vite](https://vitejs.dev/guide/) - official Guide
- [Braintree Payments docs](https://developer.paypal.com/braintree/docs/guides/drop-in/setup-and-integration/javascript/v3)
- [Google Login docs](https://developers.google.com/identity/gsi/web/guides/overview) - latest version for Web
- [Element Plus](https://element-plus.org/en-US/) - UI framework for VueJS.
- [Pinia docs](https://pinia.vuejs.org/) - modern store for Vue (replacing VueX)
- [Vue DevTools](https://devtools.vuejs.org/guide/installation.html) -✨ plugin for all major Browsers
- [sql-to-ts](https://rmp135.github.io/sql-ts/) -✨ quick Db Schema (SQL) --> TS Interface generator

## Pull Requests & Contributions

Contributions, issues and feature requests are welcome!
Feel free to check [issues page](https://github.com//Longwater1234/WedemyClient/issues). For more TODO's for this
project, see list in [CONTRIBUTING.md](CONTRIBUTING.md)