<?php
// 可选：定义一些动态变量
$server = "nginx";
$doc_url = "http://nginx.org/";
$commercial_url = "http://nginx.com/";
$time = date("Y-m-d H:i:s");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to <?php echo htmlspecialchars($server); ?>!</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #2c3e50; }
        p { line-height: 1.6; }
        .footer { margin-top: 30px; font-size: 0.9em; color: #888; }
    </style>
</head>
<body>
    <h1>Welcome to <?php echo htmlspecialchars($server); ?>!</h1>

    <p>If you see this page, the <?php echo htmlspecialchars($server); ?> web server is successfully installed and working.<br>
    Further configuration is required.</p>

    <p>For online documentation and support please refer to 
       <a href="<?php echo $doc_url; ?>">nginx.org</a>.<br>
       Commercial support is available at 
       <a href="<?php echo $commercial_url; ?>">nginx.com</a>.
    </p>

    <p><em>Thank you for using <?php echo htmlspecialchars($server); ?>.</em></p>

    <div class="footer">
        Page generated at <?php echo $time; ?>
    </div>
</body>
</html>
