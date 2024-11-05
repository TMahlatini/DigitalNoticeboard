# Digital Notice Board

A Ruby on Rails application that creates a digital notice board for school announcements, currently focusing on ride-sharing requests from the school's listserv emails.

## Overview

This application serves as a digital notice board where announcements are displayed as sticky notes. Currently, it integrates with a custom Python API that fetches emails from the school's rides listserv and converts them into sticky notes automatically.

### Features

- **Email Integration**: Automatically fetches and converts emails into sticky notes
- **Ride Request Detection**: Automatically detects and tags:
  - Ride requests
  - Locations mentioned
  - Requested dates (not perfect)
- **User Authentication**: Uses Devise for secure user management
  - Email confirmation required
  - Admin privileges for content management
- **Content Management**:
  - Sticky notes automatically expire after one month
  - Admin users can delete sticky notes
  - Sticky notes display sender's email and posting date

## Technical Details

### Dependencies

- Ruby on Rails 7.2
- SQLite database
- Devise for authentication
- Custom Python API for email fetching

### Key Components

- `FetchEmailsService`: Integrates with Python API to fetch and process emails
- `StickerNote` model: Handles sticky note logic and expiration
- `NoticeBoard` controller: Manages the main display interface

### Future Plans

- Add manual sticky note creation for general announcements
- Expand email integration to other school listservs
- Implement categorization for different types of announcements
- Add search and filtering capabilities

## Setup

1. Clone the repository
2. Install dependencies:
```bash
bundle install
```
3. Setup the database:
```bash
rails db:create
rails db:migrate
```
4. Configure environment variables for the email fetching API
5. Start the server:
```bash
rails server
```

## Contributing

This is a work in progress as part of a Rails learning journey. I welcome any contributions or suggestions!

### License: Apache 2.0





