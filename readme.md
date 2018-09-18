# Bucket LifeCycle Policy Checker

The purpose of this script is to scan all S3 buckets of a given account and list which buckets have lifecycle policies attached.

### In order to use this script, do the following:
- Log in to the account you wish to 'scan' and create a new IAM user. Give this user full access to S3 and programmatic keys. 

- Add these credentials to your ~/.aws/credentials file with an appropriate profile name

- Clone the script

- Edit policy.sh and change the profile name to the one your created above.

- Save and exit. 

  ```shell
  chmod +x policy.sh
  ```

- Use ./policy.sh to run the script.

- After the script completes check 'lifecycle.txt' to find a list of bucket names. Any bucket name in this list has some form of LifeCycle policy attached.