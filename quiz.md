```bash
0. Sign up for Datadog and install datadog-agent

For this task head to https://www.datadoghq.com/ and sign up for a free Datadog account. When signing up, you’ll have the option of selecting statistics from your current stack that Datadog can monitor for you. Once you have an account set up, follow the instructions given on the website to install the Datadog agent.



Sign up for Datadog - Please make sure you are using the US website of Datagog (https://app.datadoghq.com)
Use the US1 region
Install datadog-agent on web-01
Create an application key
Copy-paste in your Intranet user profile (here) your DataDog API key and your DataDog application key.
Your server web-01 should be visible in Datadog under the host name XX-web-01
You can validate it by using this API
If needed, you will need to update the hostname of your server
Repo:

GitHub repository: alx-system_engineering-devops
Directory: 0x18-webstack_monitoring
```

```bash
1. Monitor some metrics
    Among the litany of data your monitoring service can report to you are system metrics. You can use these metrics to determine statistics such as reads/writes per second, which can help your company determine if/how they should scale. Set up some monitors within the Datadog dashboard to monitor and alert you of a few. You can read about the various system metrics that you can monitor here: System Check.
    Set up a monitor that checks the number of read requests issued to the device per second.
    Set up a monitor that checks the number of write requests issued to the device per second.

Repo:
    GitHub repository: alx-system_engineering-devops
    Directory: 0x18-webstack_monitoring
```

```bash
2. Create a dashboard
    Now create a dashboard with different metrics displayed in order to get a few different visualizations.
    Create a new dashboard
    Add at least 4 widgets to your dashboard. They can be of any type and monitor whatever you’d like
    Create the answer file 2-setup_datadog which has the dashboard_id on the first line. Note: in order to get the id of your dashboard, you may need to use Datadog’s API

Repo:
    GitHub repository: alx-system_engineering-devops
    Directory: 0x18-webstack_monitoring
    File: 2-setup_datadog
```
