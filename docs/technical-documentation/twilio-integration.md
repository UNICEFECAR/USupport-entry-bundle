# Jitsi Integration

### Table of Contents

[Introduction](twilio-integration.md#introduction)

[Creating a Jitsi Room for Real-Time Video Communication](twilio-integration.md#creating-a-jitsi-room-for-real-time-video-communication)

[Initial Setup (Prerequisite)](twilio-integration.md#initial-setup-prerequisite)

[Workflow](twilio-integration.md#workflow)

[Step 1: Generating an Access Token](twilio-integration.md#step-1-generating-an-access-token)

[Step 2: Connecting to the Jitsi Room](twilio-integration.md#step-2-connecting-to-the-jitsi-room)

[Step 3: Joining the Room and Establishing the Media Session](twilio-integration.md#step-3-joining-the-room-and-establishing-the-media-session)

[Step 4: Real-Time Communication and Data Transmission](twilio-integration.md#step-4-real-time-communication-and-data-transmission)

[Privacy & Security & Confidentiality](twilio-integration.md#privacy-and-security-and-confidentiality)

### Introduction

Jitsi is an open-source video conferencing platform that enables secure, real-time communication. In uSupport, each consultation is hosted inside a Jitsi Room, identified by its consultation ID. This provides private video sessions between a client and a provider, fully integrated with uSupport’s chat and consultation lifecycle.

### Creating a Jitsi Room for Real-Time Video Communication

In uSupport, Jitsi Rooms are created dynamically at the time of the consultation. The **consultation ID** serves as the unique room name. No manual pre-creation of rooms or tokens is required — once a consultation begins, the room becomes accessible to its participants.

### Initial Setup (Prerequisite)

* A running Jitsi deployment (Prosody, Jicofo, Jitsi Videobridge, and Web components).
* The Jitsi React SDK integrated into the frontend application.
* Environment variables for assets (e.g., Amazon S3 bucket for avatars).
* uSupport backend and socket infrastructure for chat, typing indicators, presence, and consultation lifecycle management.

### Workflow

#### Step 1: Creating a Jitsi Room

* A consultation in uSupport automatically corresponds to a Jitsi Room.
* The consultation ID is used as the room name.
* When a session begins, the frontend passes this ID to Jitsi, and the room is created dynamically.

#### Step 2: Connecting to the Jitsi Room

* The frontend loads the Jitsi IFrame using the consultation ID as the room name.
* Custom configurations are applied, such as starting with audio or video muted, hiding branding, adjusting toolbar buttons and displaying custom controls.
* The user’s display name and avatar are set through the Jitsi interface.

#### Step 3: Joining the Room and Establishing the Media Session

* Once the IFrame initializes, the participant joins the consultation’s Jitsi Room.
* Jitsi Videobridge manages the media session, routing encrypted audio and video between participants.
* The frontend tracks provider presence through Jitsi participant events and uSupport socket messages.

#### Step 4: Real-Time Communication and Data Transmission

* Participants exchange audio and video streams using WebRTC, with Jitsi handling encryption, encoding, and adaptive quality.
* Real-time chat, typing indicators, and session events (such as provider joining or leaving) are managed through uSupport’s socket infrastructure.
* UI controls (mute/unmute microphone, toggle camera, leave session) are connected to Jitsi commands.

### Privacy & Security & Confidentiality

* **Transport Encryption**: All audio and video traffic is encrypted using DTLS-SRTP.
* **Optional End-to-End Encryption**: Jitsi supports enabling end-to-end encryption in compatible browsers, if required in the future.
* **No Media Interception**: Jitsi Videobridge relays encrypted media and does not store or intercept it.
* **Data Minimization**: Chat data is handled by uSupport’s backend under strict retention policies.
* **Non-Interception Policy**: Neither Jitsi nor uSupport access the contents of the communication streams.
