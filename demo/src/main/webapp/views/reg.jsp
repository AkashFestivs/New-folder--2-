<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <body>
        <div style="display: flex; justify-content: center; align-items: center; width: 100vw; height: 100vh;">
            <div style="border: 2px solid; width: 40%; height: 80%; justify-content: center; align-items: center; padding: 10px; display: flex; flex-direction: column;">
                <h1>REGISTRATION FORM</h1>
                <label for="username">Username : </label>
                <input type="text" name="username" id="username"><br>
                <label for="password">Password : </label>
                <input type="text" name="password" id="password"><br>
                <label for="email">Email : </label>
                <input type="text" name="email" id="email"><br>
                <label for="phone">Phone No : </label>
                <input type="text" name="phone" id="phone"><br>
                <label for="role">Select Role :</label>
                <select name="role" id="role" style="width: 170px;">
                    <option value="0">-- SELECT --</option>
                    <option value="user">USER</option>
                    <option value="admin">ADMIN</option>
                </select><br><br>
                <button style="width: 300px;" id="reg">Register</button>

                <div style="margin-top: 50px;">

                    <label for="">Already have an account...?</label>
                    <a href="/login">Login</a>

                </div>

            </div>
        </div>
    </body>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function makeAjaxRequest(url, method, requestData) {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: url,
            type: method,
            data: JSON.stringify(requestData),
            dataType: "json", 
            contentType: "application/json",
            success: function(response){
                resolve(response);
            },
            error: function(xhr, status, error){
                reject(error);
            }
        });
    });
}

document.querySelector('#reg').addEventListener('click',function(){
    let username = document.querySelector('#username').value;
    let password = document.querySelector('#password').value;
    let email = document.querySelector('#email').value;
    let phone = document.querySelector('#phone').value;
    let role = document.querySelector('#role').value;
    
    let obj = {
        username,
        password,
        email,
        phone,
        role
    }

    console.log("OBJ :",obj);

    makeAjaxRequest('/reg-insert', "POST", obj)
            .then(function(response) {
                console.log(response);
                if(response.message=="success"){
                    document.location.href = "/login";
                }else{
                    document.location.href = "/loginFailedToRegister";
                }
            })
            .catch(function(error) {
                console.error("Error:", error);
            });

})
</script>
</html>