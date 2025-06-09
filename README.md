# Cosmetic Shop

A Java Servlet-based web application for managing a cosmetic shop.

## Technologies Used
- Java Servlet
- JSP
- JDBC
- MySQL
- HTML/CSS/JavaScript

## Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/your-username/CosmeticShop.git
```

2. Import the project into your IDE (NetBeans recommended)

3. Set up the database:
- Create a MySQL database
- Run the `script.sql` file to create necessary tables

4. Configure the database connection in `src/java/db/DBContext.java`

5. Build and run the project:
```bash
ant war
```

## Deployment
The application is automatically built and deployed using GitHub Actions when changes are pushed to the main branch.

## License
This project is licensed under the MIT License. 