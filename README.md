# Golden Chore

Golden Chore is an application to match young people and old people so that young people can help old people do chores or other stuff. It has both web and mobile ends. Currently, the web end mainly targets old people. Here is code for web side.

It is developed on node 5.9.1 & npm 3.7.3.

[link to GitHub repository](https://github.com/taowu100/GoldenChore)

### Implementation

To implement this application in your local environment, you need to have a SQL database.

Apply "createTables.sql" and "insertData.sql" (will load some test data) in "Database" directory to the database. (The syntax of the two files is based on MariaDB 10.0.17.)

Install Node.js in your local environment. You can download it from [Node.js website](https://nodejs.org/en/download/).

Enter "GoldenChore" directory (the one in the second level) from your command shell. (On Windows, you can use the Command Prompt (cmd.exe) or Powershell.)

Then install all dependencies:

```sh
$ npm install
```

Run the application:

```sh
$ npm start
```

Open the particular link in your browser. (Note: [link to homepage on the default setting of Node.js](http://localhost:3000/home))

### Features

 - Login & sign-up
 - Check "my requests/tasks"
 - Post a new service/chore request/task
 - Some instructions

### Todos

 - Check signees for each request/task
 - Password retrieval through email
 - Delete a request
 - Add login box in the index
 - Map view
 - More instructions
 - Make links more secure
 - Add code comments
 - More features for young people
