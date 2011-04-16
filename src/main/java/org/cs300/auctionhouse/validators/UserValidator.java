package org.cs300.auctionhouse.validators;

import org.cs300.auctionhouse.ui.UserPersonalInfo;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return UserPersonalInfo.class.isAssignableFrom(arg0);
	}

	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.username", "", "Username is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.password", "", "Password is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "", "Confirm password is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.firstName", "", "First name is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.lastName", "", "Last name is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.address1", "", "Address 1 is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.city", "", "City is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.state", "", "State is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.country", "", "Country is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.zipcode", "", "Zipcode is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.phoneNumber", "", "Phone number is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalInfo.emailAddress", "", "Email address is required field");

		UserPersonalInfo upi = (UserPersonalInfo)target;
		if (!upi.getUser().getPassword().equals(upi.getConfirmPassword())) {
			errors.rejectValue("user.password", "", "The passwords you entered do not match. Try again.");
		}
		if (!upi.getPersonalInfo().getZipcode().matches("\\d{5}(-\\d{4})?")) {
			errors.rejectValue("personalInfo.zipcode", "", "You did not enter a valid zipcode. Try again.");
		}
		if (!upi.getPersonalInfo().getPhoneNumber().matches("^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$")){
			errors.rejectValue("personalInfo.phoneNumber", "", "You did not enter a valid phone number. Try again.");
		}
		if (!upi.getPersonalInfo().getEmailAddress().matches("^[\\w\\-]([\\.\\w])+[\\w]+@([\\w\\-]+\\.)+[A-Z]{2,4}$")) {
			errors.rejectValue("personalInfo.emailAddress", "", "You did not enter a valid email address. Try again.");
		}
	}

}
