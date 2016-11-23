package org.coop.sidc.service;

import java.util.List;

import org.coop.sidc.domain.Credential;

public interface CredentialService {
	public Credential save(Credential credential);
	public List<Credential> getList();
	public Credential get(Long id);
	public void delete(Long id);
	public Credential findByUsername(String username);	
}
