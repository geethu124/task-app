Clone Repository
Setup Configuration - Sql file is in the route folder
Postman collection file is inside the root folder
Check the APIs
Start the queue worker -  php artisan queue:work
Run the command for scheduler - php artisan schedule:run
Run the command to make the pending and over due tasks expired - php artisan app:expire-pending-tasks
Email setups are in the .env file
Execution time for every APIs will be in the laravel.log file
