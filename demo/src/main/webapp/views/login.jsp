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
                <h1>Login Form</h1>
                <label for="username">Username : </label>
                <input type="text" name="username" id="username"><br>
                <label for="password">Password : </label>
                <input type="text" name="password" id="password"><br>
                <button style="width: 300px;" id="login">Login</button>
                <span id="authSpan"></span>
                <div style="margin-top: 50px;">

                    <label for="">Don't Have an Account...?</label>
                    <a href="/reg-page">
                        REGISTER</a>

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

document.querySelector('#login').addEventListener('click',function(){
    let username = document.querySelector('#username').value;
    let password = document.querySelector('#password').value;
    
    let obj = {
        username,
        password
    }

    console.log("OBJ :",obj);

    makeAjaxRequest('/auth', "POST", obj)
            .then(function(response) {
                console.log(response.page);
                if(response.page=="dashboard"){
                    document.location.href = "/dashboard";
                }else{
                    document.querySelector('#authSpan').innerHTML = "Failed !"
                }
            })
            .catch(function(error) {
                console.error("Error:", error);
            });

})
</script>
</html>