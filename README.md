# Price-Comparator
The project involves the development of a Price Comparator tool, allowing users to compare prices across various e-commerce sites. Python web scraping techniques are employed to gather data from different platforms. The scraping script is hosted using Django, creating an API. This API is seamlessly integrated into a Flutter web application, providing users with a user-friendly interface to efficiently compare prices and make informed purchasing decisions across multiple e-commerce platforms.

## Tech Stack 📎

<div>
  <img src="https://skillicons.dev/icons?i=flutter,dart,python,django"/>  
</div>

## Demo 📹

[Demo Video.webm](https://github.com/Aaditya1612/Price-Comparator/assets/83654180/5dadd07f-83bc-4830-9ab4-81609a390248)

## Project Structure

The project is organized into two main folders:

1. **app/price_comparator**: Contains the Flutter web application.

2. **extractorapi**: Contains the Python Django scripts along with the `requirements.txt` file.

## Running the Application

### 1. Setting up the Django API (extractorapi)

1. Navigate to the `extractorapi` directory:

    ```bash
    cd extractorapi
    ```

2. Install the required dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3. Run the Django development server:

    ```bash
    python manage.py runserver
    ```

   This will start the Django server on localhost.

### 2. Running the Flutter Web App (app/price_comparator)

1. Navigate to the `app/price_comparator` directory:

    ```bash
    cd app/price_comparator
    ```

2. Install the Flutter dependencies:

    ```bash
    flutter pub get
    ```

3. Open the `lib/pages/comparisonpage.dart` file and ensure that the URL variable is set to the Django API's localhost URL. Update the following line if necessary:

    ```dart
    // lib/pages/comparisonpage.dart
    String url = "http://localhost:8000/v1/fetch/?pname=";  // Update the localhost port as needed
    ```

4. Run the Flutter web application:

    ```bash
    flutter run -d web
    ```

   This will launch the web application locally.

### Accessing the Application

Visit the localhost port number where the web app has fired up in your web browser.


## Contributing

If you would like to contribute to the project, please follow the standard Git workflow:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature/new-feature`.
3. Commit your changes: `git commit -m "Description of changes."`.
4. Push the branch to your fork: `git push origin feature/new-feature`.
5. Open a pull request with a detailed description of your changes.

Feel free to reach out if you have any questions or encounter issues.


