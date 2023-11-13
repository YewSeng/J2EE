document.addEventListener("DOMContentLoaded", function () {
    const registerButton = document.getElementById("registerButton");

    if (registerButton) {
        registerButton.addEventListener("click", function (event) {
            if (!formValidation()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    }
});

function formValidation() {
    console.log("formValidation function called!");
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    let usernameError = '';
    let passwordError = '';

    document.getElementById("usernameError").innerHTML = '';
    document.getElementById("passwordError").innerHTML = '';

    if (username.length < 8) {
        usernameError = "Username must contain at least 8 characters!";
        document.getElementById("usernameError").innerHTML = usernameError;
    }

    if (password.length < 8) {
        passwordError = "Password must contain at least 8 characters!";
        document.getElementById("passwordError").innerHTML = passwordError;
    } else if (!/(?=.*[A-Z])(?=.*\d)(?=.*@).{8,}$/.test(password)) {
        passwordError = "Password should contain at least 1 Uppercase letter, 1 digit, and a '@' symbol!";
        document.getElementById("passwordError").innerHTML = passwordError;
    }

    // Check if there are any error messages
    if (usernameError || passwordError) {
        return false;
    }

    return true;
}
