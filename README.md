# AWS Elastic Beanstalk Deployment Action

This action deploys an application to AWS Elastic Beanstalk.

## Inputs

### `aws_access_key_id`

**Required** The AWS access key ID. This should be stored as a secret in your repository settings.

### `aws_secret_access_key`

**Required** The AWS secret access key. This should be stored as a secret in your repository settings.

### `aws_region`

**Required** The AWS region where your Elastic Beanstalk application is located.

### `application_name`

**Required** The name of your Elastic Beanstalk application.

### `environment_name`

**Required** The name of your Elastic Beanstalk environment.

### `env_vars`

**Required** The environment variables for your application. This should be a string of key-value pairs separated by spaces, e.g., `'KEY1=VALUE1 KEY2=VALUE2'`.

## Example usage

```yaml
uses: SociallyAwkk/your-repo-name@main
with:
  aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
  aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  aws_region: 'us-west-2'
  application_name: 'your-application-name'
  environment_name: 'your-environment-name'
  env_vars: 'KEY1=VALUE1 KEY2=VALUE2'