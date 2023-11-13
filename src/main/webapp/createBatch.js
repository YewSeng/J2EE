document.addEventListener("DOMContentLoaded", function () {
    const createBatchButton = document.getElementById("createBatchButton");

    if (createBatchButton) {
        createBatchButton.addEventListener("click", function (event) {
            const isValid = formValidation();
            if (!isValid) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    }
});

function formValidation() {
    console.log("formValidation function called!");

    const classStartTime = new Date(document.getElementById('classStartTime').value);
    const classEndTime = new Date(document.getElementById('classEndTime').value);

    let classTimeError = '';
    document.getElementById("classTimeError").innerHTML = '';

    // Check if class end time is at least 2 hours after class start time
    const timeDifference = (classEndTime - classStartTime) / (1000 * 60 * 60); // Difference in hours

    if (timeDifference < 2) {
        classTimeError = "Class end time must be at least 2 hours after class start time!";
        document.getElementById("classTimeError").innerHTML = classTimeError;
    }

    // Check if there are any error messages
    if (classTimeError) {
        return false;
    }

    return true;
}
window.onload = function() {
    const errorMessages = document.getElementsByClassName("error-message");
    const classTimeField = document.getElementById("classTimeError");

    // Check if there are error messages, indicating a previous validation error
    const hasErrors = Array.from(errorMessages).some((errorMsg) => errorMsg.innerHTML.trim() !== '');

    if (hasErrors) {
        const enteredClassStartTime = sessionStorage.getItem("enteredClassStartTime");
        const enteredClassEndTime = sessionStorage.getItem("enteredClassEndTime");

        // Populate the input fields if values are available and not null
        if (enteredClassStartTime !== null && enteredClassEndTime !== "null") {
            classStartTimeField.value = enteredclassStartTime;
        }
        if (enteredClassEndTime !== null && enteredClassEndTime !== "null") {
            enteredClassEndTimeField.value = enteredClassEndTime;
        }
    } else {
        // Clear the sessionStorage to avoid populating the form fields if no errors
        sessionStorage.removeItem("enteredClassStartTime");
        sessionStorage.removeItem("enteredClassEndTime");
    }
}

function submitForm() {
    const adminField = document.getElementById("adminUsername");
    const classTimingField = document.getElementById("classTiming");
    const preferenceField = document.getElementById("preference");
    const classStartTimeField = document.getElementById("classStartTime");
    const classEndTimeField = document.getElementById("classEndTime");
    
    
    // Get the values
    const admin = adminField.value;
    const classTiming = classTimingField.value;
	const preference = preferenceField.value;
	const classStartTime = classStartTimeField.value;
	const classEndTime = classEndTimeField.value;
    // Save the values in sessionStorage
    sessionStorage.setItem("enteredAdmin", admin);
    sessionStorage.setItem("enteredClassTiming", classTiming);
    sessionStorage.setItem("enteredPreference", preference);
    sessionStorage.setItem("enteredClassStartTime", classStartTime);
    sessionStorage.setItem("enteredClassEndTime", classEndTime);

    // Submit the form
     document.getElementById("createBatchButton").submit();
}


