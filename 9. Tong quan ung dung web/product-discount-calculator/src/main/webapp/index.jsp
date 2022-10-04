<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<style type="text/css">
    .login {
        height:300px; width:500px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
    }
    .login input {
        padding:5px; margin:5px
    }
    .login .inp {
        width: 400px;
    }
</style>
<body>
<form method="post" action="/display-discount">
    <div class="login">
        <h2>Product Discount Calculator</h2>
        <input class="inp" type="text" name="productDescription" size="50"  placeholder="Product Description:" />
        <input class="inp" type="number" name="listPrice" size="50" placeholder="List Price: " />
        <input class="inp" type="number" name="discountPercent" size="50" placeholder="Discount Percent: (%) " />
        <input type="submit" value="Calculate Discount"/>
    </div>
</form>
</body>
</html>