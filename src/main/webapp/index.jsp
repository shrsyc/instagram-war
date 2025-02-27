<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello DevOps</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .image-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        img {
            width: 200px; /* Adjust size as needed */
            height: auto;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <h1>Hello DevOps</h1>
    <div class="image-container">
        <img src="https://media.licdn.com/dms/image/v2/D5603AQGPLlVm7nUpKQ/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1688133732925?e=1746057600&v=beta&t=OlI6SXz0MGF6LY3fA7hb5a6uWB7fOfaDguuI3IL-UFw" alt="DevOps Image">
        <img src="https://media.licdn.com/dms/image/v2/D4E03AQHdlai2u8dGBA/profile-displayphoto-shrink_800_800/B4EZPodzQ5HgAc-/0/1734771947477?e=1746057600&v=beta&t=qjnExS_t-583dcyS2ZjdUyDRR-M4_u7JH2KYFzL-EiQ" alt="CI/CD Pipeline">
        
    </div>
</body>
</html>
