package com.aquent.crudapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * The client entity corresponding to the "client" table in the database.
 */
public class Client {

    private Integer clientId;

    @NotNull
    @Size(min = 1, max = 50, message = "Company name is required with maximum length of 50")
    private String companyName;

	@NotNull
    @Size(min = 1, max = 50, message = "Website is required with maximum length of 50")
    private String website;

    @NotNull
    @Size(min = 1, max = 50, message = "Phone Number is required with maximum length of 50")
    private String phoneNumber;

    @NotNull
    @Size(min = 1, max = 50, message = "Street address is required with maximum length of 50")
    private String streetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "City is required with maximum length of 50")
    private String city;

    @NotNull
    @Size(min = 2, max = 2, message = "State is required with length 2")
    private String state;

    @NotNull
    @Size(min = 5, max = 5, message = "Zip code is required with length 5")
    private String zipCode;
    
    @NotNull
    @Size(min = 1, max = 50, message = "Mailing Street address is required with maximum length of 50")
    private String mailingAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "Mailing City is required with maximum length of 50")
    private String mailingCity;

    @NotNull
    @Size(min = 2, max = 2, message = "Mailing State is required with length 2")
    private String mailingState;

    @NotNull
    @Size(min = 5, max = 5, message = "Mailing Zip code is required with length 5")
    private String mailingZipCode;
    
    private Integer personWithoutClient;

    public Integer getClientId() {
 		return clientId;
 	}

 	public void setClientId(Integer clientId) {
 		this.clientId = clientId;
 	}

 	public String getCompanyName() {
 		return companyName;
 	}

 	public void setCompanyName(String companyName) {
 		this.companyName = companyName;
 	}

 	public String getWebsite() {
 		return website;
 	}

 	public void setWebsite(String website) {
 		this.website = website;
 	}

 	public String getPhoneNumber() {
 		return phoneNumber;
 	}

 	public void setPhoneNumber(String phoneNumber) {
 		this.phoneNumber = phoneNumber;
 	}
 	
    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    
 	public String getMailingAddress() {
 		return mailingAddress;
 	}

 	public void setMailingAddress(String mailingAddress) {
 		this.mailingAddress = mailingAddress;
 	}

 	public String getMailingCity() {
 		return mailingCity;
 	}

 	public void setMailingCity(String mailingcity) {
 		this.mailingCity = mailingcity;
 	}

 	public String getMailingState() {
 		return mailingState;
 	}

 	public void setMailingState(String mailingstate) {
 		this.mailingState = mailingstate;
 	}

 	public String getMailingZipCode() {
 		return mailingZipCode;
 	}

 	public void setMailingZipCode(String mailingzipCode) {
 		this.mailingZipCode = mailingzipCode;
 	}

	public Integer getPersonWithoutClient() {
		return personWithoutClient;
	}

	public void setPersonWithoutClient(Integer personWithoutClient) {
		this.personWithoutClient = personWithoutClient;
	}
}
