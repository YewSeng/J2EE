document.addEventListener("DOMContentLoaded", function () {
    const updateUserButton = document.getElementById("updateUserButton");

    if (updateUserButton) {
        updateUserButton.addEventListener("click", function (event) {
            const isValid = formValidation();
            if (!isValid) {
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

// Code to handle errors and form data preservation
window.onload = function() {
    const errorMessages = document.getElementsByClassName("error-message");
    const usernameField = document.getElementById("username");
    const passwordField = document.getElementById("password");

    // Check if there are error messages, indicating a previous validation error
    const hasErrors = Array.from(errorMessages).some((errorMsg) => errorMsg.innerHTML.trim() !== '');

    if (hasErrors) {
        // Preserve the entered username and password
        const enteredUser = sessionStorage.getItem("enteredUser");
        const enteredPassword = sessionStorage.getItem("enteredPassword");

        // Populate the input fields if values are available and not null
        if (enteredUser !== null && enteredUser !== "null") {
            usernameField.value = enteredUser;
        }
        if (enteredPassword !== null && enteredPassword !== "null") {
            passwordField.value = enteredPassword;
        }
    } else {
        // Clear the sessionStorage to avoid populating the form fields if no errors
        sessionStorage.removeItem("enteredUser");
        sessionStorage.removeItem("enteredPassword");
    }
}

function submitForm() {
    const userField = document.getElementById("username");
    const passwordField = document.getElementById("password");
    
    // Get the values
    const user = userField.value;
    const password = passwordField.value;

    // Save the values in sessionStorage
    sessionStorage.setItem("enteredUser", user);
    sessionStorage.setItem("enteredPassword", password);

    // Submit the form
    document.getElementById("updateUserButton").submit();
}

function togglePasswordVisibility(checkboxId, passwordFieldId) {
    const checkbox = document.getElementById(checkboxId);
    const passwordField = document.getElementById(passwordFieldId);
    passwordField.type = checkbox.checked ? 'text' : 'password';
}

// Function to clear fields if they are empty
function clearEmptyFields() {
    const userField = document.getElementById("username");
    const passwordField = document.getElementById("password");

    if (userField.value.trim() === "") {
        userField.value = "";
    }

    if (passwordField.value.trim() === "") {
        passwordField.value = "";
    }
}

