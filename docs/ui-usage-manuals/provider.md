# Provider

### Table of Contents

[Table of Figures](provider.md#ref130504120)

[Introduction](provider.md#introduction)

[What is the Provider Interface?](provider.md#what-is-the-provider-interface)

[Processes](provider.md#processes)

[1. Login to the Provider Interface](provider.md#id-1.-login-to-the-provider-interface)

[2. Forgot Password](provider.md#id-2.-forgot-password)

[3. Dashboard Screen](provider.md#id-3.-dashboard-screen)

[4. Personal Calendar – add availability](provider.md#ref130504090)

[5. Preview the Activity History](provider.md#id-5.-preview-the-activity-history)

[6 Upcoming Consultations](provider.md#id-6.-upcoming-consultations)

[6.1. Preview Scheduled Consultations](provider.md#id-6.1.-preview-scheduled-consultations)

[6.2. Edit Scheduled Consultations](provider.md#id-6.2.-edit-scheduled-consultations)

[7. Preview all Clients](provider.md#id-7.-preview-all-clients)

[8. Profile settings](provider.md#id-8.-profile-settings)

[9. Campaigns](provider.md#id-9.-campaigns)

[10. Campaigns availability](provider.md#ole_link90)

[11. View campaigns details](provider.md#ole_link12)

[12. My Q\&A](provider.md#id-12.-my-q-and-a)

### Table of Figures <a href="#ref130504120" id="ref130504120"></a>

Figure 1: Welcome screen

Figure 2: Login screen

Figure 3: Forgot Password screen

Figure 4: Dashboard screen

Figure 5: Calendar screen

Figure 6: Calendar screen - Personal Scheduler

Figure 7: Slot states

Figure 8: Changing the state of a box

Figure 9: Template availability form

Figure 10: Activity history screen

Figure 11: Propose consultation pop up

Figure 12: Consultations screen

Figure 13: Edit scheduled consultations

Figure 14: Edit scheduled consultation flow

Figure 15: Clients screen

Figure 16: Provider account settings screen

Figure 17: Edit profile details screen

Figure 18: Notification settings screen

Figure 19: Reports screen

Figure 20: Reports filtering options

Figure 21: Contact us screen

Figure 22: Privacy policies screen

Figure 23: Frequently asked questions screen

Figure 24: Campaigns screen

Figure 25: Enroll to a new campaign

Figure 26: Campaign Terms of Use

Figure 27: Add availability for campaign

Figure 28: Availability campaign for campaigns

Figure 29: Visualize campaign activity

Figure 30: Campaign activity screen

Figure 31: My Q\&A screen

Figure 32: My Q\&A answering to a questions.

Figure 33: My Q\&A archive question.

Figure 34: My Q\&A answer tags.

Figure 35: My Q\&A add new answer.

### Introduction

Dear colleagues,

This guide will present the Provider Interface which is part of the uSupport platform. It is a core element that allows the service providers to operate and perform their activity in a productive manner.

### What is the Provider Interface?

The Provider Interface is a custom-built web-based application for users that will provide psychological consultations using the uSupport platform.

This platform aims to provide an easy-to-use interface that supplies the necessary capabilities to manage personal schedules and perform one-to-one video-audio-chat online consultations with multiple clients.

### Processes

### 1. Login to the Provider Interface

Step 1: Navigate to the Provider Interface (https://usupport.online/provider/).

Step 2: From the Welcome Screen select a country and a language.

Step 3: Insert valid login credentials.

<figure><img src="../.gitbook/assets/image (370).png" alt=""><figcaption><p>Figure 1: Welcome Screen</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (372).png" alt=""><figcaption><p>Figure 2: Login Screen</p></figcaption></figure>

### 2. Forgot Password

Step 1: Select “I forgot my password” see Figure 2.

Step 2: Insert a valid email address see Figure 3.

Step 3: Check provided email address for a recovery email.

<figure><img src="../.gitbook/assets/image (374).png" alt=""><figcaption><p>Figure 3: Forgot Password Screen</p></figcaption></figure>

If a valid and registered email address within the platform was provided, an automated email will be sent to it. The email will contain a temporary valid link that can be used to set a new password. Following this procedure, the user can access the account using the email address and the newly created password.

### 3. Dashboard Screen

<figure><img src="../.gitbook/assets/image (375).png" alt=""><figcaption><p>Figure 4: Dashboard screen</p></figcaption></figure>

On login provider is navigated to the Dashboard screen. It is split into three parts. The top left panel shows the how many available days the provider has scheduled with available slots from the current month along with the quantity of upcoming consultations in the next 7 days. The left bottom part (Schedule & Availability) presents a calendar containing information about provider's availability for day, week and month.&#x20;

* Highlighted day of the week presents the current day;
* The turquoise box shadow represents day with set availability slots and purple box highlight  presents the selected day;
* The gray box represents a day in the calendar when the provider is not available for consultations.

The right container presents the Upcoming consultations.&#x20;

#### 3.1. Schedule & Availability:

Upon selection of Day the slots are separated hourly with unavailable set as default. Individually on clicking on particular time of the selected day the provider might assign a slot for consultation related to certain organization or campaign:&#x20;

<figure><img src="../.gitbook/assets/image (376).png" alt=""><figcaption><p>Figure 5: Day slots</p></figcaption></figure>

Within Week view the provider can see the hourly slots separated by dates which are part of the selected week with organizations and campaigns available on selection similarly to what the day view presented:

<figure><img src="../.gitbook/assets/image (377).png" alt=""><figcaption><p>Figure 6: Week slots</p></figcaption></figure>

Upon selecting Month view the provider can select particular date and a new modal will open - again with hourly slots available:

<figure><img src="../.gitbook/assets/image (378).png" alt=""><figcaption><p>Figure 7: Month slots</p></figcaption></figure>

The Day, Week, and Month views provide the same core functionality: providers can mark individual hourly time slots as available for consultations or remove existing availability.

The three views differ only in how the schedule is presented, allowing providers to manage their availability using the view that is most convenient for their planning needs.

For larger or recurring availability changes across future dates, providers do not need to update each time slot individually. The Add Availability Template button is always available in the top-right corner of the Schedule & Availability page and allows providers to configure availability in bulk.

<figure><img src="../.gitbook/assets/image (379).png" alt=""><figcaption><p>Figure 8: Add availability template</p></figcaption></figure>

When the provider clicks **Add Availability Template**, the system opens the **Availability Template** form.

This form allows the provider to define availability in bulk across a selected period, instead of updating individual time slots one by one.

The template includes the following sections:

* **Campaign and Organization**\
  The provider selects the relevant organization or campaign for which the availability will apply.
* **Date Range**\
  The provider specifies the **start date** and **end date** for the period in which the template should be applied.
* **Weekly Schedule**\
  The provider configures availability for each day of the week separately.\
  For every day, the provider can:
  * define a **From** and **To** time range for consultations, or
  * mark the day as **unavailable** by selecting the corresponding checkbox.

Once completed, the provider clicks **Add Template Availability** to apply the template. The system then creates availability slots across the selected date range according to the defined weekly schedule.

<figure><img src="../.gitbook/assets/image (369).png" alt=""><figcaption><p>Figure 9: Manage availability template</p></figcaption></figure>

#### 3.2. Upcoming Consultations:



### 4. Personal Calendar – add availability <a href="#ref130504090" id="ref130504090"></a>

Step 1: Login to the Provider Interface.

Step 2: On the “Navigation Menu” select “Calendar”.

<figure><img src="../.gitbook/assets/image (249).png" alt=""><figcaption><p>Figure 6: Calendar screen - Personal scheduler</p></figcaption></figure>

This screen provides the necessary functionality for a provider to set their availability. More exactly, the time intervals when they can undertake online activity such as audio-video-chat consultations. This information will dynamically update based on the provider’s actions. It will be stored within the system and presented to the clients when they try to book an appointment with a specific provider.

Figure 6 presents the following elements:

* Each box inside the presented table represents an hour in a day.
* In the top-right corner, we can see the date interval for which the availability is presented.
* Each column is preceded by the day name and date.
* The leftmost column presents the hours of the day from 00:00 until 23:00, which the provider can choose based on their schedule.

A box inside the table can have three different states, unavailable, available and scheduled. The unavailable state is presented in Figure 7 as the grey block on the left, the available states are the two in the center - part of specific campaign and organization. The scheduled state is represented on the right. For the first option ( unavailable state) the box will present a text describing its state when the user hovers over it. The box that is in the scheduled state will display the avatar and name of the client, all the time.

<figure><img src="../.gitbook/assets/image (240).png" alt=""><figcaption><p>Figure 7: Slot states</p></figcaption></figure>

The state of the boxes can be changed by clicking the three dots at the top-right corner and selecting the new state which pops up. The first slot shows the provider as unavailable. The second shows organization related availability slot and the third one shows campaign(coupon) related availability slot.

Once this action is performed the state of the box will change and the information will be stored in the system.

For a box to transition into one of the states from the second row presented in Figure 8, a consultation needs to be booked by a client. The client can book consultations either by direct purchase, select free slots that are marked by the provider or by using existent campaigns.

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption><p>Figure 8: Changing the state of a box</p></figcaption></figure>

Providers can opt to participate in various sponsored programs, which allows them to select particular time slots that will be designated for that program. Consequently, the sponsors will cover the cost of these time slots, rather than requiring clients to pay.

Based on the provider's selection of campaigns, they can allocate particular time slots to those campaigns, as demonstrated in the accompanying image. Subsequently, the provider's calendar will display the assigned campaign along with the sponsor's logo and the campaign name, as showcased in _Figure 8_.

5\. Using the Template availability

Step 1: Login to the Provider Interface.

Step 2: On the “Navigation Menu” select “Calendar”.

Step 3: At the top-left corner select “Add template availability” (see Figure 6).

Step 4: Fulfil the availability form.

Step 5: Save the changes by selecting “Add template availability” button at the bottom of the page.

The template availability form helps the providers to set their availability for a longer period for each week day.

Figure 9 presents the form and all the fields that need to be fulfilled.

Firstly, the provider needs to select a start date and an end date which will represent the period for which the availability will be set. The start dates are only Mondays and the end dates are only Sundays, following this approach we ensure that availability is scheduled for full weeks.

Secondly, for each week day, the provider has to choose between being available or not. In the case when a specific day should be unavailable, the checkbox with the label “Set the day as unavailable” should be selected. Otherwise, the provider needs to select the time interval - from which hour until which hour he/she is available. For example, we can see in Figure 9 that on Tuesday the available time interval is set from 06:00 until 10:00. This will state that for each Tuesday within the selected period the provider is available for online consultations at the set time interval. After the provider has completed the form and saved it, the personal calendar will automatically update.

<figure><img src="../.gitbook/assets/image (241).png" alt=""><figcaption><p>Figure 9: Template availability form</p></figcaption></figure>

### 5. Preview the Activity History

Step 1: Login to the Provider Interface.

Step 2: On the “Navigation Menu” select “Activity History”.

The activity history screen presents the full activity which a provider undertook in the past using the platform. This consists of detailed information about the clients, their personal data, the time when consultations took place and the text messages that were exchanged in the chat during consultations.

As we can see in Figure 10 the activity history screen presents a split view. The left-hand side contains a list of all the consultations that took place. Once one consultation is selected by the provider the right-hand side will present more information about the specific consultation. The following information can be visualized:

* Date and time when either a client or provider joined the consultation.
* Date and time when either a client or provider switched on/off their camera.
* Date and time when either a client or provider switched on/off their microphone.
* Exchanged messages during the consultation.



<figure><img src="../.gitbook/assets/image (243).png" alt=""><figcaption><p>Figure 10: Activity history screen</p></figcaption></figure>

Furthermore, at the bottom of the right side, there is a button “Propose consultation” which allows providers to propose new consultations to clients (see Figure 11).

<figure><img src="../.gitbook/assets/image (242).png" alt=""><figcaption><p>Figure 11: Propose consultation pop up</p></figcaption></figure>

### 6. Upcoming Consultations

#### 6.1. Preview Scheduled Consultations:

Step 1: Login to the Provider Interface.

Step 2: On the “Navigation Menu” select “Consultations”.

This screen presents to the provider all upcoming consultations. They can either be suggested by the provider or booked by the clients.

The screen provides search functionality so if providers have numerous consultations with different clients they can easily find a specific consultation by typing the name of the client.

Each consultation is presented via a rectangle and contains the following information:

* icon of the client,
* name of the client,
* date and time of the appointment,
* type of the appointment - suggested or paid,
* price of the consultation and logo of the sponsor in case the client booked using a sponsored coupon or a free badge showing that the consultation will be conducted without the client to be charged.
* a drop-down menu for quick access to the client’s profile.



<figure><img src="../.gitbook/assets/image (244).png" alt=""><figcaption><p>Figure 12: Consultations screen</p></figcaption></figure>

#### 6.2. Edit Scheduled Consultations:

Step 1: Select Cancel consultation (see figure 12).

Step 2: Select to either Suggest new time (which client has to accept to become scheduled), keep the current consultation or Cancel the current one entirely (see figure 13)

<figure><img src="../.gitbook/assets/image (250).png" alt="Edit scheduled consultations"><figcaption><p>Figure 13: Edit scheduled consultations</p></figcaption></figure>

<figure><img src="../.gitbook/assets/Scheduled Sessions Flow Provider.drawio.png" alt=""><figcaption><p>Figure 14: Edit scheduled consultation flow</p></figcaption></figure>



### 7. Preview all Clients

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “Clients”

<figure><img src="../.gitbook/assets/image (245).png" alt=""><figcaption><p>Figure 15: Clients screen</p></figcaption></figure>

### 8. Profile settings

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “Your Profile”

From this screen the provider can:

* change their account’s personal details,
* change their notification settings,
* visualise their activity report
* raise an issue to the country administrator,
* access the privacy policy,
* access the frequently asked questions.



<figure><img src="../.gitbook/assets/image (246).png" alt=""><figcaption><p>Figure 16: Provider account settings screen</p></figcaption></figure>

By accessing the profile details screen, the provider can preview the data that is displayed to the clients, see Figure 17 - the information inside the red rectangle. The provider is able to change this data by selecting the “Edit details” button.

Moreover, from here the provider can change the password for the account and delete the account.

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption><p>Figure 17: Edit profile details screen</p></figcaption></figure>

From the notification settings screen the provider can enable/disable the email notifications or the scheduled appointments notifications. Another setting is available for providers to adjust how long before an appointment they want to be notified: 15, 30, 45 or 60 minutes. Based on their preference they can select one of the options (see Figure 18).

<figure><img src="../.gitbook/assets/image (73).png" alt=""><figcaption><p>Figure 18: Notification settings screen</p></figcaption></figure>

The providers can access their activity history through the provided reports, which include details such as the client's name, date and time of the consultation, the price paid, and whether a campaign sponsored the session. Moreover, the provider has the option to export all the information displayed on the screen in a CSV file and filter the information based on the campaign, client, and time period.

<figure><img src="../.gitbook/assets/image (99).png" alt=""><figcaption><p>Figure 19: Reports screen</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (132).png" alt=""><figcaption><p>Figure 20: Reports filtering options</p></figcaption></figure>

The contact us screen allows providers to raise questions or issues they might encounter. These will be received and addressed by the country administrators. To raise an enquiry, the provider needs to select an issue from a predefined list and add a message if required, see Figure 21.

<figure><img src="../.gitbook/assets/image (82).png" alt=""><figcaption><p>Figure 21: Contact us screen</p></figcaption></figure>

The privacy policy, terms of use and cookie policy screens are available from the profile settings, as well.

Note:

* Privacy policies, terms of use and cookie policies are country-specific. Providers should read and make sure the existing content is understood and their activity within the platform follows the established rules.

<figure><img src="../.gitbook/assets/image (162).png" alt=""><figcaption><p>Figure 22: Privacy policies screen</p></figcaption></figure>

The frequently asked questions screen represents a place where providers can navigate when searching for answers to their questions. It is recommended to visit this page every time there is any uncertainty regarding the use of the platform as the answer might already be here.

The information which is presented inside this screen is managed by the country administrators and is country specific.

<figure><img src="../.gitbook/assets/image (62).png" alt=""><figcaption><p>Figure 23: Frequently asked questions screen</p></figcaption></figure>

### 9. Campaigns

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “Campaigns”

<figure><img src="../.gitbook/assets/image (135).png" alt=""><figcaption><p>Figure 24: Campaigns screen</p></figcaption></figure>

The provider is presented with three distinct tabs on this screen, which are as follows:

* Available campaigns: represents active campaigns that the provider can enroll in.
* Active campaigns: includes campaigns that the provider is currently enrolled in.
* Past campaigns: consists of campaigns that the provider was previously enrolled in, but have now expired.

The available information for each campaign consists of the following:

* Logo and name of the sponsor offering the campaign.
* Campaign name.
* Price for a single coupon.
* Validity period of the campaign.
* Number of conducted consultations for a campaign
* Providers renumeration

The providers can participate in a campaign by selecting the three dots next to each available one and use the actions presented in Figure 25

<figure><img src="../.gitbook/assets/image (95).png" alt=""><figcaption><p>Figure 25: Enroll to a new campaign</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (64).png" alt=""><figcaption><p>Figure 26: Campaign Terms of Use</p></figcaption></figure>

In order for a provider to take part in a campaign he/she will need to agree with the Terms of Use for that specific campaign.

### 10. Campaigns availability <a href="#ole_link90" id="ole_link90"></a>

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “Campaigns”

Step 3: Select one of the campaigns in which the provider is enrolled.

Step 4: Click the three dots at the end of the row and select “Availability” option.

Step 5: Fulfil the Availability template.

Step 6: Submit the form by clicking “Add template availability”

Once a provider decided to participate in a campaign, he/she will be able to dedicate time slots for it. This can be achieved either by using the availability template or by using the approach described in Section 4. Personal Calendar – add availability.

<figure><img src="../.gitbook/assets/image (84).png" alt=""><figcaption><p>Figure 27: Add availability for campaign</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (61).png" alt=""><figcaption><p>Figure 28: Availability campaign for campaigns</p></figcaption></figure>

Providers have access to a unique availability template that allows them to specify their availability exclusively for each campaign. This specialized template makes it easier for providers to manage their schedules and ensure that they are available for campaign-related appointments.

To access this template, providers must first enroll in a campaign and click the "Add availability" option from the menu by clicking the three dots at the end of the row (see Figure 27). This option leads to a view that closely resembles the one presented in section 4 (see Figure 28). Once the provider has selected their availability, it will be displayed on their personal calendar and visible to their clients.

Using this template not only streamlines the scheduling process but also ensures that providers are able to dedicate the appropriate amount of time to campaign-related appointments.

### 11. View campaigns details <a href="#ole_link12" id="ole_link12"></a>

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “Campaigns”

Step 3: Select one of the campaigns in which the provider is enrolled.

Step 4: Click the three dots at the end of the row and select “View details” option.

<figure><img src="../.gitbook/assets/image (155).png" alt=""><figcaption><p>Figure 29: Visualize campaign activity</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (156).png" alt=""><figcaption><p>Figure 30: Campaign activity screen</p></figcaption></figure>

After successfully enrolling and adding their availability, providers can view the activities generated by a specific campaign by accessing campaign details from their account, as depicted in Figure 28. This screen is divided into two parts, with the top section displaying all upcoming consultations and the second section showing completed consultations under the same campaign. This enables providers to have a clear overview of the campaigns they choose to participate in, allowing for better organization and management of their time.

### 12. My Q\&A

Step 1: Login to the Provider Interface

Step 2: On the “Navigation Menu” select “My Q\&A”

<figure><img src="../.gitbook/assets/image (65).png" alt=""><figcaption><p>Figure 31: My Q&#x26;A screen</p></figcaption></figure>

On this screen, providers can access the necessary tools to respond to questions raised by clients. As shown in Figure 31, the questions are divided into three categories: unanswered, answered, and answered by the provider. Providers can select a category to view relevant questions.

Within the "Unanswered" tab, providers can read client questions and choose which ones to answer. To respond to a question, providers need to click the "Respond" button in the left corner of the question. Figure 32 displays the view that allows providers to provide their answers.

This feature enables providers to manage client inquiries more efficiently and promptly respond to their needs. The categorization of questions makes it easier for providers to identify which inquiries require attention and ensure no question goes unanswered.

Providers have the ability to archive questions that are deemed inappropriate for publication on the platform. To do so, providers can click on the "Archive" button located in the bottom right corner of a question. Figure 33 illustrates how providers can provide reasoning for archiving a question. This feature generates a report for country administrators to ensure the platform operates effectively and maintains its integrity by preventing potential harm.

<figure><img src="../.gitbook/assets/image (217).png" alt=""><figcaption><p>Figure 32: My Q&#x26;A answering to a questions.</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (219).png" alt=""><figcaption><p>Figure 33: My Q&#x26;A archive question</p></figcaption></figure>

The responses provided by the providers include a title, answer, and multiple tags. Providers have the option to choose from a predefined list of tags or create new ones by typing in a desired name. Figure 34 demonstrates how tags can be added and removed effortlessly.

<figure><img src="../.gitbook/assets/image (218).png" alt=""><figcaption><p>Figure 34: My Q&#x26;A answer tags</p></figcaption></figure>

After completing an answer to a client question, providers can submit it by clicking the "Send your response" button. Once submitted, the question will be moved to the "Answered" category and become visible to all clients on the platform and other providers.

In addition, providers have the option to view questions that were previously answered by other providers and provide their own response. To do so, providers can select the "Answered" tab, as shown in Figure 35.This feature allows for collaboration between providers and ensures that clients receive the most accurate and helpful answers to their inquiries.

<figure><img src="../.gitbook/assets/image (86).png" alt=""><figcaption><p>Figure 35: My Q&#x26;A add new answer</p></figcaption></figure>

Furthermore, the providers have the ability to filter the answered questions by tags or utilize the search function, which will match the results based on the Q\&A entry's title and tags.
