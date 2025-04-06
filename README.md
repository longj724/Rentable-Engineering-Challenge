# Property Parser

A Ruby on Rails application that parses an XML feed of properties, filters for properties in Madison, and displays them in a web interface.

## Requirements

- Ruby 3.2.2
- Rails 7.1.5
- PostgreSQL

## Setup Instructions

### Option 1: Run Locally

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd property-parser
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Create and setup the database:

   ```bash
   rails db:prepare
   ```

4. Start the Rails server:

   ```bash
   rails server
   ```

5. Visit `http://localhost:3000/` in your browser

### Option 2: Run in Docker

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd property-parser
   ```

2. Build and start the Docker containers:

   ```bash
   docker-compose up --build
   ```

3. Visit `http://localhost:3000/` in your browser

### Environment Variables

Default values are supplied for all environment variables but you can override them by creating a `.env` file in the root directory based on the `sample-env.txt` file.

## Parsing the Property Feed

### Option 1: Using the Rake Task

Run the following command to import properties from the XML feed:

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
4. Provides a web interface to view and manage the properties
5. Uses Tailwind CSS for styling via CDN

## Extra Credit Features

- Parses and displays number of bedrooms for each property
- Includes Docker configuration for containerized deployment
- Implements a background job using Solid Queue for importing properties asynchronously
  - The status of jobs can be viewed at `http://localhost:3000/jobs`

## Additional Files

- `app/services/property_feed_parser.rb`: Service for parsing the XML feed
- `app/jobs/import_properties_job.rb`: Background job for importing properties
- `app/controllers/property_feed_controller.rb`: Controller for triggering the property feed job
- `lib/tasks/import.rake`: Rake task for importing properties
