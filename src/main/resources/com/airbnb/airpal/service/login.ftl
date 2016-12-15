<#-- @ftlvariable name="" type="com.airbnb.airpal.service.LoginView" -->

<!DOCTYPE html>
<html>
<style>

    form {
        border: 3px solid #f1f1f1;
    }

    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }

    .container {
        padding: 16px;
    }
</style>
<body>
<div id="parent" style="width: 350px; margin: 20px auto;">
    <form name="login" action="" method="POST">
        <div class="imgcontainer">
            <h2> Jumbo Login </h2>
        </div>

        <div class="container">
            <label><b>Username</b></label>
            <input type="text" placeholder="Enter Username or Email" name="username" required>

            <label><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required>

            <button type="submit">Login</button>
            <input name="rememberMe" type="checkbox" checked="checked"> Remember me
        </div>

    </form>
</div>

</body>
</html>