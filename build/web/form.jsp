
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Wedding Booking Form</title>
  <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Raleway', sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      align-items: center; /* Center horizontally */
      justify-content: center; /* Center vertically */
      height: 100vh; /* Set the height of the body to the full height of the viewport */
      background: url('background.jpg') center/cover no-repeat; /* Replace 'your-background-image.jpg' with your image file */
      position: relative;
      background-size: cover;
      position: relative;
    }

    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right, rgba(255, 165, 0, 0.8), rgba(255, 165, 0, 0)); /* Orange gradient overlay */
      z-index: -1; /* Send the pseudo-element to the background */
    }

    #withYouTitle {
      font-size: 30px;
      margin-bottom: 20px;
      color: #000000; /* Set text color to black or a suitable color for better visibility on the image */
      position: fixed;
      top: 20px;
      left: 20px;
    }

    form {
      background-color: #fff; /* Solid white background for the form */
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      width: 100%;
      position: relative;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #000; /* Set label text color to black or a suitable color for better visibility on the white background */
    }

    input,
    select {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    button {
      background-color: #333;
      color: #fff;
      padding: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #e74c3c;
    }

    .error-message {
      color: #f00;
      margin-top: 5px;
    }
  </style>
</head>
<body>

  <div id="withYouTitle">WithYou.</div>
  <br>
  <form id="weddingForm" onsubmit="validateForm(event)" method="post" action="Booking">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    
    <label for="package">Package:</label>
    <select id="package" name="package" required>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
    </select>

    <label for="venue">Venue:</label>
    <select id="venue" name="venue" required>
      <option value="1">Venue 1</option>
      <option value="2">Venue 2</option>
      <option value="3">Venue 3</option>
    </select>

    <label for="datetime">Date and Time:</label>
    <input type="datetime-local" id="datetime" name="datetime" required>

    <label for="packs">Number of Guests:</label>
    <input type="number" id="packs" name="numGuest" required>

    <button type="submit">Submit</button>
  </form>
  <div id="errorMessage" class="error-message"></div>

  
  <a href="mainPage.jsp"><button type="button">Go Back</button></a>

  <script>
function validateForm(event) {
  var form = document.getElementById('weddingForm');
  var name = form.elements['name'].value;
  var phone = form.elements['phone'].value;
  var email = form.elements['email'].value;
  var packs = form.elements['numGuest'].value;

  var nameRegex = /^[a-zA-Z\s]+$/;
  var phoneRegex = /^\d{10}$/;
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  var errorMessage = "";

  if (!nameRegex.test(name)) {
    errorMessage += "Invalid name. ";
  }

  if (!phoneRegex.test(phone)) {
    errorMessage += "Invalid phone number. ";
  }

  if (!emailRegex.test(email)) {
    errorMessage += "Invalid email address. ";
  }

  if (isNaN(packs) || packs <= 0) {
    errorMessage += "Invalid number of guests. ";
  }

  var errorContainer = document.getElementById('errorMessage');
  errorContainer.innerHTML = errorMessage; // Display error messages

  if (errorMessage !== "") {
    event.preventDefault();
  }
}

  </script>
</body>
</html>
