<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VIEW ALL POST</title>
</head>
<body>
    <body>
        <div style="padding: 20px;" id="post-div">

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


    makeAjaxRequest('/get-all-me', "POST")
            .then(function(response) {
                console.log(response);
                for(obj of response){
                let div = `            
                    <div style="border: 2px solid; width: 300px; height: 200px; display: flex; justify-content: center; align-items: center;">
                        <label for="post">Post : </label>
                        <h2>${obj.post}</h2>
                        <b>Created By :</b> ${obj.created_by}
                        <b>Created Date :</b> ${obj.created_date}
                    </div>`
                document.querySelector('#post-div').insertAdjacentHTML('afterend', div);
                }

            })
            .catch(function(error) {
                console.error("Error:", error);
            });

</script>
</html>