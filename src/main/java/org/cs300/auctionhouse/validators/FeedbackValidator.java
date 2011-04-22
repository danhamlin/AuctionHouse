package org.cs300.auctionhouse.validators;

import org.cs300.auctionhouse.domain.Feedback;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class FeedbackValidator implements Validator {

	public boolean supports(Class<?> arg0) {
		return Feedback.class.isAssignableFrom(arg0);
	}

	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "feedback", "", "Feedback is a required field.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rating", "", "Rating is a required field.");
		Feedback feedback = (Feedback) target;
		if (feedback.getRating() < 1 || feedback.getRating() > 5)
			errors.rejectValue("rating", "", "The rating must be an integer between 1 and 5.");
	}

}
