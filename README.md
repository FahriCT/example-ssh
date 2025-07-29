<div align="center">
  <a href="https://koyeb.com">
    <img src="https://www.koyeb.com/static/images/icons/koyeb.svg" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">Koyeb Serverless Platform</h3>
  <p align="center">
    Deploy a SSH server on Koyeb
    <br />
    <a href="https://koyeb.com">Learn more about Koyeb</a>
    ·
    <a href="https://koyeb.com/docs">Explore the documentation</a>
    ·
    <a href="https://koyeb.com/tutorials">Discover our tutorials</a>
  </p>
</div>

## About Koyeb and the SSH server example application

Koyeb is a developer-friendly serverless platform to deploy apps globally. No-ops, servers, or infrastructure management.
This repository contains a SSH server you can deploy on the Koyeb serverless platform for testing.

This example application is designed to show how a SSH server can be deployed on Koyeb.

## Getting Started

Follow the steps below to deploy and run the SSH server on your Koyeb account.

### Requirements

You need a Koyeb account to successfully deploy and run this application. If you don't already have an account, you can sign-up for free [here](https://app.koyeb.com/auth/signup).

### Deploy using the Koyeb button

The fastest way to deploy the SSH server is to click the **Deploy to Koyeb** button below.

[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?type=docker&instance_type=small&image=koyeb/ubuntu-ssh-server&ports=22;tcp;;true;tcp&name=ubuntu-ssh-server&env[PUBLIC_KEY]=)

Clicking on this button brings you to the Koyeb App creation page with everything pre-set to launch this application.

### Manual deployment

```bash
koyeb deploy . sshd/main \
  --archive-builder docker \
  --ports 22:tcp \
  --proxy-ports 22:tcp \
  --env PUBLIC_KEY=${PUBLIC_KEY} \
  --instance-type small
```

## Contributing

If you have any questions, ideas or suggestions regarding this application sample, feel free to open an [issue](//github.com/koyeb/example-ssh-server/issues) or fork this repository and open a [pull request](//github.com/koyeb/example-ssh-server/pulls).

## Contact

[Koyeb](https://www.koyeb.com) - [@gokoyeb](https://twitter.com/gokoyeb) - [Slack](http://slack.koyeb.com/)
