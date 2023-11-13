window.onload = function() {
    // Get values from sessionStorage if available
    var enteredUser = sessionStorage.getItem("enteredUser");
    var enteredPassword = sessionStorage.getItem("enteredPassword");

    // Populate the input fields if values are available and not null
    if (enteredUser !== null && enteredUser !== "null") {
        document.getElementById("username").value = enteredUser;
    }
    if (enteredPassword !== null && enteredPassword !== "null") {
        document.getElementById("password").value = enteredPassword;
    }
};

function submitForm() {
    var userField = document.getElementById("username");
    var passwordField = document.getElementById("password");
    
    // Get the values
    var user = userField.value;
    var password = passwordField.value;

    // Save the values in sessionStorage
    sessionStorage.setItem("enteredUser", user);
    sessionStorage.setItem("enteredPassword", password);

    // Submit the form
    document.getElementById("loginForm").submit();
}

function togglePasswordVisibility(checkboxId, passwordFieldId) {
    var checkbox = document.getElementById(checkboxId);
    var passwordField = document.getElementById(passwordFieldId);
    passwordField.type = checkbox.checked ? 'text' : 'password';
}

// Function to clear fields if they are empty
function clearEmptyFields() {
    var userField = document.getElementById("username");
    var passwordField = document.getElementById("password");

    if (userField.value.trim() === "") {
        userField.value = "";
    }

    if (passwordField.value.trim() === "") {
        passwordField.value = "";
    }
}

// Call the function to clear empty fields on window load
window.onload = function() {
    clearEmptyFields();
};
