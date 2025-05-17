<!DOCTYPE html>
<html lang="en">
{% load static %}

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin_Panel</title>
  <script src="https://kit.fontawesome.com/454c257758.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/454c257758.js" crossorigin="anonymous"></script>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f5f5f5;
      background-image: url("{% static 'final/1.jpg' %}");
      background-size: cover;


      /* Adjust how the image fits within the div */
      background-position: center;
      /* Position the image at the center of the div */
      background-repeat: no-repeat;
      font-family: Arial, sans-serif;
    }

    .form-field {
      text-align: left;
      margin-left: 20px;
    }

    .container {
      width: 300px;
      border: 2px solid #ccc;
      padding: 20px;
      text-align: center;
      border-radius: 20px;
      /* background-color: #fff; */
      background-color: rgba(255, 255, 255, 0.7);
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
        0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .button-group button {
      padding: 10px 20px;
      font-size: 16px;
      margin: 5px;
      cursor: pointer;
      border: none;
      border-radius: 20px;
      transition: background-color 0.3s;
    }

    .button-group button.active {
      background-color: #333;
      color: #fff;
    }

    .form-section {
      display: none;
      padding: 20px 0;
    }

    .form-section.active {
      display: block;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: calc(100% - 40px);
      padding: 10px;
      margin: 10px 0;
      border: 2px solid #ccc;
      border-radius: 30px;
      outline: none;
    }

    input[type="checkbox"] {
      margin-right: 10px;
    }

    button {
      padding: 12px 40px;
      font-size: 16px;
      border: none;
      border-radius: 30px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #333;
      color: #fff;
    }

    .login-btn {
      margin-top: 15px;
    }

    .password-input {
      position: relative;
      width: calc(100% - 18px);
      margin: 10px 0;
      margin-left: 10px;
      margin-top: 0px;

    }

    .password-input input {
      width: 90%;
      padding: 10px;
      border: 2px solid #ccc;
      border-radius: 30px;
      outline: none;
      border: 2px solid #ccc;
      border-radius: 30px;
      outline: none;
    }

    .password-input i {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      right: 10px;
      padding-right: 5px;
      cursor: pointer;
    }

    .password-input i {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      right: 10px;
      cursor: pointer;
      pointer-events: auto;
      /* Allow clicking on the icon */
    }
  </style>
  <script>
    function toggleForm(formToShow) {
      var loginButton = document.getElementById("login-button");
      var signupButton = document.getElementById("signup-button");
      var loginForm = document.getElementById("login-form");
      var signupForm = document.getElementById("signup-form");

      loginButton.classList.remove("active");
      signupButton.classList.remove("active");
      loginForm.classList.remove("active");
      signupForm.classList.remove("active");

      if (formToShow === "login") {
        loginButton.classList.add("active");
        loginForm.classList.add("active");
      } else {
        signupButton.classList.add("active");
        signupForm.classList.add("active");
      }
    }

    function togglePassword() {
      var passwordInput = document.getElementById("passwordInput");
      var showPasswordIcon = document.getElementById("showPasswordIcon");

      if (passwordInput.type === "password") {
        passwordInput.type = "text";
        showPasswordIcon.classList.remove("fa-eye-slash");
        showPasswordIcon.classList.add("fa-eye");
      } else {
        passwordInput.type = "password";
        showPasswordIcon.classList.remove("fa-eye");
        showPasswordIcon.classList.add("fa-eye-slash");
      }
    }
  </script>
</head>

<body>
  <div class="background">
    <div class="container">
      <header>
        <h2>Administrator Panel</h2>
        <div>
          {% if messages %}
          <ul class="messages">
            {% for message in messages %}
            <li {% if message.tags %} class="{{ message.tags }}" {% endif %}>
              {{ message }}
            </li>
            {% endfor %}
          </ul>
          {% endif %}
        </div>
      </header>
      <div class="hero">
        <div class="button-group">
          <button id="login-button" onclick="toggleForm('login')" class="active">
            Login
          </button>
          <button id="signup-button" onclick="toggleForm('signup')">
            Signup
          </button>
        </div>
        <div id="login-form" class="form-section active">
          <form action="/gchalo/login/" method="post">
            {% csrf_token %}
            <div class="form-field">
              <label for="id"><i class="fa-solid fa-user fa-sm"></i></label>

            </div>

            <!-- <label for="id">Id</label><br /> -->
            <input type="text" name="id" placeholder="Enter your ID" />
            <div class="form-field">
              <label for="passwordInput" ><i class="fa-solid fa-key fa-sm"></i></label><br />
            </div>
            <div class="password-input"><input type="password" id="passwordInput" name="password"
                placeholder="Enter your password" />
              <i id="showPasswordIcon" class="fa-sharp fa-regular fa-eye-slash fa-sm" onclick="togglePassword()"></i>
            </div>

            
            <button class="login-btn">Log In</button>
          </form>
        </div>


        <div id="signup-form" class="form-section">
          <form action="/gchalo/adminsignup/" method="post">
            {% csrf_token %}
            <label for="username">Username</label><br />
            <input type="text" id="username" name="username" placeholder="Enter your username: " required />
            <!-- <label for="email">Email</label><br />
          <input type="email" placeholder="Enter your email" required> -->
            <label for="password">Password</label><br />
            <input type="password" id="password" name="password" placeholder="Enter your password" required />
            <button type="submit">Signup</button>
          </form>
        </div>
      </div>
    </div>
  </div>

</body>

</html>