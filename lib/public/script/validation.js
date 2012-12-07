function validateDetails() {
  var errorMessageDiv = document.getElementById("errors");
  errorMessageDiv.style.display = "none";
  document.getElementById("ageGroupCell").className="value ageGroup";
  document.getElementById("teamNameCell").className="value ageGroup";
  document.getElementById("managerNameCell").className="value ageGroup";
  document.getElementById("homePhoneCell").className="value ageGroup";
  document.getElementById("mobilePhoneCell").className="value ageGroup";
  document.getElementById("emailAddressCell").className="value ageGroup";

  var errorMessage = "";

  if (!isValidSelection(document.getElementById("age_group"))) {
    document.getElementById("ageGroupCell").className="value errors";
    errorMessage = "<li>Please select an age group</li>";
  }
  if (!hasValue(document.getElementById("team_name").value)) {
    document.getElementById("teamNameCell").className="value errors";
    errorMessage = errorMessage + "<li>Please provide your Team Name</li>";
  }
  if (!hasValue(document.getElementById("manager_name").value)) {
    document.getElementById("managerNameCell").className="value errors";
    errorMessage = errorMessage + "<li>Please enter the Manager's Name</li>";
  }
  if (hasValue(document.getElementById("home_phone").value) && !isValidHomePhone(document.getElementById("home_phone").value)) {
    document.getElementById("homePhoneCell").className="value errors";
    errorMessage = errorMessage + "<li>Please check the home phone number you have provided</li>"
  }
  if (!hasValue(document.getElementById("mobile_phone").value)) {
    document.getElementById("mobilePhoneCell").className="value errors";
    errorMessage = errorMessage + "<li>Please enter a Mobile Phone Number</li>"
  }  else if ( !isValidMobileNumber(document.getElementById("mobile_phone").value)) {
            document.getElementById("mobilePhoneCell").className="value errors";
              errorMessage = errorMessage + "<li>Please check the Mobile Phone number you have provided</li>"
  }
  if (!hasValue(document.getElementById("email_address").value)) {
      document.getElementById("emailAddressCell").className="value errors";
      errorMessage = errorMessage + "<li>Please enter an Email Address</li>"
  }  else if ( !isValidEmailAddress(document.getElementById("email_address").value)) {
              document.getElementById("emailAddressCell").className="value errors";
              errorMessage = errorMessage + "<li>Please check the Email Address you have provided</li>"
  }

  if (errorMessage != "") {
    errorMessage = '<ul id ="error_messages">' + errorMessage + "</ul>";
    errorMessageDiv.innerHTML = errorMessage;
    errorMessageDiv.style.display = "block";
  } else {
      $(".spin").show();
      $(".save").hide();
      var data = $("#form_register").serialize();
      submit_form(data,'/registered');
  }

}

function isValidEmailAddress(emailAddress) {
    return emailAddress.match(/^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/);
}


function removeExcessWhitespace(value) {
    return value.replace(/ +/g,' ').replace(/^\s+/,'').replace(/\s+$/,'');
}

function isValidPostcode(postcode) {
   return  postcode.match(/^[A-PR-UWYZ]((\d(\d|[A-HJKSTUW])?)|([A-HK-Y]\d(\d|[ABEHMNPRV-Y])?))[ ]?\d[ABD-HJLNP-UW-Z]{2}$/);
}

function isValidHomePhone(phoneNumber) {
    phoneNumber = phoneNumber.replace(' ', '')
    return phoneNumber.match(/^(?:(?:(?:01[0-9]{8,9}))|(?:02[0-9]{9}))$/);
}

function isValidMobileNumber(phoneNumber) {
    phoneNumber =  phoneNumber.replace(' ', '');
    return phoneNumber.match(/^0[0-9]{9,10}$/);
}

function hasValue(text) {
   return removeExcessWhitespace(text).length > 0;
}

function isValidSelection(selectedOption) {
    return selectedOption.options[selectedOption.selectedIndex].value != "";
}

function isValidDOB(dob) {
    return isValidDateFormat(dob) && isValidDate(dob);
}

function isValidDateFormat(date) {
    var formatRegEx = /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;

    return date.match(formatRegEx);
}

function isValidDate(date) {
    var dateRegEx = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([//])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;

   return date.match(dateRegEx);
}

