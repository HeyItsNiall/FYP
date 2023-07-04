# FYP
This is Laravel 9 version of my fyp project which is Dr Sofa(Furniture Repairing Reservation System)

# Dr Sofa - Furniture Repairing Reservation System

Dr Sofa is a web application built with Laravel 9 that allows users to easily reserve furniture repairing services. With Dr Sofa, customers can schedule appointments, manage their reservations, and track the status of their furniture repairs.

## Features

- User Registration: Customers can create an account to access the reservation system.
- Reservation Management: Customers can view, create, update, and cancel their furniture repair reservations.
- Service Selection: Customers can choose from a variety of furniture repair services provided by Dr Sofa.
- Appointment Scheduling: Customers can select the desired date and time for their furniture repair appointment.
- Status Tracking: Customers can track the progress and status of their furniture repairs.
- Admin Panel: An admin panel is available for system administrators to manage services, appointments, and customer information.

## Installation

1. Clone the repository:

<pre>gh repo clone HeyItsNiall/FYP</pre>

2. Navigate to the project directory:

<pre>cd dr-sofa</pre>

3. Install the dependencies using Composer:

<pre>composer install</pre>

4. Copy the `.env.example` file to `.env`:

<pre>cp .env.example .env</pre>

5. Generate a new application key:

<pre>php artisan key:generate</pre>

6. Configure the database settings in the `.env` file:

<pre>
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
</pre>

7. Run the database migrations and seed the database:

<pre>php artisan migrate</pre>

8. Start the development server:

<pre>php artisan serve</pre>

9. Visit `http://localhost:8000` in your browser to access the application.

## Contributing

Contributions are welcome! If you'd like to contribute to Dr Sofa, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature/bugfix.
3. Make your changes and commit them.
4. Push your changes to your fork.
5. Submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Credits

Dr Sofa is developed by [Dannial](https://github.com/HeyItsNiall/FYP).























