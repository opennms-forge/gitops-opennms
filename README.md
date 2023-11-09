# 🚀 Welcome

This repository is a proof of concept to identify how to run OpenNMS Horizon with a managed configuration using a version control system and running in a container.
Configuring a monitoring system is a challenging task.
Requirements of what and how things are monitored change over time, and people must adjust accordingly.
When we are talking here about OpenNMS Horizon, you can use it with OpenNMS Meridian interchangeably, they both share the same source code just with a different release and maintenance lifecycle.
Additionally, the OpenNMS Horizon monitoring system itself needs to deal with varying monitoring workloads, most of the time the larger workloads are:

* running periodic tests against network endpoints
* collecting performance metrics
* building and discovering network topologies
* correlating and creating alarms from events
* receiving and processing streaming telemetry, e.g. NetFlow, SNMP Traps, Syslogs, etc.

Managing the configuration of a monitoring system gives various benefits to a network monitoring team:

* Make the configuration of OpenNMS more visible and accessible to members of your team
* Allow collaboration on developing and sharing monitoring configurations without a need to give them access to OpenNMS Horizon itself
* Track changes and being able to roll back
* Introducing quality gates and getting monitoring configuration into production

## 👩‍🔬 Challenges

* Identify immutable vs. mutable configurations, make it possible to run a development environment easily to develop configurations.
* 🚫 Any change you make in the administrative UI won't be persisted. Only configuration coming from the Git repository will be used on container restart.
* Update conflicts **should** be minimized, because we only manage very stable configuration files.

## 🤹‍♀️ Requirements

* Docker with Docker Compose
* 8 GB RAM for the stack
* Access to GitHub to clone the [Deployment](https://github.com/opennms-forge/gitops-opennms) repository and the [Configuration](https://github.com/opennms-forge/gitops-opennms-config) repository.

## 🕹️ Usage

Clone the deployment stack repository
```bash
git clone https://github.com/opennms-forge/gitops-opennms
```

When you run `docker compose up -d` the following things happen:

1. Spin up a PostgreSQL database, a Kafka single-node instance with a Kafka-UI for easier troubleshooting
2. A [git-based](https://github.com/labmonkeys-space/app-container/tree/main/git) horizon-init container is started to fetch the gitops-opennms-config directory and populates an opennms-overlay directory with the given config. It's persisted in the local host systems file system.
3. The OpenNMS Horizon container service starts up and mounts the opennms-overlay directory which overwrites just the configuration files in the given gitops-opennms-config repository

You can run just the horizon-init container with `docker compose up horizon-init` to fetch and populate opennms-overlay directory.

## 👋 Say hi

You are very welcome to join us in working on this topic.
You can find us at:

* Public OpenNMS [Mattermost Chat](https://chat.opennms.com/opennms/channels/opennms-discussion)
* If you have longer discussions to share ideas use our [OpenNMS Discourse](https://opennms.discourse.group) and tag your post with `sig-gitops`
