#!/usr/bin/env php
<?php
// CGI 必须输出 Content-type 头，注意是 echo 而不是 header()
echo "Content-type: text/html\n\n";

// Get form data
$name = isset($_GET['name']) ? htmlspecialchars($_GET['name']) : '';
$email = isset($_GET['email']) ? htmlspecialchars($_GET['email']) : '';
$submitted = !empty($name) || !empty($email);

?>
<!DOCTYPE html>
<html>
<head>
    <title>PHP Form Handler</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #e74c3c, #f39c12);
            color: white;
            margin: 0;
            padding: 40px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 15px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .result {
            background: rgba(0,255,0,0.2);
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border: 2px solid rgba(0,255,0,0.3);
        }
        form {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 10px;
        }
        .form-group {
            margin: 15px 0;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background: #27ae60;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background: #229954;
        }
        .back-link {
            text-align: center;
            margin-top: 30px;
        }
        .back-link a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>PHP Form Handler</h1>
        
        <?php if ($submitted && $name && $email): ?>
            <div class="result">
                <h3>Form Submitted Successfully!</h3>
                <p><strong>Name:</strong> <?php echo $name; ?></p>
                <p><strong>Email:</strong> <?php echo $email; ?></p>
                <p><strong>Time:</strong> <?php echo date('H:i:s'); ?></p>
            </div>
        <?php endif; ?>
        
        <form method="GET">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" value="<?php echo $name; ?>" placeholder="Enter your name">
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="Enter your email">
            </div>
            <button type="submit">Submit Form</button>
        </form>
        
        <div class="back-link">
            <a href="/">Back to Home</a>
        </div>
    </div>
</body>
</html>