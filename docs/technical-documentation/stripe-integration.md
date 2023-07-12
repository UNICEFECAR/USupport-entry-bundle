# 🏦 Stripe Integration


### Table of Contents

[Introduction](stripe-integration.md#introduction)

[1.   Payment Flow:](stripe-integration.md#1.-payment-flow)

[2.   Cancellation and Refund Process:](stripe-integration.md#2.-cancellation-and-refund-process)

[3.   Payment history](stripe-integration.md#3.-payment-history)

[4.   Transfer funds to providers’ flow](stripe-integration.md#4.-transfer-funds-to-providers-flow)

[5.   Adhering funds from donations](stripe-integration.md#5.-adhering-funds-from-donations)

### **Table of Figures**

Figure 1: Payment flow diagram

Figure 2: Refund flow diagram

Figure 3: Payment history diagram

### Introduction

This comprehensive document serves to provide a detailed overview of the various payment flows and processes within the USupport platform. By leveraging the powerful functionalities offered by Stripe, our integrated payment system ensures secure and seamless transactions. From initiating payments to handling refunds, this document will cover every step involved in the payment ecosystem of the USupport platform. Whether you are a client, a service provider, or an administrator, understanding these payment flows is essential for effectively utilizing the platform's payment features.

### 1.  Payment Flow:

The payment flow within the USupport platform encompasses a series of actions and processes that occur from the moment the client is redirected to the checkout page until the payment is successfully completed. Let's break down each step:

1.1.        The client lands on the checkout page:

* &#x20;The Client UI initiates a service call to the USupport payment microservice to create a payment intent.
* &#x20;The request includes information such as the country ISO code, selected language ISO code, user ID, client ID, and Stripe customer ID (generated if it doesn't exist or is not provided by the UI).
* Additional details like email address and consultation ID are also included.
* The consultation ID represents the selected slot for a consultation, and a corresponding entry is created in the Clinical Database with a "pending" status. This status allows the client 5 minutes to complete the payment. After a successful payment, the status transitions to "scheduled." If the payment isn't completed within the given time, the status becomes "timedout," and the slot becomes available for other clients.

1.2.        The "/create-payment-intent" route:

* Retrieves and validates the information from the request (the fields presented above).
* &#x20;If there's a data validation error, an error response is returned.
* &#x20;If the validation succeeds, the "createPaymentIntent" controller is called.

1.3.        The "createPaymentIntent" controller:

* Validates that the consultation was successfully created for the specific country clinical database.
* f the consultation is not found, the process ends with a "consultationNotFound" error.
* &#x20;If a Stripe customer ID wasn't provided, the controller creates a new Stripe customer and stores its ID in the USupport PII database.
* &#x20;Retrieves the currency for the specific country.
* &#x20;Utilizes the "stripe" library with a secure initialized connection using the secret key to create a new payment intent.
* &#x20;The successful response includes information such as client secret, price, currency, and payment intent ID.

1.4.        Rendering the Stripe Payment Element:

* &#x20;The UI uses the obtained client secret to render the "Stripe Payment Element," which is provided by the "@stripe/react-stripe-js" library.
* &#x20;The Stripe Payment Element includes various functionalities:
  * Available payment methods (configurable via the Stripe dashboard and dependent on the country of operation).
  * Card number field (accepts multiple card types and is securely validated by Stripe).
  * Card expiry date, CVC, issuing country, and additional fields specific to certain countries.
* It is important to emphasize that Stripe, as the payment service provider, is responsible for validating and processing the data entered by clients into the payment form.

1.5.        Payment submission and validation:

* Once the client selects a payment method and provides the required information, they click the "Pay" button.
* &#x20;The payment submission process begins, utilizing the "confirmPayment" functionality from the "@stripe/react-stripe-js" library.
* &#x20;This function validates the fields and displays any errors to the client.
* Upon successful validation, Stripe processes the payment, and the client is redirected to a new page displaying the payment status.
* &#x20;Additional checks, such as 3D security checks required by the client's bank provider, may be displayed.

1.6.        Webhook handling:

* After the payment, Stripe initiates a service call to the USupport payments microservice, specifically the "/webhook" endpoint.
* &#x20;The webhook provides information about the payment status, allowing records to be kept and updating the consultation entry's status based on the payment outcome.

1.7.        The "/webhook" endpoint :

* Calls the "processWebhookEvent" controller to handle successful payments.
* &#x20;The "processWebhookEvent" controller performs the following actions:
  * Creates a new entry in the "transaction\_log" table within the Clinical Database, containing all relevant payment information, such as the consultation ID, paymentIntent ID, and campaign ID.
  * Updates the consultation entry status to "scheduled," indicating a successful payment and confirming the booking.

This concludes the payment flow within the USupport platform. By following this sequence of actions and leveraging the functionalities provided by Stripe, clients can seamlessly complete their payments while ensuring data security and maintaining accurate records within the system.

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption><p>Figure 1: Payment flow diagram</p></figcaption></figure>

### 2.  Cancellation and Refund Process:

Within the USupport platform, clients have the option to cancel booked consultations. To be eligible for a refund, the cancellation must occur more than 24 hours before the scheduled start time. Cancellations made within the last 24 hours will not result in a refund for the client, and the service providers will still be entitled to their compensation. Let's explore the sequence of actions involved in the cancellation and refund process:

2.1.        Client initiates cancellation:

·      When a client decides to cancel a consultation with more than 24 hours before the starting time, the following actions take place within the system:

* The Client UI interface makes a call to the USupport payment microservice to initiate the refund.
* The request includes the consultation ID, country ISO code, language ISO code, and user ID.

2.2.        The "/refund" route:

* &#x20;Retrieves the transmitted data from the request.
* &#x20;Validates the data, checking for any errors.
  * If there is a data validation error, the server returns an error response.
  * If the data validation succeeds, the "processRefund" controller is called.

2.3.        The "processRefund" controller:

* &#x20;Checks the "transaction\_log" table for transactions associated with the provided consultation ID.
* &#x20;Validates that the transaction was processed successfully.
* &#x20;Upon successful validation, the controller calls the Stripe refund service, passing the payment intent ID for the transaction.
  * Additional metadata information, such as the consultation ID, user ID, country ISO code, and language ISO code, is also included.
  * This refund process will transfer the funds back to the client's account that was originally used for payment.
* The controller creates a new entry in the "transaction\_log" table to store details about the refund transaction.
* &#x20;Finally, the consultation's status is updated, transitioning to "canceled" to reflect the cancellation of the consultation.

By following this process, clients can request cancellations and, if eligible, receive refunds for consultations made on the USupport platform. The system ensures that refunds are processed accurately and that the consultation status is updated accordingly.

<figure><img src="../.gitbook/assets/image (59).png" alt=""><figcaption><p>Figure 2: Refund flow diagram</p></figcaption></figure>

### 3.  Payment history

The clients of the USupport platform can preview all their payment history. The USupport system stores for each client a Stripe customer ID which acts as a unique identifier which is associated to all the payments made by one client.

3.1.        The client requests their payment history data.

* &#x20;The Client UI makes a call to the USupport payment microservice to retrieve all the payment history data.
* &#x20;The request includes the country ISO code, language ISO code, and user ID.

3.2.        The “/history” route:

* Retrieves the transmitted data from the request.
* &#x20;Validates the data, checking for any errors.
  * If there is a data validation error, the server returns an error response.
  * If the data validation succeeds, the "getPaymentHistory" controller is called.

3.3.        The "getPaymentHistory" controller performs the following actions:

* It initiates a call to the Stripe "paymentIntents" service, providing the stripe\_customer\_id.
* The service responds with all available payment intents associated with the provided stripe\_customer\_id.
* For each payment intent, the controller extracts the necessary information to be displayed on the Client UI, such as the product name, price, transaction date, payment ID, and service description.
* Additionally, for each payment, the controller calls the Stripe "charges" service to retrieve the receipt URL provided by Stripe.
* The controller also contacts the Stripe "invoices" service to obtain the invoice for each payment.
* Once all the required data has been successfully gathered, the controller returns the computed information to the Client UI.
* The client can then view the payment history within the USupport platform, where the provided information is displayed.

By leveraging the capabilities of the Stripe services, the "getPaymentHistory" controller enables clients to access and review their payment history, including detailed information about each transaction, receipts, and associated invoices within the USupport platform.

<figure><img src="../.gitbook/assets/image (24).png" alt=""><figcaption><p>Figure 3: Payment history diagram</p></figcaption></figure>

### 4.  Transfer funds to providers’ flow

The transfer of funds from the USupport platform to the providers is facilitated by the country administrator, who has access to both the Country Admin interface and the Stripe Dashboard. The following steps outline the process of transferring funds to providers:

* The country administrator logs in to the Country Admin interface, navigates to the Providers page, in which a comprehensive view of the activity records for each provider can be found.
* &#x20; The administrator then can overview detailed information about the remuneration that providers are entitled to, based on their activities.
* Using the functionality available in the Stripe Dashboard, the administrator can initiate the transfer of funds directly to the providers' bank accounts.
* &#x20;The funds transfers are facilitated through "connected accounts," which represent individual entities associated with the Stripe account. These connected accounts undergo verification by Stripe to ensure they meet security criteria and are eligible for transfers.

By utilizing the capabilities of the Stripe Dashboard and working with verified connected accounts, the country administrator can efficiently and securely transfer funds to providers' bank accounts, based on the remuneration they have earned through their activities on the USupport platform.

### 5.  Adhering funds from donations

The USupport platform offers an additional payment option through donations, which are linked to campaigns and provide clients with coupon codes for their consultations. To accept a donation payment, the following steps should be followed:

* Access the Stripe dashboard and navigate to the "Payment Links" section.
* Configure a new payment link by providing the necessary information, such as the price and the purpose for which the link will be used.
* &#x20;Generate the new link and share it with potential donors.
* &#x20;When donors access the link, they will be presented with a payment checkout form where they can easily make their donation.

By leveraging the functionality of the Stripe dashboard and utilizing payment links, the USupport platform can seamlessly accept donations. This allows donnors to contribute to campaigns and clients to receive coupon codes that can be applied towards their consultations.
