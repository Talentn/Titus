[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Talentn_Titus&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=Talentn_Titus)

# Titus
Titus is a Ruby on Rails application that allows users to manage and track expenses.

## Prerequisites

Before running the project, ensure you have the following installed:

- **Ruby 3.1.6**
- **Rails 7.2.1**

## Setup Instructions

1. **Clone the repository**

    Open a terminal and run:
    
    ```bash
    git clone https://github.com/talentn/titus.git
    cd titus

2. **Install the required gems**
   Run the following command to install the necessary dependencies:
    ```bash
    bundle install

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate

4. **Run the tests**
    ```bash
   rails db:migrate RAILS_ENV=test
   rails test

5. **Start the Rails server**
   ```bash
   rails start

## Optional Tools

- **Brakeman**: For security auditing.
- **Rubocop**: For linting Ruby files.

You can run these tools with the following commands:

- To run security audits with Brakeman:

  ```bash
  brakeman

  To run linting with Rubocop:
    ```bash
  bin/rubocop


That's it 
