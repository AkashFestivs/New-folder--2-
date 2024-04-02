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
                <h1>CREATE POST</h1>
                <span id="message"></span>
                <label for="post">Post : </label>
                <input type="text" name="postInput" id="postInput"><br>
                <button style="width: 300px;" id="post">Create Post</button><br>
                <a href="/view-post"><button style="width: 300px;" id="view">View Post</button></a><br>
                <a href="/view-all-post"><button style="width: 300px;" id="view-other">View Other's Post</button><br></a>

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

document.querySelector('#post').addEventListener('click',function(){
    let postInput = document.querySelector('#postInput').value;
    
    let obj = {
        postInput
    }

    console.log("OBJ :",obj);

    makeAjaxRequest('/create-post', "POST", obj)
            .then(function(response) {
                console.log(response.page);
            })
            .catch(function(error) {
                console.error("Error:", error);
            });

})
</script>
</html>