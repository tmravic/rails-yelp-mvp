# Yelp MVP
<p align="left">A simple app to list restaurants with randomly created names, phone numbers, categories, and pictures. The images are hosted on AWS S3, so you will need to create an IAM user with credentials and an S3 bucket to seed the images. I will provide step-by-step instructions to do so below.</p>

![Rails MPV](https://user-images.githubusercontent.com/59186645/159161932-251c9710-9900-4714-ae7d-8d96bf08a518.png)


## Installing locally :computer:
### Setup
##### Install gems
```
bundle install
```

### AWS Setup
<p align="left">This assumes you have an AWS account</p>
<p>1. Navigate to https://aws.amazon.com/console/ and sign in</p>
<p>2. Go to the S3 Management Console and a create a bucket with a name similar to "rails-yelp-mvp-pics" (the exact same name cannot be used)</p>
<p>3. Once in your bucket's settings page, in the Permissions tab, make sure Block all public access is OFF</p>
<p>4. Navigate to the IAM dashboard, click the button Add users to create a user called "aws-rails-s3-user"</p>
<p>5. On the left sidebar choose Policies and create a new policy called "aws-rails-s3-policy" with this JSON</p>
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::rails-yelp-mvp-pics",
                "arn:aws:s3:::*/*"
            ]
        }
    ]
}
```
<p>6. Click Add Permissions, Attach existing policies directly, find and add the "aws-rails-s3-policy" to "aws-rails-s3-user"</p>
<p>7. Return to "aws-rails-s3-user" and find the Security Credentials tab. Create an Access Key ID and Secret Access Key, copy/paste them somewhere</p>
```
EDITOR=nano rails credentials:edit
```
<p>8. In your terminal write the above line and proceed to uncomment these lines and input the two keys</p>
<p>9. In the root directory your project should have storage.yml, you will need to input the following</p>
```
amazon:
  service: S3
  access_key_id: <%= Rails.application.credentials.aws[:access_key_id] %>
  secret_access_key: <%= Rails.application.credentials.aws[:secret_access_key] %>
  bucket: "rails-yelp-mvp-pics" < PUT YOUR BUCKET'S NAME
  region: "ap-northeast-1"      < PUT YOUR REGION'S NAME
```
<p>10. Look inside config/environments/development.rb and make sure you have `config.active_storage.service = :amazon`</p>
<p>11. Also look inside config/environments/production.rb and make sure you have `config.active_storage.service = :amazon`</p>

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run your server

```
rails s
```
