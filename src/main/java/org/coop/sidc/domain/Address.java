package org.coop.sidc.domain;

import javax.persistence.Embeddable;
import org.hibernate.validator.constraints.NotEmpty;

@Embeddable
public class Address {
//	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	private Long id;
	private String street;
	
	@NotEmpty(message="City is required.")
	private String city;
	
	@NotEmpty(message="State is required.")
	private String state;
	
	@NotEmpty(message="Zip is required.")
	private String zip;
	
	@NotEmpty(message="Country is required.")
	private String country;
	
	
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
