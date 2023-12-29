<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Account</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            background-image: url('https://www.teahub.io/photos/full/333-3334668_csfoto-7x5ft-background-for-cucumber-vegetables-on-green.jpg');
            background-size: cover;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color:  #4CAF50;
            color: Black;
            background-image: url('');
            background-size: cover;
            background-position: center;
            padding: 20px;
            border-radius: 10px;
            width: 400px; /* Adjust the width as needed */
        }

        .regbox {
            background-color: ; /* Background color with some opacity */
            text-align: center;
            padding: 20px; /* Add padding to create space between content and background */
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .avatar {
            width: 100px; /* Adjust the width as needed */
            height: auto;
            border-radius: 50%;
        }

        form {
            width: 100%;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #2E7D32;
            color: black;
            cursor: pointer;
        }

        a {
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="regbox box">
            <img class="avatar" src="https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png">
            <h1>Register & Shipping Details</h1>
            <form action="register-servlet" method="post">
                <p>Username</p>
                <input type="text" placeholder="User name" name="name" required>
                <p>Useremail</p>
                <input type="text" placeholder="User email" name="email" required>
                <p>Address</p>
                <input type="text" placeholder="Shipping Address" name="address" required>
                <p>Phone</p>
                <input type="text" placeholder="Phone Number" name="phone-number" required>
                <p>Password</p>
                <input type="password" placeholder="Password" name="password" required>
                <input type="submit" value="Register">
                <a href="Login.jsp">Already have an Account?</a>
            </form>
        </div>
    </div>
</body>
</html>
