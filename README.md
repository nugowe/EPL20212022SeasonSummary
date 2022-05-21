# EPL20212022SeasonSummary

https://user-images.githubusercontent.com/25004712/169288114-41691561-4794-4d31-8b89-caaa9edabb12.mp4

![Screenshot from 2022-05-19 06-03-16](https://user-images.githubusercontent.com/25004712/169279028-d7479800-2455-4258-bb79-8672e52b938b.png)

STEP 1: External API call triggers the Pipeline (Postman in my case)

STEP 1': The Pipeline is also triggered via a Cron Job scheduler. (The Goal here is to capture weekday changes and have the most update)

STEP 3: The EPLTableStatus code  is checked out.

STEP 4: Docker credentials are sought after.

STEP 5: The Credentials furnished from 4 are then used to build the Restful API Code.

STEP 6: The built image is then pushed to the Dockerhub Registry.

STEP 7: At this Stage, the Terraform IAC takes over, changing to the approiprate terraform directory and initializing the aws plugins and its dependencies.

STEP 7': AWS Credentials are fetched and defined as a variable in order to make API calls to AWS Infrastructure during the Terraform runtime.

STEP 8: Terraform validates the code ensuring that the resource and module syntax declared is approiprate for deployment

STEP 9: Terraform maps out a plan of the intending ECS Infrastructure.

STEP 10:  Terraform attempts to build the ECS Infrastructure making API calls to AWS Infrastructure using the credentials supplied in STEP 7'.

STEP 11: Terraform is Idempotent by nature so the current state of for this stored in an s3 bucket.

STEP 12: A User attempts to use the ENDPOINTS to access the data of the persons choice.

STEP 13: The Application Load balances traffic between the two availability zones (us-east-1a or us-east-1b) ensuring traffic is evenly distributed without unnecessarily tasking the cluster.

* This code does not have any unit testing. For Production, its important to define unit testing for defining expected outcomes and discovering unknown unknowns.
