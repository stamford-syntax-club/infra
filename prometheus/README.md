# Prometheus

*NOTES*: Make sure to have .env file with the following content
```
DISCORD_WEBHOOK_URL=<Discord Webhook URL>
```
Steps are shown below

## Services
### Prometheus
- This service runs the Prometheus monitoring tool.
- It is responsible for collecting and storing metrics from different components of the SeaweedFS setup.

### AlertManager
- This service runs the Prometheus Alertmanager tool
- It is responsible for sending out alerts to specified urls when triggered by prometheus alerting system
- Unfortunately, its configuration file does not support environment variables, making it difficult to put in sensitive information like discord webhook url here
- Therefore, we set this service to send alert to `Discord-Alert` service through port `9094` where secrets can be stored safely

### Discord-Alert
- This service acts as a message forwarder from Alertmanager to Our Discord Channel
- To receive alerts from `AlertManager`, it listens to port `9094`
- Once received, the alerts will be forwarded to the `#infra-dev-alerts` channel on discord
- For this service to function properly, it requires `DISCORD_WEBHOOK_URL` defined as environment variable




## Discord Webhook URL Retrieval
1. Click `Edit Channel` on `#infra-dev-alerts` channel

![](./assets/edit%20channel.png)

2. `Integrations` > `View Webhooks`

![](./assets/integration&view.png)

3. Expand `Infra Bot` and click `Copy Webhook URL`

![](./assets/get%20webhook.png)