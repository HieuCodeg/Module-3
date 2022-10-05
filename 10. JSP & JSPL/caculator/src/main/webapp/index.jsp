<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>

<form action="/calculate" method="post">
    <fieldset>
        <legend>Calculator</legend>
    <table>
        <tr>
            <td>First operand:</td>
            <td><input type="text" name="first" /></td>
        </tr>
        <tr>
            <td>Operator: </td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">subtraction</option>
                    <option value="*">multiplication</option>
                    <option value="/">division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand</td>
            <td><input type="text" name="second" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type = "submit" id = "submit" value = "Calculate"/></td>
        </tr>
    </table>
</fieldset>
</form>
</body>
</html>