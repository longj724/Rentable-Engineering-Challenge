# Property Parser

A Ruby on Rails application that parses an XML feed of properties, filters for properties in Madison, and displays them in a web interface.

## Requirements

For local development:

- Ruby 3.2.2
- Rails 7.1.5
- PostgreSQL

For Docker:

- Docker Desktop

## Setup Instructions

A `.env` file is required for both of the following setup options.
Create a `.env` file in the root directory. Sample values can be copied over from the `sample-env.txt` file.

### Option 1: Run in Docker

1. **Install Docker and Docker Compose:**

   - **Docker Desktop** (includes Docker Engine and Docker Compose):
     - [Windows](https://docs.docker.com/desktop/install/windows-install/)
     - [macOS](https://docs.docker.com/desktop/install/mac-install/)
     - [Linux](https://docs.docker.com/desktop/install/linux-install/)

2. Clone the repository:

   ```bash
   git clone <repository-url>
   cd Rentable-Engineering-Challenge
   ```

3. Build and start the Docker containers:

   ```bash
   docker-compose up --build
   ```

4. Visit `http://localhost:3000/` in your browser

### Option 2: Run Locally

1. **Install Prerequisites:**

   - **Ruby 3.2.2**: Install using [rbenv](https://github.com/rbenv/rbenv#installation), [RVM](https://rvm.io/rvm/install), or [asdf](https://asdf-vm.com/guide/getting-started.html)
   - **PostgreSQL**: [Download and install](https://www.postgresql.org/download/) for your operating system
     - macOS: `brew install postgresql` (using [Homebrew](https://brew.sh/))
     - Windows: Use the [installer](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
   - **Rails 7.1.5**: After installing Ruby, run `gem install rails -v 7.1.5`

2. Clone the repository:

   ```bash
   git clone <repository-url>
   cd Rentable-Engineering-Challenge
   ```

3. Install dependencies:

   ```bash
   bundle install
   ```

4. Create and setup the database:

   ```bash
   rails db:prepare
   ```

5. Start the Rails server:

   ```bash
   rails server
   ```

6. Visit `http://localhost:3000/` in your browser

## Parsing the Property Feed

### Option 1: Using the Rake Task

Run the following command to import properties from the XML feed:

If using Docker:

```bash
docker-compose run --rm web bin/rails properties:import
```

If running locally:

```bash
rails properties:import
```

### Option 2: Using the Background Job

1. Ensure your Rails server is running
2. Go to the properties index page at `http://localhost:3000`
3. Click the "Parse Property Feed" button

## Technical Details

This application:

1. Parses the property feed from the `lib/data/sample_abodo_feed.xml` file
2. Extracts property information (ID, name, email, bedrooms) for properties in Madison
3. Stores the data in a PostgreSQL database
4. Provides a web interface to view the properties
5. Uses Tailwind CSS for styling via CDN

## Extra Credit Features

- Parses and displays number of bedrooms for each property
- Includes Docker configuration for containerized deployment
- Implements a background job using Solid Queue for parsing the property feed asynchronously
  - The status of jobs can be viewed at `http://localhost:3000/jobs`

## Key File Overview

- `app/services/property_feed_parser.rb`: Service for parsing the XML feed
- `app/jobs/import_properties_job.rb`: Background job for importing properties
- `app/controllers/property_feed_controller.rb`: Controller for triggering the property feed job
- `lib/tasks/import.rake`: Rake task for parsing the property feed and adding the properties to the database
