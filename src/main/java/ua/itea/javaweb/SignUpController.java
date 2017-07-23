package ua.itea.javaweb;

import java.sql.SQLException;

public class SignUpController {

	private String loginResult;
	private String passwordResult;
	private String confirmedPasswordResult;
	private String nameResult;
	private String ageResult;
	private String continentResult;
	private String genderResult;
	private String feedbackResult;
	private String agreementResult;
	private String submitResult;

	private String login;
	private String password;
	private String confirmedPassword;
	private String name;
	private String age;
	private String continent;
	private String gender;
	private String feedback;
	private String agreement;

	private int currentUserId;

	private boolean errorForm = false;

	private final int MAX_AGE = 300;
	private final int MIN_LENGTH_PASSWORD = 6;
	private final String EMPTY_ERROR_MESSAGE = "This field is required.";
	private final String EMAIL_REGISTERED_ERROR_MESSAGE = "Email address already registered.";
	private final String EMAIL_INVALID_ERROR_MESSAGE = "Email address is invalid.";
	private final String EMAIL_TRY_ERROR_MESSAGE = "Failed to verify Email address.";
	private final String SHORT_PASSWORD_ERROR_MESSAGE = "Password is too short.";
	private final String DIFFERENT_PASSWORD_ERROR_MESSAGE = "Passwords are different.";
	private final String AGE_INVALID_ERROR_MESSAGE = "Age is invalid.";
	private final String FAIL_MESSAGE = "Registration failed.";
	private final String SUCCESS_MESSAGE = "Registered successfully.";


	public SignUpController(){
	
	}

	public void setCurrentUserId(int currentUserId) {
		this.currentUserId = currentUserId;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setConfirmedPassword(String confirmedPassword) {
		this.confirmedPassword = confirmedPassword;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}

	public String getLoginResult() {
		if(login != null) {
			if (login.equals("")) {
				errorForm = true;
				loginResult = EMPTY_ERROR_MESSAGE;
			}else{
				try{
					DBWorker worker = new DBWorker();
					if(worker.checkLogin(login) != null) {
						if(currentUserId != 0) {
							if(currentUserId == worker.checkLogin(login).getId()) {
								loginResult = "";
							}
						}else {
							errorForm = true;
							loginResult = EMAIL_REGISTERED_ERROR_MESSAGE;
						}
					} else {
						EmailValidator validator = new EmailValidator();
						if (validator.validate(login)) {
							loginResult = "";
						} else {
							errorForm = true;
							loginResult = EMAIL_INVALID_ERROR_MESSAGE;
						}
					}
					worker.closeAll();
				}catch(InstantiationException e){
					errorForm = true;
					loginResult = EMAIL_TRY_ERROR_MESSAGE;
				}catch(ClassNotFoundException e){
					errorForm = true;
					loginResult = EMAIL_TRY_ERROR_MESSAGE;
				}catch(IllegalAccessException e){
					errorForm = true;
					loginResult = EMAIL_TRY_ERROR_MESSAGE;
				}catch(SQLException e){
					errorForm = true;
					loginResult = EMAIL_TRY_ERROR_MESSAGE;
				}
			}
		}else{
			loginResult = "";
		}
		return loginResult;
	}

	public String getPasswordResult() {
		if(password != null) {
			if (password.equals("")) {
				errorForm = true;
				passwordResult = EMPTY_ERROR_MESSAGE;
			}else{
				if(password.length() < MIN_LENGTH_PASSWORD){
					errorForm = true;
					passwordResult = SHORT_PASSWORD_ERROR_MESSAGE;
				}else{
					if(password.equals(confirmedPassword)){
						passwordResult = "";
					}else{
						errorForm = true;
						passwordResult = DIFFERENT_PASSWORD_ERROR_MESSAGE;
					}
				}
			}
		}else{
			passwordResult = "";
		}
		return passwordResult;
	}

	public String getConfirmedPasswordResult() {
		if(confirmedPassword != null) {
			if (confirmedPassword.equals("")) {
				errorForm = true;
				confirmedPasswordResult = EMPTY_ERROR_MESSAGE;
			}else{
				if(confirmedPassword.length() < MIN_LENGTH_PASSWORD){
					errorForm = true;
					confirmedPasswordResult = SHORT_PASSWORD_ERROR_MESSAGE;
				}else{
					if(confirmedPassword.equals(password)){
						confirmedPasswordResult = "";
					}else{
						errorForm = true;
						confirmedPasswordResult = DIFFERENT_PASSWORD_ERROR_MESSAGE;
					}
				}
			}
		}else{
			confirmedPasswordResult = "";
		}
		return confirmedPasswordResult;
	}

	public String getNameResult() {
		nameResult = emptyCheck(name);
		return nameResult;
	}

	public String getAgeResult() {
		if(age != null) {
			if(age.equals("")) {
				errorForm = true;
				ageResult = EMPTY_ERROR_MESSAGE;
			}else{
				try{
					if(Integer.parseInt(age) <= MAX_AGE){
						ageResult = "";
					}else{
						errorForm = true;
						ageResult = AGE_INVALID_ERROR_MESSAGE;
					}
				}catch (NumberFormatException e) {
					errorForm = true;
					ageResult = AGE_INVALID_ERROR_MESSAGE;
				}
			}
		}else{
			ageResult = "";
		}
		return ageResult;
	}

	public String getContinentResult() {
		continentResult = emptyCheck(continent);
		return continentResult;
	}

	public String getGenderResult() {
		genderResult = emptyCheck(gender);
		return genderResult;
	}

	public String getFeedbackResult() {
		feedbackResult = emptyCheck(feedback);
		return feedbackResult;
	}

	public String getAgreementResult() {
		agreementResult = emptyCheck(agreement);
		return agreementResult;
	}

	public String getSubmitResult() {
		if(loginResult != null) {
			if(errorForm) {
				submitResult = FAIL_MESSAGE;
			}else {
				submitResult = SUCCESS_MESSAGE;
			}
		}else{
			submitResult = "";
		}
		return submitResult;
	}

	public boolean isErrorForm() {
		return errorForm;
	}

	String emptyCheck(String field){
		if(field != null) {
			if (field.equals("")) {
				errorForm = true;
				return EMPTY_ERROR_MESSAGE;
			}else{
				return "";
			}
		}else{
			return "";
		}
	}
}
