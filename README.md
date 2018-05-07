### What does this Block do for me?
With integrations to all your marketing and advertising platforms [Funnel](https://funnel.io) automatically collects all the data you need from any data source.

The Funnel service provides:
- Hundreds of existing marketing sources, and custom sources as part of your enterprise subscription
- Default normalization and mapping of columns like campaign, cost, impressions, clicks
- Initial clean-up and custom grouping to prepare the data for you Looker views
- Funnel compensates for ad platforms that are eventually consistent, with historic data changing for multiple reasons
- Integrations adjust for quotas, rate limits, retries, temporary errors
- Allow your marketing department to manage addition of new ad accounts as well as token and password changes

### Block Info
This Block will work as configured with the public demo data from Funnel.
The demo data is available at https://bigquery.cloud.google.com/dataset/firebase-funnel:funnel_looker_demo

### Block Structure
This Block contains a single Looker View which aggregates data from all the original data sources in Funnel.
A Marketing Overview dashboard is provided as an example and starting point.

### Implementation Instructions
Create a Looker database connection to the funnel demo data:
- Name: funnel_looker_demo
- Dialect: Google BigQuery Standard SQL
- Project name: firebase-funnel
- Dataset: funnel_looker_demo
You will have to create your own Oauth credentials for BigQuery, but the dataset is public, so all BigQuery users already have read access to the demo data.

Copy the lkml files to your Looker project and start exploring.

### Customizations
If you are an existing Funnel customer, generate your custom LookML to match your own Funnel schema, using the "View LookML" feature in the Funnel app.
Contact support@funnel.io to enable this feature and get help with your setup.
New customers are welcome to sign up for a demo at https://funnel.io/

### What if I find an error? Suggestions for improvements?
Please contact support@funnel.io for any questions or feedback relating to this block.
