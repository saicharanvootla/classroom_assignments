function changeFormat(n) {
    if (n == 1) {
        document.getElementById("style").href = "Format1.css";

    }
    else if (n == 2) {
        document.getElementById("style").href = "Format2.css";
    }
    else if (n == 3) {
        document.getElementById("style").href = "Format3.css";
    }

}
function validateForm() {
    let empId = document.getElementById("empid").value;
    if (empId === "") {
        alert("Please enter a valid Employee ID.");
        return false;
    }
}
